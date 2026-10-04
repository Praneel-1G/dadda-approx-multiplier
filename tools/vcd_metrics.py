#!/usr/bin/env python3
"""Check a multiplier VCD and calculate exhaustive/error metrics.

The parser tracks A/B/P at the DUT scope and evaluates the settled state after
all value changes at each timestamp. It is intentionally dependency-free.

Examples:
  python3 tools/vcd_metrics.py experiments/EXP000_exact_dadda_no_comp/verification/rtl_activity.vcd --scope tb_exact_dadda_without_compressor/dut --exact
  python3 tools/vcd_metrics.py experiments/EXP001_exact_dadda_4to2_comp/verification/rtl_activity.vcd --scope tb_exact_dadda_with_compressor/dut --exact
"""
from __future__ import annotations
import argparse
from collections import defaultdict
from pathlib import Path


def norm_scope(parts):
    return "/".join(parts)


def parse(vcd: Path, wanted_scope: str):
    ids = {}  # identifier -> (fullscope, ref, width)
    scope = []
    header = True
    events = defaultdict(list)
    timestamp = None

    with vcd.open("r", errors="replace") as fh:
        for raw in fh:
            line = raw.rstrip("\n")
            if header:
                if line.startswith("$scope"):
                    parts = line.split()
                    scope.append(parts[2])
                elif line.startswith("$upscope"):
                    if scope:
                        scope.pop()
                elif line.startswith("$var"):
                    parts = line.split()
                    width = int(parts[2])
                    ident = parts[3]
                    ref = parts[4]
                    ids[ident] = (norm_scope(scope), ref, width)
                elif line.startswith("$enddefinitions"):
                    header = False
                continue

            if line.startswith("#"):
                timestamp = int(line[1:])
                continue
            if timestamp is None or not line:
                continue

            if line.startswith("b"):
                parts = line.split()
                if len(parts) == 2 and parts[1] in ids:
                    ident = parts[1]
                    bits = parts[0][1:]
                    val = int(bits.replace("x", "0").replace("z", "0"), 2) if all(c in "01xz" for c in bits.lower()) else None
                    events[timestamp].append((ident, val))
            else:
                ident = line[1:]
                if ident in ids and line[0] in "01xXzZ":
                    val = int(line[0]) if line[0] in "01" else None
                    events[timestamp].append((ident, val))

    wanted = {}
    for ident, (sc, ref, width) in ids.items():
        if sc == wanted_scope and ref in {"A", "B", "P"}:
            wanted[ref] = ident
    missing = {x for x in ("A", "B", "P") if x not in wanted}
    if missing:
        raise SystemExit(f"Missing A/B/P at scope '{wanted_scope}'. Found: {sorted(wanted)}")

    state = {wanted["A"]: None, wanted["B"]: None, wanted["P"]: None}
    prev_ab = None
    samples = []
    unknown = 0

    for ts in sorted(events):
        changed = False
        for ident, val in events[ts]:
            if ident in state:
                if state[ident] != val:
                    changed = True
                state[ident] = val
        a, b, p = state[wanted["A"]], state[wanted["B"]], state[wanted["P"]]
        if a is None or b is None or p is None:
            unknown += 1
            continue
        ab = (a, b)
        if prev_ab is None and ab == (0, 0):
            samples.append((ts, a, b, p))
            prev_ab = ab
        elif ab != prev_ab:
            samples.append((ts, a, b, p))
            prev_ab = ab

    return samples, unknown


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("vcd", type=Path)
    ap.add_argument("--scope", required=True)
    ap.add_argument("--exact", action="store_true", help="return non-zero if any vector differs from A*B")
    ap.add_argument("--out", type=Path)
    args = ap.parse_args()

    samples, unknown = parse(args.vcd, args.scope)
    # Collapse duplicate A/B pairs defensively; retain the last observed value.
    by_pair = {}
    for s in samples:
        by_pair[(s[1], s[2])] = s[3]

    n = len(by_pair)
    errors = []
    sae = 0
    sse = 0
    wce = 0
    rel_sum = 0.0
    rel_n = 0
    max_rel = 0.0

    for (a, b), actual in sorted(by_pair.items()):
        expected = a * b
        err = int(actual) - expected
        if err != 0:
            errors.append((a, b, expected, actual, err))
        ae = abs(err)
        sae += ae
        sse += err * err
        wce = max(wce, ae)
        if expected != 0:
            rel = ae / expected
            rel_sum += rel
            rel_n += 1
            max_rel = max(max_rel, rel)

    text = "\n".join([
        f"VCD: {args.vcd}",
        f"Scope: {args.scope}",
        f"Unique input pairs observed: {n}",
        f"Unknown states/timestamps skipped: {unknown}",
        f"Error count: {len(errors)}",
        f"Error rate: {(len(errors)/n if n else float('nan')):.12g}",
        f"MAE: {(sae/n if n else float('nan')):.12g}",
        f"MSE: {(sse/n if n else float('nan')):.12g}",
        f"WCE: {wce}",
        f"MRE_nonzero: {(rel_sum/rel_n if rel_n else float('nan')):.12g}",
        f"MaxRE_nonzero: {max_rel:.12g}",
    ])
    print(text)
    if errors:
        print("First mismatches:")
        for row in errors[:10]:
            print("  A=%d B=%d expected=%d actual=%d error=%d" % row)

    if args.out:
        args.out.write_text(text + "\n")

    if args.exact:
        if n != 65536:
            raise SystemExit(f"EXACT CHECK FAILED: expected 65,536 unique pairs, found {n}")
        if errors:
            raise SystemExit(f"EXACT CHECK FAILED: {len(errors)} mismatches")
        print("EXACT CHECK: PASS — all 65,536 pairs match A*B")

if __name__ == "__main__":
    main()
