module approx_dadda_d1 (A,
    B,
    P);
 input [7:0] A;
 input [7:0] B;
 output [15:0] P;

 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _040_;
 wire _043_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _129_;
 wire _130_;
 wire _131_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _155_;
 wire _156_;
 wire _157_;
 wire _158_;
 wire _159_;
 wire _160_;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire c10_carry;
 wire c10_cout;
 wire c11_carry;
 wire c11_cout;
 wire c12_carry;
 wire c12_cout;
 wire c13_carry;
 wire c13_cout;
 wire c14_carry;
 wire c1_c10_c1;
 wire c1_c10_cout;
 wire c1_c10_fa_c;
 wire c1_c11_c1;
 wire c1_c11_cout;
 wire c1_c12_c1;
 wire c1_c12_cout;
 wire c1_c13_c1;
 wire c1_c13_cout;
 wire c1_c5_c1;
 wire c1_c7_fa_c;
 wire c1_c8_c1;
 wire c1_c8_c2;
 wire c1_c9_c1;
 wire c1_c9_c2;
 wire c1_c9_cout1;
 wire c1_c9_cout2;
 wire c2_c3_c;
 wire c3_carry;
 wire c4_carry;
 wire c5_carry;
 wire c6_carry;
 wire c7_carry;
 wire c8_cout;
 wire c9_carry;
 wire c9_cout;
 wire \pp[11][0] ;
 wire \pp[15][0] ;
 wire \pp[16][0] ;
 wire \pp[18][0] ;
 wire \pp[1][0] ;
 wire \pp[22][0] ;
 wire \pp[23][0] ;
 wire \pp[29][0] ;
 wire \pp[2][0] ;
 wire \pp[30][0] ;
 wire \pp[31][0] ;
 wire \pp[34][0] ;
 wire \pp[36][0] ;
 wire \pp[37][0] ;
 wire \pp[38][0] ;
 wire \pp[39][0] ;
 wire \pp[41][0] ;
 wire \pp[43][0] ;
 wire \pp[44][0] ;
 wire \pp[45][0] ;
 wire \pp[46][0] ;
 wire \pp[47][0] ;
 wire \pp[48][0] ;
 wire \pp[4][0] ;
 wire \pp[50][0] ;
 wire \pp[51][0] ;
 wire \pp[52][0] ;
 wire \pp[53][0] ;
 wire \pp[54][0] ;
 wire \pp[55][0] ;
 wire \pp[57][0] ;
 wire \pp[58][0] ;
 wire \pp[59][0] ;
 wire \pp[60][0] ;
 wire \pp[61][0] ;
 wire \pp[62][0] ;
 wire \pp[63][0] ;
 wire \pp[8][0] ;
 wire \pp[9][0] ;
 wire \s1_c10_comp.fa1.sum ;
 wire \s1_c10_comp.fa2.sum ;
 wire \s1_c11_comp.fa1.sum ;
 wire \s1_c11_comp.fa2.sum ;
 wire \s1_c12_comp.fa1.sum ;
 wire \s1_c12_comp.fa2.sum ;
 wire \s1_c4_fa.sum ;
 wire \s1_c6_fa.sum ;
 wire \s1_c8_comp1.fa1.sum ;
 wire \s1_c8_comp1.fa2.sum ;
 wire \s1_c8_comp2.fa1.sum ;
 wire \s1_c8_comp2.fa2.sum ;
 wire \s1_c9_comp.fa1.sum ;
 wire \s1_c9_comp.fa2.sum ;
 wire \s1_c9_fa.sum ;
 wire \s2_c10_comp.fa1.sum ;
 wire \s2_c10_comp.fa2.sum ;
 wire \s2_c11_comp.fa1.sum ;
 wire \s2_c11_comp.fa2.sum ;
 wire \s2_c12_comp.fa1.sum ;
 wire \s2_c12_comp.fa2.sum ;
 wire \s2_c13_comp.fa1.sum ;
 wire \s2_c13_comp.fa2.sum ;
 wire \s2_c14_fa.sum ;
 wire \s2_c2_ha.sum ;
 wire \s2_c3_comp.Sum ;
 wire \s2_c4_comp.Sum ;
 wire \s2_c5_comp.Sum ;
 wire \s2_c6_comp.Sum ;
 wire \s2_c7_comp.Sum ;
 wire \s2_c8_comp.fa1.sum ;
 wire \s2_c9_comp.fa1.sum ;
 wire \s2_c9_comp.fa2.sum ;
 wire net97;
 wire net98;
 wire net99;
 wire net100;
 wire net101;
 wire net102;
 wire net103;
 wire net104;
 wire net106;
 wire net107;
 wire net116;
 wire net108;
 wire net109;
 wire net110;
 wire net111;
 wire net112;
 wire net113;
 wire net114;
 wire net115;
 wire net118;
 wire net119;
 wire net120;
 wire net121;
 wire net122;
 wire net123;
 wire net124;
 wire net126;
 wire net127;
 wire net128;
 wire net129;
 wire net130;
 wire net131;
 wire net132;
 wire net133;
 wire net134;
 wire net135;
 wire net136;
 wire net139;
 wire net137;
 wire net138;
 wire net140;
 wire net141;
 wire net142;
 wire net143;
 wire net144;
 wire net145;
 wire net146;
 wire net147;
 wire net148;
 wire net149;
 wire net150;
 wire net151;
 wire net152;
 wire net156;
 wire net155;
 wire net159;
 wire net157;
 wire net158;
 wire net163;
 wire net161;
 wire net162;
 wire net164;
 wire net166;
 wire net96;
 wire net105;
 wire net117;
 wire net125;
 wire net153;
 wire net154;
 wire net160;
 wire net165;
 wire net167;
 wire net168;
 wire net171;
 wire net174;
 wire net178;
 wire net179;
 wire net180;
 wire net181;
 wire net182;
 wire net187;
 wire net193;

 sky130_fd_sc_hd__nand2_8 _174_ (.A(\s2_c9_comp.fa2.sum ),
    .B(_023_),
    .Y(_024_));
 sky130_fd_sc_hd__a211oi_1 _175_ (.A1(net130),
    .A2(_019_),
    .B1(_004_),
    .C1(_018_),
    .Y(_025_));
 sky130_fd_sc_hd__o21ai_2 _176_ (.A1(_005_),
    .A2(_004_),
    .B1(net193),
    .Y(_026_));
 sky130_fd_sc_hd__a2111oi_4 _177_ (.A1(_014_),
    .A2(_017_),
    .B1(net187),
    .C1(_002_),
    .D1(_016_),
    .Y(_027_));
 sky130_fd_sc_hd__o21ai_2 _178_ (.A1(_025_),
    .A2(_026_),
    .B1(_027_),
    .Y(_028_));
 sky130_fd_sc_hd__o211ai_1 _179_ (.A1(_003_),
    .A2(net112),
    .B1(_015_),
    .C1(net103),
    .Y(_029_));
 sky130_fd_sc_hd__a21oi_1 _180_ (.A1(net103),
    .A2(net106),
    .B1(_016_),
    .Y(_030_));
 sky130_fd_sc_hd__nand2_1 _181_ (.A(_029_),
    .B(_030_),
    .Y(_031_));
 sky130_fd_sc_hd__a31oi_4 _182_ (.A1(_028_),
    .A2(net107),
    .A3(_031_),
    .B1(net108),
    .Y(_032_));
 sky130_fd_sc_hd__inv_1 _183_ (.A(_022_),
    .Y(_033_));
 sky130_fd_sc_hd__o21ai_4 _184_ (.A1(_032_),
    .A2(net166),
    .B1(_033_),
    .Y(_034_));
 sky130_fd_sc_hd__a21oi_2 _185_ (.A1(_034_),
    .A2(net101),
    .B1(_006_),
    .Y(_035_));
 sky130_fd_sc_hd__xnor2_1 _186_ (.A(_035_),
    .B(net109),
    .Y(net20));
 sky130_fd_sc_hd__and2_1 _187_ (.A(net145),
    .B(net152),
    .X(\pp[63][0] ));
 sky130_fd_sc_hd__and2_1 _189_ (.A(net145),
    .B(net153),
    .X(\pp[62][0] ));
 sky130_fd_sc_hd__and2_1 _191_ (.A(net8),
    .B(net155),
    .X(\pp[61][0] ));
 sky130_fd_sc_hd__and2_1 _193_ (.A(net145),
    .B(net13),
    .X(\pp[60][0] ));
 sky130_fd_sc_hd__and2_1 _195_ (.A(net145),
    .B(net160),
    .X(\pp[59][0] ));
 sky130_fd_sc_hd__and2_1 _196_ (.A(net145),
    .B(net11),
    .X(\pp[58][0] ));
 sky130_fd_sc_hd__and2_1 _197_ (.A(net145),
    .B(net10),
    .X(\pp[57][0] ));
 sky130_fd_sc_hd__and2_1 _198_ (.A(net152),
    .B(net7),
    .X(\pp[55][0] ));
 sky130_fd_sc_hd__nand2b_4 _199_ (.A_N(_032_),
    .B(net113),
    .Y(_040_));
 sky130_fd_sc_hd__xnor2_2 _200_ (.A(net100),
    .B(_040_),
    .Y(net18));
 sky130_fd_sc_hd__and2_1 _201_ (.A(net153),
    .B(net7),
    .X(\pp[54][0] ));
 sky130_fd_sc_hd__and2_1 _203_ (.A(net162),
    .B(net151),
    .X(\pp[9][0] ));
 sky130_fd_sc_hd__and2_4 _205_ (.A(net157),
    .B(net165),
    .X(\pp[4][0] ));
 sky130_fd_sc_hd__nand2_2 _206_ (.A(_031_),
    .B(net99),
    .Y(_043_));
 sky130_fd_sc_hd__xnor2_1 _207_ (.A(_043_),
    .B(net107),
    .Y(net31));
 sky130_fd_sc_hd__and2_1 _208_ (.A(net155),
    .B(net7),
    .X(\pp[53][0] ));
 sky130_fd_sc_hd__and2_1 _209_ (.A(net13),
    .B(net146),
    .X(\pp[52][0] ));
 sky130_fd_sc_hd__nand2_2 _211_ (.A(net16),
    .B(net4),
    .Y(_045_));
 sky130_fd_sc_hd__nand2_4 _212_ (.A(net154),
    .B(net165),
    .Y(_046_));
 sky130_fd_sc_hd__nand4_1 _213_ (.A(net156),
    .B(net13),
    .C(net151),
    .D(net150),
    .Y(_047_));
 sky130_fd_sc_hd__nand2_1 _214_ (.A(net13),
    .B(net149),
    .Y(_048_));
 sky130_fd_sc_hd__nand2_1 _215_ (.A(net154),
    .B(net151),
    .Y(_049_));
 sky130_fd_sc_hd__nand2_2 _216_ (.A(net156),
    .B(net150),
    .Y(_050_));
 sky130_fd_sc_hd__nand2_1 _217_ (.A(net16),
    .B(net1),
    .Y(_051_));
 sky130_fd_sc_hd__maj3_1 _218_ (.A(_049_),
    .B(_050_),
    .C(_051_),
    .X(_052_));
 sky130_fd_sc_hd__nand2_1 _219_ (.A(_048_),
    .B(_052_),
    .Y(_053_));
 sky130_fd_sc_hd__nand3_1 _220_ (.A(net141),
    .B(net140),
    .C(net139),
    .Y(_054_));
 sky130_fd_sc_hd__o311a_1 _221_ (.A1(net143),
    .A2(_046_),
    .A3(_047_),
    .B1(_053_),
    .C1(_054_),
    .X(c1_c8_c1));
 sky130_fd_sc_hd__nand2_2 _222_ (.A(net145),
    .B(net144),
    .Y(_055_));
 sky130_fd_sc_hd__nand2_1 _223_ (.A(net159),
    .B(net148),
    .Y(_056_));
 sky130_fd_sc_hd__nand2_2 _224_ (.A(net163),
    .B(net146),
    .Y(_057_));
 sky130_fd_sc_hd__nand2_2 _226_ (.A(net11),
    .B(net147),
    .Y(_059_));
 sky130_fd_sc_hd__maj3_1 _227_ (.A(_056_),
    .B(_057_),
    .C(_059_),
    .X(_060_));
 sky130_fd_sc_hd__nor4_1 _228_ (.A(net138),
    .B(_057_),
    .C(_059_),
    .D(_055_),
    .Y(_061_));
 sky130_fd_sc_hd__and3_1 _229_ (.A(net138),
    .B(_057_),
    .C(_059_),
    .X(_062_));
 sky130_fd_sc_hd__a211oi_1 _230_ (.A1(_055_),
    .A2(_060_),
    .B1(_061_),
    .C1(_062_),
    .Y(c1_c8_c2));
 sky130_fd_sc_hd__nand2_2 _231_ (.A(net107),
    .B(net103),
    .Y(_063_));
 sky130_fd_sc_hd__a211oi_2 _232_ (.A1(_001_),
    .A2(_005_),
    .B1(_004_),
    .C1(net119),
    .Y(_064_));
 sky130_fd_sc_hd__o21ai_1 _233_ (.A1(net117),
    .A2(net119),
    .B1(_003_),
    .Y(_065_));
 sky130_fd_sc_hd__o21bai_1 _234_ (.A1(_064_),
    .A2(_065_),
    .B1_N(net112),
    .Y(_066_));
 sky130_fd_sc_hd__a21oi_2 _235_ (.A1(_066_),
    .A2(net105),
    .B1(net106),
    .Y(_067_));
 sky130_fd_sc_hd__nor3_4 _236_ (.A(_063_),
    .B(net168),
    .C(_024_),
    .Y(_068_));
 sky130_fd_sc_hd__a21oi_2 _237_ (.A1(_011_),
    .A2(net104),
    .B1(_010_),
    .Y(_069_));
 sky130_fd_sc_hd__nand3_1 _238_ (.A(_009_),
    .B(_021_),
    .C(_006_),
    .Y(_070_));
 sky130_fd_sc_hd__a21oi_4 _239_ (.A1(_008_),
    .A2(_021_),
    .B1(_020_),
    .Y(_071_));
 sky130_fd_sc_hd__o2111ai_2 _240_ (.A1(_069_),
    .A2(_024_),
    .B1(_070_),
    .C1(_033_),
    .D1(_071_),
    .Y(_072_));
 sky130_fd_sc_hd__nand3_1 _241_ (.A(net109),
    .B(net102),
    .C(_007_),
    .Y(_073_));
 sky130_fd_sc_hd__nand3_1 _242_ (.A(_070_),
    .B(_071_),
    .C(_073_),
    .Y(_074_));
 sky130_fd_sc_hd__o211a_1 _243_ (.A1(_068_),
    .A2(_072_),
    .B1(_074_),
    .C1(\s2_c14_fa.sum ),
    .X(_075_));
 sky130_fd_sc_hd__xor2_1 _244_ (.A(_075_),
    .B(c14_carry),
    .X(net23));
 sky130_fd_sc_hd__nand2_1 _245_ (.A(_009_),
    .B(_007_),
    .Y(_076_));
 sky130_fd_sc_hd__nor2_1 _246_ (.A(_024_),
    .B(net98),
    .Y(_077_));
 sky130_fd_sc_hd__o21ai_2 _247_ (.A1(net171),
    .A2(_063_),
    .B1(_069_),
    .Y(_078_));
 sky130_fd_sc_hd__a21o_1 _248_ (.A1(_022_),
    .A2(_007_),
    .B1(_006_),
    .X(_079_));
 sky130_fd_sc_hd__a21oi_2 _249_ (.A1(_079_),
    .A2(_009_),
    .B1(net110),
    .Y(_080_));
 sky130_fd_sc_hd__a21boi_2 _250_ (.A1(_077_),
    .A2(net167),
    .B1_N(_080_),
    .Y(_081_));
 sky130_fd_sc_hd__xnor2_1 _251_ (.A(net102),
    .B(_081_),
    .Y(net21));
 sky130_fd_sc_hd__and2_2 _252_ (.A(net161),
    .B(net164),
    .X(\pp[2][0] ));
 sky130_fd_sc_hd__and2_1 _253_ (.A(net160),
    .B(net146),
    .X(\pp[51][0] ));
 sky130_fd_sc_hd__and2_1 _254_ (.A(net11),
    .B(net146),
    .X(\pp[50][0] ));
 sky130_fd_sc_hd__and2_4 _256_ (.A(net9),
    .B(net146),
    .X(\pp[48][0] ));
 sky130_fd_sc_hd__and2_1 _257_ (.A(net144),
    .B(net151),
    .X(\pp[8][0] ));
 sky130_fd_sc_hd__and2_2 _258_ (.A(net162),
    .B(net164),
    .X(\pp[1][0] ));
 sky130_fd_sc_hd__and2_1 _259_ (.A(net16),
    .B(net6),
    .X(\pp[47][0] ));
 sky130_fd_sc_hd__and2_1 _260_ (.A(net153),
    .B(net6),
    .X(\pp[46][0] ));
 sky130_fd_sc_hd__and2_4 _261_ (.A(net14),
    .B(net6),
    .X(\pp[45][0] ));
 sky130_fd_sc_hd__and2_1 _262_ (.A(net13),
    .B(net147),
    .X(\pp[44][0] ));
 sky130_fd_sc_hd__and2_1 _263_ (.A(net12),
    .B(net147),
    .X(\pp[43][0] ));
 sky130_fd_sc_hd__and2_4 _264_ (.A(net163),
    .B(net147),
    .X(\pp[41][0] ));
 sky130_fd_sc_hd__a21o_1 _265_ (.A1(net125),
    .A2(net120),
    .B1(net121),
    .X(_083_));
 sky130_fd_sc_hd__a21oi_2 _266_ (.A1(net116),
    .A2(_083_),
    .B1(net118),
    .Y(_084_));
 sky130_fd_sc_hd__xnor2_1 _267_ (.A(_084_),
    .B(net111),
    .Y(net28));
 sky130_fd_sc_hd__a21o_1 _268_ (.A1(net130),
    .A2(_019_),
    .B1(net124),
    .X(_085_));
 sky130_fd_sc_hd__a21oi_1 _269_ (.A1(net120),
    .A2(_085_),
    .B1(net121),
    .Y(_086_));
 sky130_fd_sc_hd__xnor2_2 _270_ (.A(net116),
    .B(_086_),
    .Y(net27));
 sky130_fd_sc_hd__and2_1 _272_ (.A(net16),
    .B(net5),
    .X(\pp[39][0] ));
 sky130_fd_sc_hd__and2_1 _273_ (.A(net15),
    .B(net5),
    .X(\pp[38][0] ));
 sky130_fd_sc_hd__and2_1 _274_ (.A(net14),
    .B(net5),
    .X(\pp[37][0] ));
 sky130_fd_sc_hd__and2_1 _275_ (.A(net13),
    .B(net5),
    .X(\pp[36][0] ));
 sky130_fd_sc_hd__and2_4 _276_ (.A(net11),
    .B(net148),
    .X(\pp[34][0] ));
 sky130_fd_sc_hd__inv_1 _277_ (.A(_045_),
    .Y(\pp[31][0] ));
 sky130_fd_sc_hd__and2_1 _278_ (.A(net15),
    .B(net4),
    .X(\pp[30][0] ));
 sky130_fd_sc_hd__and2_4 _279_ (.A(net4),
    .B(net14),
    .X(\pp[29][0] ));
 sky130_fd_sc_hd__and2_1 _280_ (.A(net16),
    .B(net3),
    .X(\pp[23][0] ));
 sky130_fd_sc_hd__and2_4 _281_ (.A(net15),
    .B(net3),
    .X(\pp[22][0] ));
 sky130_fd_sc_hd__o31ai_2 _282_ (.A1(_076_),
    .A2(_032_),
    .A3(_024_),
    .B1(_080_),
    .Y(_088_));
 sky130_fd_sc_hd__a21oi_2 _283_ (.A1(_088_),
    .A2(_021_),
    .B1(_020_),
    .Y(_089_));
 sky130_fd_sc_hd__xnor2_1 _284_ (.A(net114),
    .B(_089_),
    .Y(net22));
 sky130_fd_sc_hd__and2_4 _285_ (.A(net161),
    .B(net150),
    .X(\pp[18][0] ));
 sky130_fd_sc_hd__nand2_1 _286_ (.A(net158),
    .B(net164),
    .Y(_090_));
 sky130_fd_sc_hd__nand2_1 _287_ (.A(net161),
    .B(net151),
    .Y(_091_));
 sky130_fd_sc_hd__nand2_1 _288_ (.A(net162),
    .B(net150),
    .Y(_092_));
 sky130_fd_sc_hd__nand2_2 _289_ (.A(net144),
    .B(net149),
    .Y(_093_));
 sky130_fd_sc_hd__xor2_1 _290_ (.A(_092_),
    .B(_093_),
    .X(_094_));
 sky130_fd_sc_hd__nand2_1 _291_ (.A(_092_),
    .B(_093_),
    .Y(_095_));
 sky130_fd_sc_hd__nor2_1 _292_ (.A(net137),
    .B(_095_),
    .Y(_096_));
 sky130_fd_sc_hd__a21oi_1 _293_ (.A1(net137),
    .A2(_094_),
    .B1(_096_),
    .Y(_097_));
 sky130_fd_sc_hd__a21oi_2 _294_ (.A1(net161),
    .A2(net151),
    .B1(_095_),
    .Y(_098_));
 sky130_fd_sc_hd__nor2_1 _295_ (.A(_090_),
    .B(_098_),
    .Y(_099_));
 sky130_fd_sc_hd__a21oi_2 _296_ (.A1(_090_),
    .A2(_097_),
    .B1(_099_),
    .Y(\s2_c3_comp.Sum ));
 sky130_fd_sc_hd__o21ai_0 _297_ (.A1(_092_),
    .A2(_093_),
    .B1(net137),
    .Y(_100_));
 sky130_fd_sc_hd__nand3_1 _298_ (.A(_090_),
    .B(_095_),
    .C(_100_),
    .Y(_101_));
 sky130_fd_sc_hd__o311ai_1 _299_ (.A1(_091_),
    .A2(_092_),
    .A3(_093_),
    .B1(net164),
    .C1(net158),
    .Y(_102_));
 sky130_fd_sc_hd__a21oi_1 _300_ (.A1(_101_),
    .A2(_102_),
    .B1(_098_),
    .Y(c3_carry));
 sky130_fd_sc_hd__nand2_1 _301_ (.A(net162),
    .B(net149),
    .Y(_103_));
 sky130_fd_sc_hd__nand2_1 _302_ (.A(net144),
    .B(net181),
    .Y(_104_));
 sky130_fd_sc_hd__xor2_1 _303_ (.A(\s1_c4_fa.sum ),
    .B(_104_),
    .X(_105_));
 sky130_fd_sc_hd__a21oi_2 _304_ (.A1(net144),
    .A2(net181),
    .B1(\s1_c4_fa.sum ),
    .Y(_106_));
 sky130_fd_sc_hd__nor2_2 _305_ (.A(_106_),
    .B(_103_),
    .Y(_107_));
 sky130_fd_sc_hd__a21oi_1 _306_ (.A1(_103_),
    .A2(_105_),
    .B1(_107_),
    .Y(\s2_c4_comp.Sum ));
 sky130_fd_sc_hd__a31o_2 _307_ (.A1(net144),
    .A2(net181),
    .A3(\s1_c4_fa.sum ),
    .B1(_107_),
    .X(c4_carry));
 sky130_fd_sc_hd__nand2_1 _308_ (.A(net156),
    .B(net164),
    .Y(_108_));
 sky130_fd_sc_hd__nand2_2 _309_ (.A(net157),
    .B(net151),
    .Y(_109_));
 sky130_fd_sc_hd__nand2_2 _310_ (.A(net161),
    .B(net149),
    .Y(_110_));
 sky130_fd_sc_hd__nand2_1 _311_ (.A(_109_),
    .B(_110_),
    .Y(_111_));
 sky130_fd_sc_hd__xnor2_1 _312_ (.A(_109_),
    .B(_110_),
    .Y(_112_));
 sky130_fd_sc_hd__nand2_2 _313_ (.A(net158),
    .B(net150),
    .Y(_113_));
 sky130_fd_sc_hd__mux2i_2 _314_ (.A0(_111_),
    .A1(_112_),
    .S(net136),
    .Y(_114_));
 sky130_fd_sc_hd__nand3_1 _315_ (.A(_109_),
    .B(net136),
    .C(_110_),
    .Y(_115_));
 sky130_fd_sc_hd__nor2_1 _316_ (.A(_108_),
    .B(_115_),
    .Y(_116_));
 sky130_fd_sc_hd__a211oi_2 _317_ (.A1(_108_),
    .A2(_114_),
    .B1(_116_),
    .C1(c1_c5_c1),
    .Y(_117_));
 sky130_fd_sc_hd__nand2_1 _318_ (.A(net144),
    .B(net147),
    .Y(_118_));
 sky130_fd_sc_hd__nand4_1 _319_ (.A(net162),
    .B(net182),
    .C(net123),
    .D(net135),
    .Y(_119_));
 sky130_fd_sc_hd__nand2_1 _320_ (.A(net162),
    .B(net182),
    .Y(_120_));
 sky130_fd_sc_hd__a211o_1 _321_ (.A1(_108_),
    .A2(_114_),
    .B1(_116_),
    .C1(c1_c5_c1),
    .X(_121_));
 sky130_fd_sc_hd__and2_2 _322_ (.A(net156),
    .B(net164),
    .X(_122_));
 sky130_fd_sc_hd__nand2_1 _323_ (.A(_122_),
    .B(_115_),
    .Y(_123_));
 sky130_fd_sc_hd__o211ai_1 _324_ (.A1(_122_),
    .A2(_114_),
    .B1(_123_),
    .C1(c1_c5_c1),
    .Y(_124_));
 sky130_fd_sc_hd__nand4_1 _325_ (.A(net134),
    .B(_121_),
    .C(_124_),
    .D(net135),
    .Y(_125_));
 sky130_fd_sc_hd__nand4_1 _326_ (.A(net144),
    .B(net147),
    .C(net134),
    .D(net123),
    .Y(_126_));
 sky130_fd_sc_hd__nand3_1 _327_ (.A(_119_),
    .B(_125_),
    .C(_126_),
    .Y(\s2_c5_comp.Sum ));
 sky130_fd_sc_hd__a21o_1 _328_ (.A1(_124_),
    .A2(_118_),
    .B1(_117_),
    .X(_127_));
 sky130_fd_sc_hd__nor3_1 _329_ (.A(_120_),
    .B(_124_),
    .C(_118_),
    .Y(_128_));
 sky130_fd_sc_hd__a21oi_1 _330_ (.A1(net144),
    .A2(net147),
    .B1(_121_),
    .Y(_129_));
 sky130_fd_sc_hd__a211oi_2 _331_ (.A1(net134),
    .A2(_127_),
    .B1(_128_),
    .C1(_129_),
    .Y(c5_carry));
 sky130_fd_sc_hd__maj3_2 _332_ (.A(_109_),
    .B(_113_),
    .C(_110_),
    .X(_130_));
 sky130_fd_sc_hd__o31ai_1 _333_ (.A1(_109_),
    .A2(_113_),
    .A3(_110_),
    .B1(_122_),
    .Y(_131_));
 sky130_fd_sc_hd__o21ai_2 _334_ (.A1(_122_),
    .A2(_130_),
    .B1(_131_),
    .Y(_132_));
 sky130_fd_sc_hd__nand2_1 _335_ (.A(net156),
    .B(net151),
    .Y(_133_));
 sky130_fd_sc_hd__inv_1 _336_ (.A(_133_),
    .Y(_134_));
 sky130_fd_sc_hd__nand2_2 _337_ (.A(net157),
    .B(net150),
    .Y(_135_));
 sky130_fd_sc_hd__a22oi_2 _338_ (.A1(net154),
    .A2(net165),
    .B1(net149),
    .B2(net158),
    .Y(_136_));
 sky130_fd_sc_hd__nand2_1 _339_ (.A(_135_),
    .B(_136_),
    .Y(_137_));
 sky130_fd_sc_hd__nand2_1 _340_ (.A(_134_),
    .B(_137_),
    .Y(_138_));
 sky130_fd_sc_hd__nand2_1 _341_ (.A(net159),
    .B(net149),
    .Y(_139_));
 sky130_fd_sc_hd__xor2_1 _342_ (.A(_046_),
    .B(_139_),
    .X(_140_));
 sky130_fd_sc_hd__nor2b_1 _343_ (.A(_135_),
    .B_N(_136_),
    .Y(_141_));
 sky130_fd_sc_hd__a211o_1 _344_ (.A1(_135_),
    .A2(_140_),
    .B1(_141_),
    .C1(_134_),
    .X(_142_));
 sky130_fd_sc_hd__a22oi_2 _345_ (.A1(net132),
    .A2(_132_),
    .B1(_138_),
    .B2(_142_),
    .Y(_143_));
 sky130_fd_sc_hd__and4_1 _346_ (.A(net132),
    .B(_132_),
    .C(_138_),
    .D(_142_),
    .X(_144_));
 sky130_fd_sc_hd__nor3_1 _347_ (.A(\s1_c6_fa.sum ),
    .B(_143_),
    .C(_144_),
    .Y(_145_));
 sky130_fd_sc_hd__a21o_1 _348_ (.A1(\s1_c6_fa.sum ),
    .A2(_143_),
    .B1(_145_),
    .X(\s2_c6_comp.Sum ));
 sky130_fd_sc_hd__nor2_1 _349_ (.A(\s1_c6_fa.sum ),
    .B(_144_),
    .Y(_146_));
 sky130_fd_sc_hd__nor2_1 _350_ (.A(_143_),
    .B(_146_),
    .Y(c6_carry));
 sky130_fd_sc_hd__xnor2_1 _351_ (.A(_057_),
    .B(_059_),
    .Y(_147_));
 sky130_fd_sc_hd__a21oi_1 _352_ (.A1(_057_),
    .A2(_059_),
    .B1(net138),
    .Y(_148_));
 sky130_fd_sc_hd__a21oi_1 _353_ (.A1(net138),
    .A2(_147_),
    .B1(_148_),
    .Y(_149_));
 sky130_fd_sc_hd__mux2_4 _354_ (.A0(_062_),
    .A1(_149_),
    .S(_055_),
    .X(_150_));
 sky130_fd_sc_hd__or2_4 _355_ (.A(_054_),
    .B(_048_),
    .X(_151_));
 sky130_fd_sc_hd__xnor2_1 _356_ (.A(net140),
    .B(net139),
    .Y(_152_));
 sky130_fd_sc_hd__a21oi_1 _357_ (.A1(net140),
    .A2(net139),
    .B1(net141),
    .Y(_153_));
 sky130_fd_sc_hd__a221o_1 _358_ (.A1(net157),
    .A2(net149),
    .B1(_152_),
    .B2(net141),
    .C1(_153_),
    .X(_154_));
 sky130_fd_sc_hd__nand2_2 _359_ (.A(_151_),
    .B(_154_),
    .Y(_155_));
 sky130_fd_sc_hd__xnor2_1 _360_ (.A(_150_),
    .B(_155_),
    .Y(_156_));
 sky130_fd_sc_hd__inv_2 _361_ (.A(c1_c7_fa_c),
    .Y(_157_));
 sky130_fd_sc_hd__nand4_4 _362_ (.A(net154),
    .B(net158),
    .C(net165),
    .D(net149),
    .Y(_158_));
 sky130_fd_sc_hd__a21oi_2 _363_ (.A1(_158_),
    .A2(_135_),
    .B1(_136_),
    .Y(_159_));
 sky130_fd_sc_hd__o221ai_2 _364_ (.A1(net142),
    .A2(net133),
    .B1(_159_),
    .B2(_134_),
    .C1(_137_),
    .Y(_160_));
 sky130_fd_sc_hd__nand2_1 _365_ (.A(net127),
    .B(net179),
    .Y(_161_));
 sky130_fd_sc_hd__nand2_1 _366_ (.A(net131),
    .B(_160_),
    .Y(_162_));
 sky130_fd_sc_hd__nand2b_4 _367_ (.A_N(_160_),
    .B(_157_),
    .Y(_163_));
 sky130_fd_sc_hd__a211o_1 _368_ (.A1(_162_),
    .A2(_163_),
    .B1(_150_),
    .C1(_155_),
    .X(_164_));
 sky130_fd_sc_hd__o21ai_1 _369_ (.A1(_156_),
    .A2(_161_),
    .B1(_164_),
    .Y(\s2_c7_comp.Sum ));
 sky130_fd_sc_hd__a21oi_2 _370_ (.A1(net129),
    .A2(net128),
    .B1(net126),
    .Y(_165_));
 sky130_fd_sc_hd__nand3_1 _371_ (.A(net129),
    .B(net128),
    .C(net126),
    .Y(_166_));
 sky130_fd_sc_hd__o21ai_1 _372_ (.A1(net122),
    .A2(_165_),
    .B1(_166_),
    .Y(_167_));
 sky130_fd_sc_hd__and3_1 _373_ (.A(net131),
    .B(net122),
    .C(_165_),
    .X(_168_));
 sky130_fd_sc_hd__nor2_1 _374_ (.A(net122),
    .B(_166_),
    .Y(_169_));
 sky130_fd_sc_hd__a211oi_2 _375_ (.A1(net127),
    .A2(_167_),
    .B1(_168_),
    .C1(_169_),
    .Y(c7_carry));
 sky130_fd_sc_hd__xor2_1 _376_ (.A(net125),
    .B(net120),
    .X(net26));
 sky130_fd_sc_hd__and2_1 _377_ (.A(net144),
    .B(net150),
    .X(\pp[16][0] ));
 sky130_fd_sc_hd__and2_4 _378_ (.A(net16),
    .B(net2),
    .X(\pp[15][0] ));
 sky130_fd_sc_hd__and2_1 _379_ (.A(net158),
    .B(net151),
    .X(\pp[11][0] ));
 sky130_fd_sc_hd__and2_2 _380_ (.A(net144),
    .B(net164),
    .X(net17));
 sky130_fd_sc_hd__xnor2_1 _381_ (.A(net97),
    .B(net103),
    .Y(net30));
 sky130_fd_sc_hd__o21ai_0 _382_ (.A1(_024_),
    .A2(_069_),
    .B1(_033_),
    .Y(_170_));
 sky130_fd_sc_hd__nor2_1 _383_ (.A(_170_),
    .B(_068_),
    .Y(_171_));
 sky130_fd_sc_hd__xnor2_1 _384_ (.A(_171_),
    .B(net101),
    .Y(net19));
 sky130_fd_sc_hd__o21bai_1 _385_ (.A1(_025_),
    .A2(net115),
    .B1_N(net118),
    .Y(_172_));
 sky130_fd_sc_hd__a21oi_1 _386_ (.A1(_172_),
    .A2(net111),
    .B1(net112),
    .Y(_173_));
 sky130_fd_sc_hd__xnor2_1 _387_ (.A(_173_),
    .B(net105),
    .Y(net29));
 sky130_fd_sc_hd__xor2_1 _388_ (.A(net113),
    .B(net96),
    .X(net32));
 sky130_fd_sc_hd__fa_1 _389_ (.A(\pp[31][0] ),
    .B(\pp[45][0] ),
    .CIN(\pp[38][0] ),
    .COUT(c1_c11_cout),
    .SUM(\s1_c10_comp.fa1.sum ));
 sky130_fd_sc_hd__fa_1 _390_ (.A(c1_c10_cout),
    .B(\pp[52][0] ),
    .CIN(\s1_c10_comp.fa1.sum ),
    .COUT(c1_c11_c1),
    .SUM(\s1_c10_comp.fa2.sum ));
 sky130_fd_sc_hd__fa_1 _391_ (.A(\pp[39][0] ),
    .B(\pp[46][0] ),
    .CIN(\pp[53][0] ),
    .COUT(c1_c12_cout),
    .SUM(\s1_c11_comp.fa1.sum ));
 sky130_fd_sc_hd__fa_1 _392_ (.A(c1_c11_cout),
    .B(\pp[60][0] ),
    .CIN(\s1_c11_comp.fa1.sum ),
    .COUT(c1_c12_c1),
    .SUM(\s1_c11_comp.fa2.sum ));
 sky130_fd_sc_hd__fa_1 _393_ (.A(\pp[47][0] ),
    .B(\pp[54][0] ),
    .CIN(\pp[61][0] ),
    .COUT(c1_c13_cout),
    .SUM(\s1_c12_comp.fa1.sum ));
 sky130_fd_sc_hd__fa_2 _394_ (.A(\pp[18][0] ),
    .B(\pp[4][0] ),
    .CIN(\pp[11][0] ),
    .COUT(c1_c5_c1),
    .SUM(\s1_c4_fa.sum ));
 sky130_fd_sc_hd__fa_2 _395_ (.A(\pp[34][0] ),
    .B(\pp[41][0] ),
    .CIN(\pp[48][0] ),
    .COUT(c1_c7_fa_c),
    .SUM(\s1_c6_fa.sum ));
 sky130_fd_sc_hd__fa_1 _396_ (.A(\pp[15][0] ),
    .B(\pp[22][0] ),
    .CIN(\pp[29][0] ),
    .COUT(c1_c9_cout1),
    .SUM(\s1_c8_comp1.fa1.sum ));
 sky130_fd_sc_hd__fa_1 _397_ (.A(\pp[43][0] ),
    .B(\pp[57][0] ),
    .CIN(\pp[50][0] ),
    .COUT(c1_c9_cout2),
    .SUM(\s1_c8_comp2.fa1.sum ));
 sky130_fd_sc_hd__fa_1 _398_ (.A(\pp[23][0] ),
    .B(\pp[30][0] ),
    .CIN(\pp[37][0] ),
    .COUT(c1_c10_cout),
    .SUM(\s1_c9_comp.fa1.sum ));
 sky130_fd_sc_hd__fa_1 _399_ (.A(c1_c9_cout1),
    .B(\pp[44][0] ),
    .CIN(\s1_c9_comp.fa1.sum ),
    .COUT(c1_c10_c1),
    .SUM(\s1_c9_comp.fa2.sum ));
 sky130_fd_sc_hd__fa_1 _400_ (.A(\pp[58][0] ),
    .B(c1_c9_c1),
    .CIN(\pp[51][0] ),
    .COUT(c1_c10_fa_c),
    .SUM(\s1_c9_fa.sum ));
 sky130_fd_sc_hd__fa_1 _401_ (.A(c1_c10_c1),
    .B(\pp[59][0] ),
    .CIN(\s1_c10_comp.fa2.sum ),
    .COUT(c10_cout),
    .SUM(\s2_c10_comp.fa1.sum ));
 sky130_fd_sc_hd__fa_2 _402_ (.A(c1_c10_fa_c),
    .B(c9_cout),
    .CIN(\s2_c10_comp.fa1.sum ),
    .COUT(c10_carry),
    .SUM(\s2_c10_comp.fa2.sum ));
 sky130_fd_sc_hd__fa_1 _403_ (.A(c1_c13_c1),
    .B(\pp[55][0] ),
    .CIN(\pp[62][0] ),
    .COUT(c13_cout),
    .SUM(\s2_c13_comp.fa1.sum ));
 sky130_fd_sc_hd__fa_1 _404_ (.A(c1_c13_cout),
    .B(c12_cout),
    .CIN(\s2_c13_comp.fa1.sum ),
    .COUT(c13_carry),
    .SUM(\s2_c13_comp.fa2.sum ));
 sky130_fd_sc_hd__fa_1 _405_ (.A(c13_carry),
    .B(c13_cout),
    .CIN(\pp[63][0] ),
    .COUT(c14_carry),
    .SUM(\s2_c14_fa.sum ));
 sky130_fd_sc_hd__fa_1 _406_ (.A(c1_c8_c2),
    .B(\s1_c8_comp2.fa2.sum ),
    .CIN(\s1_c8_comp1.fa2.sum ),
    .COUT(c8_cout),
    .SUM(\s2_c8_comp.fa1.sum ));
 sky130_fd_sc_hd__fa_2 _407_ (.A(c1_c9_c2),
    .B(\s1_c9_comp.fa2.sum ),
    .CIN(\s1_c9_fa.sum ),
    .COUT(c9_cout),
    .SUM(\s2_c9_comp.fa1.sum ));
 sky130_fd_sc_hd__fa_2 _408_ (.A(c1_c9_cout2),
    .B(c8_cout),
    .CIN(\s2_c9_comp.fa1.sum ),
    .COUT(c9_carry),
    .SUM(\s2_c9_comp.fa2.sum ));
 sky130_fd_sc_hd__fa_2 _409_ (.A(\pp[16][0] ),
    .B(_000_),
    .CIN(\s2_c2_ha.sum ),
    .COUT(_001_),
    .SUM(net25));
 sky130_fd_sc_hd__ha_4 _410_ (.A(c4_carry),
    .B(\s2_c5_comp.Sum ),
    .COUT(_002_),
    .SUM(_003_));
 sky130_fd_sc_hd__ha_1 _411_ (.A(\pp[1][0] ),
    .B(\pp[8][0] ),
    .COUT(_000_),
    .SUM(net24));
 sky130_fd_sc_hd__ha_4 _412_ (.A(c2_c3_c),
    .B(\s2_c3_comp.Sum ),
    .COUT(_004_),
    .SUM(_005_));
 sky130_fd_sc_hd__ha_4 _413_ (.A(\s2_c11_comp.fa2.sum ),
    .B(c10_carry),
    .COUT(_006_),
    .SUM(_007_));
 sky130_fd_sc_hd__ha_1 _414_ (.A(c11_carry),
    .B(\s2_c12_comp.fa2.sum ),
    .COUT(_008_),
    .SUM(_009_));
 sky130_fd_sc_hd__ha_4 _415_ (.A(\s2_c8_comp.fa1.sum ),
    .B(c7_carry),
    .COUT(_010_),
    .SUM(_011_));
 sky130_fd_sc_hd__ha_2 _416_ (.A(\s2_c4_comp.Sum ),
    .B(c3_carry),
    .COUT(_012_),
    .SUM(_013_));
 sky130_fd_sc_hd__ha_1 _417_ (.A(c5_carry),
    .B(\s2_c6_comp.Sum ),
    .COUT(_014_),
    .SUM(_015_));
 sky130_fd_sc_hd__ha_1 _418_ (.A(\s2_c7_comp.Sum ),
    .B(c6_carry),
    .COUT(_016_),
    .SUM(_017_));
 sky130_fd_sc_hd__ha_1 _419_ (.A(\pp[16][0] ),
    .B(\s2_c2_ha.sum ),
    .COUT(_018_),
    .SUM(_019_));
 sky130_fd_sc_hd__ha_4 _420_ (.A(c12_carry),
    .B(\s2_c13_comp.fa2.sum ),
    .COUT(_020_),
    .SUM(_021_));
 sky130_fd_sc_hd__ha_1 _421_ (.A(c1_c12_cout),
    .B(\s1_c12_comp.fa1.sum ),
    .COUT(c1_c13_c1),
    .SUM(\s1_c12_comp.fa2.sum ));
 sky130_fd_sc_hd__ha_2 _422_ (.A(\pp[36][0] ),
    .B(\s1_c8_comp1.fa1.sum ),
    .COUT(c1_c9_c1),
    .SUM(\s1_c8_comp1.fa2.sum ));
 sky130_fd_sc_hd__ha_4 _423_ (.A(c1_c8_c1),
    .B(\s1_c8_comp2.fa1.sum ),
    .COUT(c1_c9_c2),
    .SUM(\s1_c8_comp2.fa2.sum ));
 sky130_fd_sc_hd__ha_1 _424_ (.A(c1_c11_c1),
    .B(\s1_c11_comp.fa2.sum ),
    .COUT(c11_cout),
    .SUM(\s2_c11_comp.fa1.sum ));
 sky130_fd_sc_hd__ha_1 _425_ (.A(c10_cout),
    .B(\s2_c11_comp.fa1.sum ),
    .COUT(c11_carry),
    .SUM(\s2_c11_comp.fa2.sum ));
 sky130_fd_sc_hd__ha_1 _426_ (.A(c1_c12_c1),
    .B(\s1_c12_comp.fa2.sum ),
    .COUT(c12_cout),
    .SUM(\s2_c12_comp.fa1.sum ));
 sky130_fd_sc_hd__ha_1 _427_ (.A(c11_cout),
    .B(\s2_c12_comp.fa1.sum ),
    .COUT(c12_carry),
    .SUM(\s2_c12_comp.fa2.sum ));
 sky130_fd_sc_hd__ha_1 _428_ (.A(\pp[2][0] ),
    .B(\pp[9][0] ),
    .COUT(c2_c3_c),
    .SUM(\s2_c2_ha.sum ));
 sky130_fd_sc_hd__ha_4 _429_ (.A(c9_carry),
    .B(\s2_c10_comp.fa2.sum ),
    .COUT(_022_),
    .SUM(_023_));
 sky130_fd_sc_hd__buf_2 input1 (.A(A[0]),
    .X(net1));
 sky130_fd_sc_hd__buf_2 input10 (.A(B[1]),
    .X(net10));
 sky130_fd_sc_hd__buf_8 input11 (.A(B[2]),
    .X(net11));
 sky130_fd_sc_hd__buf_4 input12 (.A(B[3]),
    .X(net12));
 sky130_fd_sc_hd__buf_6 input13 (.A(B[4]),
    .X(net13));
 sky130_fd_sc_hd__buf_6 input14 (.A(B[5]),
    .X(net14));
 sky130_fd_sc_hd__buf_6 input15 (.A(B[6]),
    .X(net15));
 sky130_fd_sc_hd__buf_8 input16 (.A(B[7]),
    .X(net16));
 sky130_fd_sc_hd__buf_6 input2 (.A(A[1]),
    .X(net2));
 sky130_fd_sc_hd__buf_6 input3 (.A(A[2]),
    .X(net3));
 sky130_fd_sc_hd__buf_6 input4 (.A(A[3]),
    .X(net4));
 sky130_fd_sc_hd__buf_8 input5 (.A(A[4]),
    .X(net5));
 sky130_fd_sc_hd__buf_6 input6 (.A(A[5]),
    .X(net6));
 sky130_fd_sc_hd__buf_2 input7 (.A(A[6]),
    .X(net7));
 sky130_fd_sc_hd__dlygate4sd2_1 input8 (.A(A[7]),
    .X(net8));
 sky130_fd_sc_hd__dlygate4sd2_1 input9 (.A(B[0]),
    .X(net9));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output17 (.A(net17),
    .X(P[0]));
 sky130_fd_sc_hd__buf_2 output18 (.A(net18),
    .X(P[10]));
 sky130_fd_sc_hd__buf_2 output19 (.A(net19),
    .X(P[11]));
 sky130_fd_sc_hd__buf_2 output20 (.A(net20),
    .X(P[12]));
 sky130_fd_sc_hd__buf_2 output21 (.A(net21),
    .X(P[13]));
 sky130_fd_sc_hd__buf_2 output22 (.A(net22),
    .X(P[14]));
 sky130_fd_sc_hd__buf_2 output23 (.A(net23),
    .X(P[15]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output24 (.A(net24),
    .X(P[1]));
 sky130_fd_sc_hd__clkdlybuf4s50_1 output25 (.A(net25),
    .X(P[2]));
 sky130_fd_sc_hd__dlygate4sd2_1 output26 (.A(net26),
    .X(P[3]));
 sky130_fd_sc_hd__buf_2 output27 (.A(net27),
    .X(P[4]));
 sky130_fd_sc_hd__buf_2 output28 (.A(net28),
    .X(P[5]));
 sky130_fd_sc_hd__buf_2 output29 (.A(net29),
    .X(P[6]));
 sky130_fd_sc_hd__buf_2 output30 (.A(net30),
    .X(P[7]));
 sky130_fd_sc_hd__buf_2 output31 (.A(net31),
    .X(P[8]));
 sky130_fd_sc_hd__buf_2 output32 (.A(net32),
    .X(P[9]));
 sky130_fd_sc_hd__buf_4 place100 (.A(_023_),
    .X(net100));
 sky130_fd_sc_hd__buf_4 place101 (.A(_007_),
    .X(net101));
 sky130_fd_sc_hd__buf_4 place102 (.A(_021_),
    .X(net102));
 sky130_fd_sc_hd__buf_4 place103 (.A(_017_),
    .X(net103));
 sky130_fd_sc_hd__buf_4 place104 (.A(_016_),
    .X(net104));
 sky130_fd_sc_hd__buf_4 place105 (.A(_015_),
    .X(net105));
 sky130_fd_sc_hd__buf_4 place106 (.A(_014_),
    .X(net106));
 sky130_fd_sc_hd__buf_4 place107 (.A(_011_),
    .X(net107));
 sky130_fd_sc_hd__buf_4 place108 (.A(_010_),
    .X(net108));
 sky130_fd_sc_hd__buf_4 place109 (.A(_009_),
    .X(net109));
 sky130_fd_sc_hd__buf_4 place110 (.A(_008_),
    .X(net110));
 sky130_fd_sc_hd__buf_4 place111 (.A(_003_),
    .X(net111));
 sky130_fd_sc_hd__buf_4 place112 (.A(_002_),
    .X(net112));
 sky130_fd_sc_hd__buf_6 place113 (.A(\s2_c9_comp.fa2.sum ),
    .X(net113));
 sky130_fd_sc_hd__buf_4 place114 (.A(\s2_c14_fa.sum ),
    .X(net114));
 sky130_fd_sc_hd__buf_4 place115 (.A(_026_),
    .X(net115));
 sky130_fd_sc_hd__buf_4 place116 (.A(net117),
    .X(net116));
 sky130_fd_sc_hd__buf_4 place117 (.A(_013_),
    .X(net117));
 sky130_fd_sc_hd__buf_4 place118 (.A(net119),
    .X(net118));
 sky130_fd_sc_hd__buf_4 place119 (.A(_012_),
    .X(net119));
 sky130_fd_sc_hd__buf_4 place120 (.A(_005_),
    .X(net120));
 sky130_fd_sc_hd__buf_4 place121 (.A(_004_),
    .X(net121));
 sky130_fd_sc_hd__buf_4 place122 (.A(_150_),
    .X(net122));
 sky130_fd_sc_hd__buf_4 place123 (.A(_117_),
    .X(net123));
 sky130_fd_sc_hd__buf_4 place124 (.A(_018_),
    .X(net124));
 sky130_fd_sc_hd__buf_4 place125 (.A(_001_),
    .X(net125));
 sky130_fd_sc_hd__buf_4 place126 (.A(net179),
    .X(net126));
 sky130_fd_sc_hd__buf_4 place127 (.A(net180),
    .X(net127));
 sky130_fd_sc_hd__buf_4 place128 (.A(_154_),
    .X(net128));
 sky130_fd_sc_hd__buf_4 place129 (.A(_151_),
    .X(net129));
 sky130_fd_sc_hd__buf_4 place130 (.A(_000_),
    .X(net130));
 sky130_fd_sc_hd__buf_4 place131 (.A(c1_c7_fa_c),
    .X(net131));
 sky130_fd_sc_hd__buf_4 place132 (.A(_115_),
    .X(net132));
 sky130_fd_sc_hd__buf_4 place133 (.A(_158_),
    .X(net133));
 sky130_fd_sc_hd__buf_4 place134 (.A(_120_),
    .X(net134));
 sky130_fd_sc_hd__buf_4 place135 (.A(_118_),
    .X(net135));
 sky130_fd_sc_hd__buf_4 place136 (.A(_113_),
    .X(net136));
 sky130_fd_sc_hd__buf_4 place137 (.A(_091_),
    .X(net137));
 sky130_fd_sc_hd__buf_4 place138 (.A(_056_),
    .X(net138));
 sky130_fd_sc_hd__buf_4 place139 (.A(_051_),
    .X(net139));
 sky130_fd_sc_hd__buf_4 place140 (.A(_050_),
    .X(net140));
 sky130_fd_sc_hd__buf_4 place141 (.A(_049_),
    .X(net141));
 sky130_fd_sc_hd__buf_4 place142 (.A(_047_),
    .X(net142));
 sky130_fd_sc_hd__buf_4 place143 (.A(_045_),
    .X(net143));
 sky130_fd_sc_hd__buf_4 place144 (.A(net9),
    .X(net144));
 sky130_fd_sc_hd__buf_4 place145 (.A(net8),
    .X(net145));
 sky130_fd_sc_hd__buf_4 place146 (.A(net7),
    .X(net146));
 sky130_fd_sc_hd__buf_6 place147 (.A(net6),
    .X(net147));
 sky130_fd_sc_hd__buf_6 place148 (.A(net5),
    .X(net148));
 sky130_fd_sc_hd__buf_6 place149 (.A(net4),
    .X(net149));
 sky130_fd_sc_hd__buf_8 place150 (.A(net3),
    .X(net150));
 sky130_fd_sc_hd__buf_4 place151 (.A(net2),
    .X(net151));
 sky130_fd_sc_hd__buf_4 place152 (.A(net16),
    .X(net152));
 sky130_fd_sc_hd__buf_4 place153 (.A(net15),
    .X(net153));
 sky130_fd_sc_hd__buf_4 place154 (.A(net15),
    .X(net154));
 sky130_fd_sc_hd__buf_4 place155 (.A(net14),
    .X(net155));
 sky130_fd_sc_hd__buf_4 place156 (.A(net14),
    .X(net156));
 sky130_fd_sc_hd__buf_4 place157 (.A(net13),
    .X(net157));
 sky130_fd_sc_hd__buf_6 place158 (.A(net12),
    .X(net158));
 sky130_fd_sc_hd__buf_4 place159 (.A(net12),
    .X(net159));
 sky130_fd_sc_hd__buf_4 place160 (.A(net12),
    .X(net160));
 sky130_fd_sc_hd__buf_4 place161 (.A(net11),
    .X(net161));
 sky130_fd_sc_hd__buf_4 place162 (.A(net163),
    .X(net162));
 sky130_fd_sc_hd__buf_4 place163 (.A(net10),
    .X(net163));
 sky130_fd_sc_hd__buf_4 place164 (.A(net165),
    .X(net164));
 sky130_fd_sc_hd__buf_6 place165 (.A(net1),
    .X(net165));
 sky130_fd_sc_hd__buf_4 place96 (.A(_078_),
    .X(net96));
 sky130_fd_sc_hd__buf_4 place97 (.A(net174),
    .X(net97));
 sky130_fd_sc_hd__buf_4 place98 (.A(_076_),
    .X(net98));
 sky130_fd_sc_hd__buf_4 place99 (.A(net178),
    .X(net99));
 sky130_fd_sc_hd__buf_6 rebuffer166 (.A(_024_),
    .X(net166));
 sky130_fd_sc_hd__buf_4 rebuffer167 (.A(_078_),
    .X(net167));
 sky130_fd_sc_hd__buf_4 rebuffer168 (.A(_067_),
    .X(net168));
 sky130_fd_sc_hd__buf_4 rebuffer171 (.A(_067_),
    .X(net171));
 sky130_fd_sc_hd__buf_4 rebuffer174 (.A(_067_),
    .X(net174));
 sky130_fd_sc_hd__buf_4 rebuffer178 (.A(_028_),
    .X(net178));
 sky130_fd_sc_hd__buf_4 rebuffer179 (.A(_160_),
    .X(net179));
 sky130_fd_sc_hd__buf_4 rebuffer180 (.A(_157_),
    .X(net180));
 sky130_fd_sc_hd__buf_4 rebuffer181 (.A(net148),
    .X(net181));
 sky130_fd_sc_hd__buf_4 rebuffer182 (.A(net148),
    .X(net182));
 sky130_fd_sc_hd__buf_4 rebuffer187 (.A(_012_),
    .X(net187));
 sky130_fd_sc_hd__buf_4 rebuffer193 (.A(_013_),
    .X(net193));
endmodule
