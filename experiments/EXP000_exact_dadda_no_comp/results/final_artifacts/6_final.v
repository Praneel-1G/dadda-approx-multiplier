module exact_dadda_no_comp (A,
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
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
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
 wire _058_;
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
 wire \pp[10][0] ;
 wire \pp[11][0] ;
 wire \pp[12][0] ;
 wire \pp[13][0] ;
 wire \pp[14][0] ;
 wire \pp[15][0] ;
 wire \pp[16][0] ;
 wire \pp[17][0] ;
 wire \pp[18][0] ;
 wire \pp[19][0] ;
 wire \pp[1][0] ;
 wire \pp[20][0] ;
 wire \pp[21][0] ;
 wire \pp[22][0] ;
 wire \pp[23][0] ;
 wire \pp[24][0] ;
 wire \pp[25][0] ;
 wire \pp[26][0] ;
 wire \pp[27][0] ;
 wire \pp[28][0] ;
 wire \pp[29][0] ;
 wire \pp[2][0] ;
 wire \pp[30][0] ;
 wire \pp[31][0] ;
 wire \pp[32][0] ;
 wire \pp[33][0] ;
 wire \pp[34][0] ;
 wire \pp[35][0] ;
 wire \pp[36][0] ;
 wire \pp[37][0] ;
 wire \pp[38][0] ;
 wire \pp[39][0] ;
 wire \pp[3][0] ;
 wire \pp[40][0] ;
 wire \pp[41][0] ;
 wire \pp[42][0] ;
 wire \pp[43][0] ;
 wire \pp[44][0] ;
 wire \pp[45][0] ;
 wire \pp[46][0] ;
 wire \pp[47][0] ;
 wire \pp[48][0] ;
 wire \pp[49][0] ;
 wire \pp[4][0] ;
 wire \pp[50][0] ;
 wire \pp[51][0] ;
 wire \pp[52][0] ;
 wire \pp[53][0] ;
 wire \pp[54][0] ;
 wire \pp[55][0] ;
 wire \pp[56][0] ;
 wire \pp[57][0] ;
 wire \pp[58][0] ;
 wire \pp[59][0] ;
 wire \pp[5][0] ;
 wire \pp[60][0] ;
 wire \pp[61][0] ;
 wire \pp[62][0] ;
 wire \pp[63][0] ;
 wire \pp[6][0] ;
 wire \pp[7][0] ;
 wire \pp[8][0] ;
 wire \pp[9][0] ;
 wire s1_c6_c;
 wire \s1_c6_ha.sum ;
 wire s1_c7_c1;
 wire s1_c7_c2;
 wire \s1_c7_fa.sum ;
 wire \s1_c7_ha.sum ;
 wire s1_c8_c1;
 wire s1_c8_c2;
 wire \s1_c8_fa.sum ;
 wire \s1_c8_ha.sum ;
 wire s1_c9_c;
 wire \s1_c9_fa.sum ;
 wire s2_c10_c1;
 wire s2_c10_c2;
 wire \s2_c10_fa1.sum ;
 wire \s2_c10_fa2.sum ;
 wire s2_c11_c1;
 wire \s2_c11_fa.sum ;
 wire s2_c4_c;
 wire \s2_c4_ha.sum ;
 wire s2_c5_c1;
 wire s2_c5_c2;
 wire \s2_c5_fa.sum ;
 wire \s2_c5_ha.sum ;
 wire s2_c6_c1;
 wire s2_c6_c2;
 wire \s2_c6_fa1.sum ;
 wire \s2_c6_fa2.sum ;
 wire s2_c7_c1;
 wire s2_c7_c2;
 wire \s2_c7_fa1.sum ;
 wire \s2_c7_fa2.sum ;
 wire s2_c8_c1;
 wire s2_c8_c2;
 wire \s2_c8_fa1.sum ;
 wire \s2_c8_fa2.sum ;
 wire s2_c9_c1;
 wire s2_c9_c2;
 wire \s2_c9_fa1.sum ;
 wire \s2_c9_fa2.sum ;
 wire s3_c10_c;
 wire \s3_c10_fa.sum ;
 wire s3_c11_c;
 wire \s3_c11_fa.sum ;
 wire s3_c12_c;
 wire \s3_c12_fa.sum ;
 wire s3_c3_c;
 wire \s3_c3_ha.sum ;
 wire s3_c4_c;
 wire \s3_c4_fa.sum ;
 wire s3_c5_c;
 wire \s3_c5_fa.sum ;
 wire s3_c6_c;
 wire \s3_c6_fa.sum ;
 wire s3_c7_c;
 wire \s3_c7_fa.sum ;
 wire s3_c8_c;
 wire \s3_c8_fa.sum ;
 wire s3_c9_c;
 wire \s3_c9_fa.sum ;
 wire s4_c10_c;
 wire \s4_c10_fa.sum ;
 wire s4_c11_c;
 wire \s4_c11_fa.sum ;
 wire s4_c12_c;
 wire \s4_c12_fa.sum ;
 wire s4_c13_c;
 wire \s4_c13_fa.sum ;
 wire s4_c2_c;
 wire \s4_c2_ha.sum ;
 wire s4_c3_c;
 wire \s4_c3_fa.sum ;
 wire s4_c4_c;
 wire \s4_c4_fa.sum ;
 wire s4_c5_c;
 wire \s4_c5_fa.sum ;
 wire s4_c6_c;
 wire \s4_c6_fa.sum ;
 wire s4_c7_c;
 wire \s4_c7_fa.sum ;
 wire s4_c8_c;
 wire \s4_c8_fa.sum ;
 wire s4_c9_c;
 wire \s4_c9_fa.sum ;
 wire net158;
 wire net181;
 wire net72;
 wire net71;
 wire net73;
 wire net75;
 wire net151;
 wire net77;
 wire net78;
 wire net79;
 wire net80;
 wire net153;
 wire net82;
 wire net83;
 wire net84;
 wire net85;
 wire net86;
 wire net87;
 wire net89;
 wire net90;
 wire net154;
 wire net92;
 wire net94;
 wire net95;
 wire net96;
 wire net100;
 wire net101;
 wire net145;
 wire net103;
 wire net104;
 wire net109;
 wire net108;
 wire net111;
 wire net157;
 wire net74;
 wire net97;
 wire net98;
 wire net99;
 wire net105;
 wire net106;
 wire net107;
 wire net110;
 wire net112;
 wire net113;
 wire net114;
 wire net115;
 wire net159;
 wire net123;
 wire net124;
 wire net160;
 wire net142;
 wire net143;
 wire net144;
 wire net148;
 wire net155;
 wire net156;

 sky130_fd_sc_hd__xor2_1 _078_ (.A(net181),
    .B(net95),
    .X(net26));
 sky130_fd_sc_hd__a21o_1 _079_ (.A1(_000_),
    .A2(_007_),
    .B1(_006_),
    .X(_028_));
 sky130_fd_sc_hd__a21oi_1 _080_ (.A1(net181),
    .A2(_028_),
    .B1(net94),
    .Y(_029_));
 sky130_fd_sc_hd__xnor2_2 _081_ (.A(_029_),
    .B(net89),
    .Y(net27));
 sky130_fd_sc_hd__and2_1 _082_ (.A(net155),
    .B(net109),
    .X(\pp[9][0] ));
 sky130_fd_sc_hd__and2_4 _083_ (.A(net16),
    .B(net3),
    .X(\pp[23][0] ));
 sky130_fd_sc_hd__and2_1 _084_ (.A(net100),
    .B(net108),
    .X(\pp[34][0] ));
 sky130_fd_sc_hd__and2_1 _085_ (.A(net155),
    .B(net97),
    .X(\pp[8][0] ));
 sky130_fd_sc_hd__and2_4 _086_ (.A(net1),
    .B(net15),
    .X(\pp[6][0] ));
 sky130_fd_sc_hd__and2_1 _087_ (.A(net10),
    .B(net101),
    .X(\pp[25][0] ));
 sky130_fd_sc_hd__and2_1 _088_ (.A(net101),
    .B(net12),
    .X(\pp[27][0] ));
 sky130_fd_sc_hd__and2_1 _089_ (.A(net11),
    .B(net101),
    .X(\pp[26][0] ));
 sky130_fd_sc_hd__and2_4 _090_ (.A(net3),
    .B(net14),
    .X(\pp[21][0] ));
 sky130_fd_sc_hd__and2_1 _091_ (.A(net100),
    .B(net12),
    .X(\pp[35][0] ));
 sky130_fd_sc_hd__and2_1 _092_ (.A(net100),
    .B(net97),
    .X(\pp[32][0] ));
 sky130_fd_sc_hd__and2_4 _093_ (.A(net5),
    .B(net14),
    .X(\pp[37][0] ));
 sky130_fd_sc_hd__and2_1 _094_ (.A(net97),
    .B(net101),
    .X(\pp[24][0] ));
 sky130_fd_sc_hd__and2_1 _095_ (.A(net16),
    .B(net4),
    .X(\pp[31][0] ));
 sky130_fd_sc_hd__and2_1 _096_ (.A(net10),
    .B(net100),
    .X(\pp[33][0] ));
 sky130_fd_sc_hd__a21o_1 _097_ (.A1(_003_),
    .A2(_018_),
    .B1(_002_),
    .X(_030_));
 sky130_fd_sc_hd__a21o_1 _098_ (.A1(_005_),
    .A2(_001_),
    .B1(_004_),
    .X(_031_));
 sky130_fd_sc_hd__and3_4 _099_ (.A(_021_),
    .B(_019_),
    .C(_003_),
    .X(_032_));
 sky130_fd_sc_hd__a221o_2 _100_ (.A1(_021_),
    .A2(_030_),
    .B1(_032_),
    .B2(_031_),
    .C1(_020_),
    .X(_033_));
 sky130_fd_sc_hd__and3_4 _101_ (.A(_015_),
    .B(_025_),
    .C(_017_),
    .X(_034_));
 sky130_fd_sc_hd__and2_4 _102_ (.A(_027_),
    .B(_034_),
    .X(_035_));
 sky130_fd_sc_hd__a21oi_1 _103_ (.A1(_016_),
    .A2(_025_),
    .B1(_024_),
    .Y(_036_));
 sky130_fd_sc_hd__nand2_1 _104_ (.A(_027_),
    .B(net145),
    .Y(_037_));
 sky130_fd_sc_hd__a21oi_1 _105_ (.A1(_027_),
    .A2(_014_),
    .B1(net75),
    .Y(_038_));
 sky130_fd_sc_hd__o21ai_2 _106_ (.A1(_036_),
    .A2(_037_),
    .B1(_038_),
    .Y(_039_));
 sky130_fd_sc_hd__a21oi_4 _107_ (.A1(net114),
    .A2(net143),
    .B1(_039_),
    .Y(_040_));
 sky130_fd_sc_hd__nand3_1 _108_ (.A(net85),
    .B(net84),
    .C(net77),
    .Y(_041_));
 sky130_fd_sc_hd__a21o_1 _109_ (.A1(net77),
    .A2(net86),
    .B1(net78),
    .X(_042_));
 sky130_fd_sc_hd__a21oi_1 _110_ (.A1(net84),
    .A2(_042_),
    .B1(_010_),
    .Y(_043_));
 sky130_fd_sc_hd__o21ai_1 _111_ (.A1(_041_),
    .A2(_040_),
    .B1(_043_),
    .Y(_044_));
 sky130_fd_sc_hd__a21o_1 _112_ (.A1(_044_),
    .A2(_013_),
    .B1(_012_),
    .X(net23));
 sky130_fd_sc_hd__a31oi_4 _113_ (.A1(net142),
    .A2(net89),
    .A3(net94),
    .B1(net154),
    .Y(_045_));
 sky130_fd_sc_hd__nand4_1 _114_ (.A(net142),
    .B(net89),
    .C(net181),
    .D(_028_),
    .Y(_046_));
 sky130_fd_sc_hd__nand2_1 _115_ (.A(net79),
    .B(_034_),
    .Y(_047_));
 sky130_fd_sc_hd__a21oi_2 _116_ (.A1(net71),
    .A2(net87),
    .B1(_047_),
    .Y(_048_));
 sky130_fd_sc_hd__nand2_1 _117_ (.A(_015_),
    .B(_025_),
    .Y(_049_));
 sky130_fd_sc_hd__a21oi_4 _118_ (.A1(_020_),
    .A2(_017_),
    .B1(_016_),
    .Y(_050_));
 sky130_fd_sc_hd__a21oi_4 _119_ (.A1(_015_),
    .A2(_024_),
    .B1(_014_),
    .Y(_051_));
 sky130_fd_sc_hd__o21ai_4 _120_ (.A1(_050_),
    .A2(_049_),
    .B1(_051_),
    .Y(_052_));
 sky130_fd_sc_hd__nor2_4 _121_ (.A(_048_),
    .B(net113),
    .Y(_053_));
 sky130_fd_sc_hd__xnor2_1 _122_ (.A(net74),
    .B(_053_),
    .Y(net18));
 sky130_fd_sc_hd__xnor2_1 _123_ (.A(net85),
    .B(_040_),
    .Y(net19));
 sky130_fd_sc_hd__and2_4 _124_ (.A(net4),
    .B(net14),
    .X(\pp[29][0] ));
 sky130_fd_sc_hd__xor2_2 _125_ (.A(net115),
    .B(net144),
    .X(net30));
 sky130_fd_sc_hd__and2_4 _126_ (.A(net110),
    .B(net13),
    .X(\pp[4][0] ));
 sky130_fd_sc_hd__and2_1 _127_ (.A(net15),
    .B(net4),
    .X(\pp[30][0] ));
 sky130_fd_sc_hd__and2_1 _128_ (.A(net9),
    .B(net99),
    .X(\pp[40][0] ));
 sky130_fd_sc_hd__and2_1 _129_ (.A(net16),
    .B(net100),
    .X(\pp[39][0] ));
 sky130_fd_sc_hd__and2_1 _130_ (.A(net100),
    .B(net15),
    .X(\pp[38][0] ));
 sky130_fd_sc_hd__and2_1 _131_ (.A(net16),
    .B(net1),
    .X(\pp[7][0] ));
 sky130_fd_sc_hd__a2111oi_4 _132_ (.A1(_035_),
    .A2(net112),
    .B1(net78),
    .C1(net86),
    .D1(_039_),
    .Y(_054_));
 sky130_fd_sc_hd__nor3_1 _133_ (.A(net85),
    .B(net78),
    .C(net86),
    .Y(_055_));
 sky130_fd_sc_hd__nor2_1 _134_ (.A(net78),
    .B(net77),
    .Y(_056_));
 sky130_fd_sc_hd__nor3_2 _135_ (.A(_056_),
    .B(_055_),
    .C(_054_),
    .Y(_057_));
 sky130_fd_sc_hd__xor2_1 _136_ (.A(_057_),
    .B(net84),
    .X(net21));
 sky130_fd_sc_hd__or3_4 _137_ (.A(net86),
    .B(_052_),
    .C(net75),
    .X(_058_));
 sky130_fd_sc_hd__o21ai_0 _138_ (.A1(net73),
    .A2(net75),
    .B1(net85),
    .Y(_059_));
 sky130_fd_sc_hd__nand2b_1 _139_ (.A_N(net86),
    .B(_059_),
    .Y(_060_));
 sky130_fd_sc_hd__o21ai_2 _140_ (.A1(net111),
    .A2(_058_),
    .B1(_060_),
    .Y(_061_));
 sky130_fd_sc_hd__xnor2_1 _141_ (.A(net77),
    .B(_061_),
    .Y(net20));
 sky130_fd_sc_hd__and2_1 _142_ (.A(net101),
    .B(net13),
    .X(\pp[28][0] ));
 sky130_fd_sc_hd__and3_1 _143_ (.A(_009_),
    .B(_011_),
    .C(_023_),
    .X(_062_));
 sky130_fd_sc_hd__nand4_1 _144_ (.A(_027_),
    .B(_034_),
    .C(net79),
    .D(_062_),
    .Y(_063_));
 sky130_fd_sc_hd__a21oi_2 _145_ (.A1(net72),
    .A2(net148),
    .B1(_063_),
    .Y(_064_));
 sky130_fd_sc_hd__a21o_1 _146_ (.A1(_009_),
    .A2(_026_),
    .B1(_008_),
    .X(_065_));
 sky130_fd_sc_hd__a21o_1 _147_ (.A1(_023_),
    .A2(_065_),
    .B1(_022_),
    .X(_066_));
 sky130_fd_sc_hd__a21o_1 _148_ (.A1(net84),
    .A2(_066_),
    .B1(_010_),
    .X(_067_));
 sky130_fd_sc_hd__a311oi_2 _149_ (.A1(net73),
    .A2(_062_),
    .A3(_052_),
    .B1(_064_),
    .C1(_067_),
    .Y(_068_));
 sky130_fd_sc_hd__xnor2_1 _150_ (.A(_068_),
    .B(_013_),
    .Y(net22));
 sky130_fd_sc_hd__and2_1 _151_ (.A(net100),
    .B(net13),
    .X(\pp[36][0] ));
 sky130_fd_sc_hd__and2_1 _152_ (.A(net109),
    .B(net99),
    .X(\pp[41][0] ));
 sky130_fd_sc_hd__a21o_1 _153_ (.A1(net160),
    .A2(net115),
    .B1(net82),
    .X(_069_));
 sky130_fd_sc_hd__a21oi_2 _154_ (.A1(net151),
    .A2(_069_),
    .B1(_024_),
    .Y(_070_));
 sky130_fd_sc_hd__xnor2_1 _155_ (.A(net83),
    .B(_070_),
    .Y(net32));
 sky130_fd_sc_hd__and2_1 _156_ (.A(net11),
    .B(net110),
    .X(\pp[2][0] ));
 sky130_fd_sc_hd__and2_1 _157_ (.A(net110),
    .B(net107),
    .X(\pp[3][0] ));
 sky130_fd_sc_hd__and2_1 _158_ (.A(net10),
    .B(net110),
    .X(\pp[1][0] ));
 sky130_fd_sc_hd__and2_1 _159_ (.A(net97),
    .B(net110),
    .X(net17));
 sky130_fd_sc_hd__nand2_4 _160_ (.A(net158),
    .B(_045_),
    .Y(_071_));
 sky130_fd_sc_hd__xor2_1 _161_ (.A(net79),
    .B(net157),
    .X(net29));
 sky130_fd_sc_hd__a21oi_4 _162_ (.A1(net89),
    .A2(net92),
    .B1(net90),
    .Y(_072_));
 sky130_fd_sc_hd__xnor2_2 _163_ (.A(_072_),
    .B(net159),
    .Y(net28));
 sky130_fd_sc_hd__and2_4 _164_ (.A(net103),
    .B(net13),
    .X(\pp[12][0] ));
 sky130_fd_sc_hd__and2_1 _165_ (.A(net16),
    .B(net98),
    .X(\pp[63][0] ));
 sky130_fd_sc_hd__and2_4 _166_ (.A(net14),
    .B(net2),
    .X(\pp[13][0] ));
 sky130_fd_sc_hd__and2_1 _167_ (.A(net15),
    .B(net98),
    .X(\pp[62][0] ));
 sky130_fd_sc_hd__and2_1 _168_ (.A(net124),
    .B(net97),
    .X(\pp[16][0] ));
 sky130_fd_sc_hd__and2_1 _169_ (.A(net2),
    .B(net16),
    .X(\pp[15][0] ));
 sky130_fd_sc_hd__and2_4 _170_ (.A(net2),
    .B(net15),
    .X(\pp[14][0] ));
 sky130_fd_sc_hd__and2_1 _171_ (.A(net104),
    .B(net98),
    .X(\pp[61][0] ));
 sky130_fd_sc_hd__and2_1 _172_ (.A(net109),
    .B(net124),
    .X(\pp[17][0] ));
 sky130_fd_sc_hd__and2_1 _173_ (.A(net105),
    .B(net98),
    .X(\pp[60][0] ));
 sky130_fd_sc_hd__and2_4 _174_ (.A(net123),
    .B(net12),
    .X(\pp[19][0] ));
 sky130_fd_sc_hd__and2_4 _175_ (.A(net124),
    .B(net11),
    .X(\pp[18][0] ));
 sky130_fd_sc_hd__and2_1 _176_ (.A(net106),
    .B(net8),
    .X(\pp[59][0] ));
 sky130_fd_sc_hd__and2_4 _177_ (.A(net123),
    .B(net13),
    .X(\pp[20][0] ));
 sky130_fd_sc_hd__and2_1 _178_ (.A(net108),
    .B(net8),
    .X(\pp[58][0] ));
 sky130_fd_sc_hd__and2_1 _179_ (.A(net109),
    .B(net8),
    .X(\pp[57][0] ));
 sky130_fd_sc_hd__and2_1 _180_ (.A(net9),
    .B(net8),
    .X(\pp[56][0] ));
 sky130_fd_sc_hd__and2_1 _181_ (.A(net16),
    .B(net7),
    .X(\pp[55][0] ));
 sky130_fd_sc_hd__and2_1 _182_ (.A(net15),
    .B(net7),
    .X(\pp[54][0] ));
 sky130_fd_sc_hd__and2_1 _183_ (.A(net104),
    .B(net7),
    .X(\pp[53][0] ));
 sky130_fd_sc_hd__and2_1 _184_ (.A(net105),
    .B(net7),
    .X(\pp[52][0] ));
 sky130_fd_sc_hd__and2_1 _185_ (.A(net106),
    .B(net7),
    .X(\pp[51][0] ));
 sky130_fd_sc_hd__and2_1 _186_ (.A(net108),
    .B(net7),
    .X(\pp[50][0] ));
 sky130_fd_sc_hd__and2_1 _187_ (.A(net109),
    .B(net7),
    .X(\pp[49][0] ));
 sky130_fd_sc_hd__and2_1 _188_ (.A(net9),
    .B(net7),
    .X(\pp[48][0] ));
 sky130_fd_sc_hd__and2_1 _189_ (.A(net16),
    .B(net6),
    .X(\pp[47][0] ));
 sky130_fd_sc_hd__and2_1 _190_ (.A(net15),
    .B(net6),
    .X(\pp[46][0] ));
 sky130_fd_sc_hd__and2_1 _191_ (.A(net104),
    .B(net99),
    .X(\pp[45][0] ));
 sky130_fd_sc_hd__and2_1 _192_ (.A(net105),
    .B(net99),
    .X(\pp[44][0] ));
 sky130_fd_sc_hd__and2_4 _193_ (.A(net155),
    .B(net107),
    .X(\pp[11][0] ));
 sky130_fd_sc_hd__and2_1 _194_ (.A(net12),
    .B(net6),
    .X(\pp[43][0] ));
 sky130_fd_sc_hd__and2_1 _195_ (.A(net108),
    .B(net99),
    .X(\pp[42][0] ));
 sky130_fd_sc_hd__and2_4 _196_ (.A(net155),
    .B(net11),
    .X(\pp[10][0] ));
 sky130_fd_sc_hd__and2_4 _197_ (.A(net15),
    .B(net3),
    .X(\pp[22][0] ));
 sky130_fd_sc_hd__and2_4 _198_ (.A(net1),
    .B(net14),
    .X(\pp[5][0] ));
 sky130_fd_sc_hd__inv_1 _199_ (.A(net151),
    .Y(_073_));
 sky130_fd_sc_hd__a21o_1 _200_ (.A1(net79),
    .A2(_071_),
    .B1(net80),
    .X(_074_));
 sky130_fd_sc_hd__a2111oi_2 _201_ (.A1(net79),
    .A2(_071_),
    .B1(net80),
    .C1(_073_),
    .D1(net82),
    .Y(_075_));
 sky130_fd_sc_hd__nor2_1 _202_ (.A(net115),
    .B(net82),
    .Y(_076_));
 sky130_fd_sc_hd__mux2_4 _203_ (.A0(net82),
    .A1(_076_),
    .S(net151),
    .X(_077_));
 sky130_fd_sc_hd__a311o_1 _204_ (.A1(net115),
    .A2(_073_),
    .A3(_074_),
    .B1(_075_),
    .C1(_077_),
    .X(net31));
 sky130_fd_sc_hd__fa_1 _205_ (.A(_000_),
    .B(\pp[16][0] ),
    .CIN(\s4_c2_ha.sum ),
    .COUT(_001_),
    .SUM(net25));
 sky130_fd_sc_hd__fa_2 _206_ (.A(\pp[14][0] ),
    .B(\pp[21][0] ),
    .CIN(\pp[7][0] ),
    .COUT(s1_c7_c1),
    .SUM(\s1_c7_fa.sum ));
 sky130_fd_sc_hd__fa_1 _207_ (.A(\pp[29][0] ),
    .B(\pp[22][0] ),
    .CIN(\pp[15][0] ),
    .COUT(s1_c8_c1),
    .SUM(\s1_c8_fa.sum ));
 sky130_fd_sc_hd__fa_2 _208_ (.A(\pp[23][0] ),
    .B(\pp[37][0] ),
    .CIN(\pp[30][0] ),
    .COUT(s1_c9_c),
    .SUM(\s1_c9_fa.sum ));
 sky130_fd_sc_hd__fa_2 _209_ (.A(s1_c9_c),
    .B(\pp[31][0] ),
    .CIN(\pp[38][0] ),
    .COUT(s2_c10_c1),
    .SUM(\s2_c10_fa1.sum ));
 sky130_fd_sc_hd__fa_1 _210_ (.A(\pp[45][0] ),
    .B(\pp[52][0] ),
    .CIN(\pp[59][0] ),
    .COUT(s2_c10_c2),
    .SUM(\s2_c10_fa2.sum ));
 sky130_fd_sc_hd__fa_1 _211_ (.A(\pp[39][0] ),
    .B(\pp[46][0] ),
    .CIN(\pp[53][0] ),
    .COUT(s2_c11_c1),
    .SUM(\s2_c11_fa.sum ));
 sky130_fd_sc_hd__fa_1 _212_ (.A(\pp[5][0] ),
    .B(\pp[12][0] ),
    .CIN(\pp[19][0] ),
    .COUT(s2_c5_c1),
    .SUM(\s2_c5_fa.sum ));
 sky130_fd_sc_hd__fa_1 _213_ (.A(\pp[20][0] ),
    .B(\s1_c6_ha.sum ),
    .CIN(\pp[27][0] ),
    .COUT(s2_c6_c1),
    .SUM(\s2_c6_fa1.sum ));
 sky130_fd_sc_hd__fa_1 _214_ (.A(\pp[34][0] ),
    .B(\pp[41][0] ),
    .CIN(\pp[48][0] ),
    .COUT(s2_c6_c2),
    .SUM(\s2_c6_fa2.sum ));
 sky130_fd_sc_hd__fa_2 _215_ (.A(\s1_c7_fa.sum ),
    .B(s1_c6_c),
    .CIN(\s1_c7_ha.sum ),
    .COUT(s2_c7_c1),
    .SUM(\s2_c7_fa1.sum ));
 sky130_fd_sc_hd__fa_1 _216_ (.A(\pp[42][0] ),
    .B(\pp[49][0] ),
    .CIN(\pp[56][0] ),
    .COUT(s2_c7_c2),
    .SUM(\s2_c7_fa2.sum ));
 sky130_fd_sc_hd__fa_2 _217_ (.A(s1_c7_c1),
    .B(\s1_c8_fa.sum ),
    .CIN(s1_c7_c2),
    .COUT(s2_c8_c1),
    .SUM(\s2_c8_fa1.sum ));
 sky130_fd_sc_hd__fa_1 _218_ (.A(\pp[50][0] ),
    .B(\pp[57][0] ),
    .CIN(\s1_c8_ha.sum ),
    .COUT(s2_c8_c2),
    .SUM(\s2_c8_fa2.sum ));
 sky130_fd_sc_hd__fa_2 _219_ (.A(s1_c8_c1),
    .B(\s1_c9_fa.sum ),
    .CIN(s1_c8_c2),
    .COUT(s2_c9_c1),
    .SUM(\s2_c9_fa1.sum ));
 sky130_fd_sc_hd__fa_1 _220_ (.A(\pp[44][0] ),
    .B(\pp[51][0] ),
    .CIN(\pp[58][0] ),
    .COUT(s2_c9_c2),
    .SUM(\s2_c9_fa2.sum ));
 sky130_fd_sc_hd__fa_2 _221_ (.A(s2_c9_c1),
    .B(s2_c9_c2),
    .CIN(\s2_c10_fa1.sum ),
    .COUT(s3_c10_c),
    .SUM(\s3_c10_fa.sum ));
 sky130_fd_sc_hd__fa_1 _222_ (.A(s2_c10_c1),
    .B(s2_c10_c2),
    .CIN(\s2_c11_fa.sum ),
    .COUT(s3_c11_c),
    .SUM(\s3_c11_fa.sum ));
 sky130_fd_sc_hd__fa_1 _223_ (.A(s2_c11_c1),
    .B(\pp[47][0] ),
    .CIN(\pp[54][0] ),
    .COUT(s3_c12_c),
    .SUM(\s3_c12_fa.sum ));
 sky130_fd_sc_hd__fa_1 _224_ (.A(\pp[18][0] ),
    .B(\s2_c4_ha.sum ),
    .CIN(\pp[25][0] ),
    .COUT(s3_c4_c),
    .SUM(\s3_c4_fa.sum ));
 sky130_fd_sc_hd__fa_1 _225_ (.A(\s2_c5_fa.sum ),
    .B(\s2_c5_ha.sum ),
    .CIN(s2_c4_c),
    .COUT(s3_c5_c),
    .SUM(\s3_c5_fa.sum ));
 sky130_fd_sc_hd__fa_1 _226_ (.A(s2_c5_c1),
    .B(s2_c5_c2),
    .CIN(\s2_c6_fa1.sum ),
    .COUT(s3_c6_c),
    .SUM(\s3_c6_fa.sum ));
 sky130_fd_sc_hd__fa_1 _227_ (.A(s2_c6_c1),
    .B(s2_c6_c2),
    .CIN(\s2_c7_fa1.sum ),
    .COUT(s3_c7_c),
    .SUM(\s3_c7_fa.sum ));
 sky130_fd_sc_hd__fa_2 _228_ (.A(s2_c7_c1),
    .B(s2_c7_c2),
    .CIN(\s2_c8_fa1.sum ),
    .COUT(s3_c8_c),
    .SUM(\s3_c8_fa.sum ));
 sky130_fd_sc_hd__fa_2 _229_ (.A(s2_c8_c1),
    .B(s2_c8_c2),
    .CIN(\s2_c9_fa1.sum ),
    .COUT(s3_c9_c),
    .SUM(\s3_c9_fa.sum ));
 sky130_fd_sc_hd__fa_1 _230_ (.A(s3_c9_c),
    .B(\s2_c10_fa2.sum ),
    .CIN(\s3_c10_fa.sum ),
    .COUT(s4_c10_c),
    .SUM(\s4_c10_fa.sum ));
 sky130_fd_sc_hd__fa_1 _231_ (.A(s3_c10_c),
    .B(\pp[60][0] ),
    .CIN(\s3_c11_fa.sum ),
    .COUT(s4_c11_c),
    .SUM(\s4_c11_fa.sum ));
 sky130_fd_sc_hd__fa_1 _232_ (.A(s3_c11_c),
    .B(\pp[61][0] ),
    .CIN(\s3_c12_fa.sum ),
    .COUT(s4_c12_c),
    .SUM(\s4_c12_fa.sum ));
 sky130_fd_sc_hd__fa_1 _233_ (.A(s3_c12_c),
    .B(\pp[55][0] ),
    .CIN(\pp[62][0] ),
    .COUT(s4_c13_c),
    .SUM(\s4_c13_fa.sum ));
 sky130_fd_sc_hd__fa_1 _234_ (.A(\pp[17][0] ),
    .B(\pp[24][0] ),
    .CIN(\s3_c3_ha.sum ),
    .COUT(s4_c3_c),
    .SUM(\s4_c3_fa.sum ));
 sky130_fd_sc_hd__fa_1 _235_ (.A(s3_c3_c),
    .B(\s3_c4_fa.sum ),
    .CIN(\pp[32][0] ),
    .COUT(s4_c4_c),
    .SUM(\s4_c4_fa.sum ));
 sky130_fd_sc_hd__fa_1 _236_ (.A(s3_c4_c),
    .B(\pp[40][0] ),
    .CIN(\s3_c5_fa.sum ),
    .COUT(s4_c5_c),
    .SUM(\s4_c5_fa.sum ));
 sky130_fd_sc_hd__fa_1 _237_ (.A(s3_c5_c),
    .B(\s2_c6_fa2.sum ),
    .CIN(\s3_c6_fa.sum ),
    .COUT(s4_c6_c),
    .SUM(\s4_c6_fa.sum ));
 sky130_fd_sc_hd__fa_1 _238_ (.A(s3_c6_c),
    .B(\s2_c7_fa2.sum ),
    .CIN(\s3_c7_fa.sum ),
    .COUT(s4_c7_c),
    .SUM(\s4_c7_fa.sum ));
 sky130_fd_sc_hd__fa_2 _239_ (.A(s3_c7_c),
    .B(\s3_c8_fa.sum ),
    .CIN(\s2_c8_fa2.sum ),
    .COUT(s4_c8_c),
    .SUM(\s4_c8_fa.sum ));
 sky130_fd_sc_hd__fa_1 _240_ (.A(s3_c8_c),
    .B(\s2_c9_fa2.sum ),
    .CIN(\s3_c9_fa.sum ),
    .COUT(s4_c9_c),
    .SUM(\s4_c9_fa.sum ));
 sky130_fd_sc_hd__ha_4 _241_ (.A(s4_c4_c),
    .B(\s4_c5_fa.sum ),
    .COUT(_002_),
    .SUM(_003_));
 sky130_fd_sc_hd__ha_1 _242_ (.A(s4_c2_c),
    .B(\s4_c3_fa.sum ),
    .COUT(_004_),
    .SUM(_005_));
 sky130_fd_sc_hd__ha_1 _243_ (.A(net96),
    .B(\s4_c2_ha.sum ),
    .COUT(_006_),
    .SUM(_007_));
 sky130_fd_sc_hd__ha_1 _244_ (.A(\s4_c11_fa.sum ),
    .B(s4_c10_c),
    .COUT(_008_),
    .SUM(_009_));
 sky130_fd_sc_hd__ha_1 _245_ (.A(s4_c12_c),
    .B(\s4_c13_fa.sum ),
    .COUT(_010_),
    .SUM(_011_));
 sky130_fd_sc_hd__ha_1 _246_ (.A(s4_c13_c),
    .B(\pp[63][0] ),
    .COUT(_012_),
    .SUM(_013_));
 sky130_fd_sc_hd__ha_4 _247_ (.A(s4_c8_c),
    .B(\s4_c9_fa.sum ),
    .COUT(_014_),
    .SUM(_015_));
 sky130_fd_sc_hd__ha_1 _248_ (.A(\pp[1][0] ),
    .B(\pp[8][0] ),
    .COUT(_000_),
    .SUM(net24));
 sky130_fd_sc_hd__ha_4 _249_ (.A(s4_c6_c),
    .B(\s4_c7_fa.sum ),
    .COUT(_016_),
    .SUM(_017_));
 sky130_fd_sc_hd__ha_4 _250_ (.A(s4_c3_c),
    .B(\s4_c4_fa.sum ),
    .COUT(_018_),
    .SUM(_019_));
 sky130_fd_sc_hd__ha_4 _251_ (.A(\s4_c6_fa.sum ),
    .B(s4_c5_c),
    .COUT(_020_),
    .SUM(_021_));
 sky130_fd_sc_hd__ha_1 _252_ (.A(s4_c11_c),
    .B(\s4_c12_fa.sum ),
    .COUT(_022_),
    .SUM(_023_));
 sky130_fd_sc_hd__ha_4 _253_ (.A(s4_c7_c),
    .B(\s4_c8_fa.sum ),
    .COUT(_024_),
    .SUM(_025_));
 sky130_fd_sc_hd__ha_4 _254_ (.A(\pp[13][0] ),
    .B(\pp[6][0] ),
    .COUT(s1_c6_c),
    .SUM(\s1_c6_ha.sum ));
 sky130_fd_sc_hd__ha_1 _255_ (.A(\pp[28][0] ),
    .B(\pp[35][0] ),
    .COUT(s1_c7_c2),
    .SUM(\s1_c7_ha.sum ));
 sky130_fd_sc_hd__ha_1 _256_ (.A(\pp[36][0] ),
    .B(\pp[43][0] ),
    .COUT(s1_c8_c2),
    .SUM(\s1_c8_ha.sum ));
 sky130_fd_sc_hd__ha_4 _257_ (.A(\pp[4][0] ),
    .B(\pp[11][0] ),
    .COUT(s2_c4_c),
    .SUM(\s2_c4_ha.sum ));
 sky130_fd_sc_hd__ha_1 _258_ (.A(\pp[26][0] ),
    .B(\pp[33][0] ),
    .COUT(s2_c5_c2),
    .SUM(\s2_c5_ha.sum ));
 sky130_fd_sc_hd__ha_4 _259_ (.A(\pp[3][0] ),
    .B(\pp[10][0] ),
    .COUT(s3_c3_c),
    .SUM(\s3_c3_ha.sum ));
 sky130_fd_sc_hd__ha_1 _260_ (.A(\pp[2][0] ),
    .B(\pp[9][0] ),
    .COUT(s4_c2_c),
    .SUM(\s4_c2_ha.sum ));
 sky130_fd_sc_hd__ha_1 _261_ (.A(s4_c9_c),
    .B(\s4_c10_fa.sum ),
    .COUT(_026_),
    .SUM(_027_));
 sky130_fd_sc_hd__buf_8 input1 (.A(A[0]),
    .X(net1));
 sky130_fd_sc_hd__dlygate4sd2_1 input10 (.A(B[1]),
    .X(net10));
 sky130_fd_sc_hd__buf_2 input11 (.A(B[2]),
    .X(net11));
 sky130_fd_sc_hd__buf_6 input12 (.A(B[3]),
    .X(net12));
 sky130_fd_sc_hd__buf_2 input13 (.A(B[4]),
    .X(net13));
 sky130_fd_sc_hd__buf_8 input14 (.A(B[5]),
    .X(net14));
 sky130_fd_sc_hd__buf_8 input15 (.A(B[6]),
    .X(net15));
 sky130_fd_sc_hd__buf_8 input16 (.A(B[7]),
    .X(net16));
 sky130_fd_sc_hd__buf_8 input2 (.A(A[1]),
    .X(net2));
 sky130_fd_sc_hd__buf_8 input3 (.A(A[2]),
    .X(net3));
 sky130_fd_sc_hd__buf_6 input4 (.A(A[3]),
    .X(net4));
 sky130_fd_sc_hd__buf_2 input5 (.A(A[4]),
    .X(net5));
 sky130_fd_sc_hd__dlygate4sd2_1 input6 (.A(A[5]),
    .X(net6));
 sky130_fd_sc_hd__dlygate4sd2_1 input7 (.A(A[6]),
    .X(net7));
 sky130_fd_sc_hd__clkdlybuf4s50_1 input8 (.A(A[7]),
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
 sky130_fd_sc_hd__buf_2 output26 (.A(net26),
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
 sky130_fd_sc_hd__buf_4 place100 (.A(net5),
    .X(net100));
 sky130_fd_sc_hd__buf_4 place101 (.A(net4),
    .X(net101));
 sky130_fd_sc_hd__buf_6 place103 (.A(net2),
    .X(net103));
 sky130_fd_sc_hd__buf_4 place104 (.A(net14),
    .X(net104));
 sky130_fd_sc_hd__buf_4 place105 (.A(net13),
    .X(net105));
 sky130_fd_sc_hd__buf_4 place106 (.A(net12),
    .X(net106));
 sky130_fd_sc_hd__buf_4 place107 (.A(net12),
    .X(net107));
 sky130_fd_sc_hd__buf_4 place108 (.A(net11),
    .X(net108));
 sky130_fd_sc_hd__buf_4 place109 (.A(net10),
    .X(net109));
 sky130_fd_sc_hd__buf_6 place110 (.A(net1),
    .X(net110));
 sky130_fd_sc_hd__buf_4 place71 (.A(net72),
    .X(net71));
 sky130_fd_sc_hd__buf_4 place72 (.A(_045_),
    .X(net72));
 sky130_fd_sc_hd__buf_4 place73 (.A(_027_),
    .X(net73));
 sky130_fd_sc_hd__buf_4 place74 (.A(_027_),
    .X(net74));
 sky130_fd_sc_hd__buf_4 place75 (.A(_026_),
    .X(net75));
 sky130_fd_sc_hd__buf_4 place77 (.A(_023_),
    .X(net77));
 sky130_fd_sc_hd__buf_4 place78 (.A(_022_),
    .X(net78));
 sky130_fd_sc_hd__buf_4 place79 (.A(_021_),
    .X(net79));
 sky130_fd_sc_hd__buf_4 place80 (.A(_020_),
    .X(net80));
 sky130_fd_sc_hd__buf_4 place82 (.A(_016_),
    .X(net82));
 sky130_fd_sc_hd__buf_4 place83 (.A(net145),
    .X(net83));
 sky130_fd_sc_hd__buf_4 place84 (.A(_011_),
    .X(net84));
 sky130_fd_sc_hd__buf_4 place85 (.A(_009_),
    .X(net85));
 sky130_fd_sc_hd__buf_4 place86 (.A(_008_),
    .X(net86));
 sky130_fd_sc_hd__buf_4 place87 (.A(_046_),
    .X(net87));
 sky130_fd_sc_hd__buf_6 place89 (.A(_019_),
    .X(net89));
 sky130_fd_sc_hd__buf_4 place90 (.A(_018_),
    .X(net90));
 sky130_fd_sc_hd__buf_4 place92 (.A(_031_),
    .X(net92));
 sky130_fd_sc_hd__buf_4 place94 (.A(_004_),
    .X(net94));
 sky130_fd_sc_hd__buf_4 place95 (.A(_001_),
    .X(net95));
 sky130_fd_sc_hd__buf_4 place96 (.A(\pp[16][0] ),
    .X(net96));
 sky130_fd_sc_hd__buf_4 place97 (.A(net9),
    .X(net97));
 sky130_fd_sc_hd__buf_4 place98 (.A(net8),
    .X(net98));
 sky130_fd_sc_hd__buf_4 place99 (.A(net6),
    .X(net99));
 sky130_fd_sc_hd__buf_4 rebuffer111 (.A(_048_),
    .X(net111));
 sky130_fd_sc_hd__buf_6 rebuffer112 (.A(_033_),
    .X(net112));
 sky130_fd_sc_hd__buf_4 rebuffer113 (.A(_052_),
    .X(net113));
 sky130_fd_sc_hd__buf_6 rebuffer114 (.A(_035_),
    .X(net114));
 sky130_fd_sc_hd__buf_4 rebuffer115 (.A(_017_),
    .X(net115));
 sky130_fd_sc_hd__buf_6 rebuffer123 (.A(net3),
    .X(net123));
 sky130_fd_sc_hd__buf_6 rebuffer124 (.A(net156),
    .X(net124));
 sky130_fd_sc_hd__buf_6 rebuffer142 (.A(_003_),
    .X(net142));
 sky130_fd_sc_hd__buf_4 rebuffer143 (.A(net112),
    .X(net143));
 sky130_fd_sc_hd__buf_6 rebuffer144 (.A(net112),
    .X(net144));
 sky130_fd_sc_hd__buf_4 rebuffer145 (.A(_015_),
    .X(net145));
 sky130_fd_sc_hd__buf_4 rebuffer148 (.A(_046_),
    .X(net148));
 sky130_fd_sc_hd__buf_6 rebuffer151 (.A(net153),
    .X(net151));
 sky130_fd_sc_hd__buf_4 rebuffer153 (.A(_025_),
    .X(net153));
 sky130_fd_sc_hd__buf_6 rebuffer154 (.A(_030_),
    .X(net154));
 sky130_fd_sc_hd__buf_6 rebuffer155 (.A(net103),
    .X(net155));
 sky130_fd_sc_hd__buf_4 rebuffer156 (.A(net123),
    .X(net156));
 sky130_fd_sc_hd__buf_6 rebuffer157 (.A(_071_),
    .X(net157));
 sky130_fd_sc_hd__buf_4 rebuffer158 (.A(_046_),
    .X(net158));
 sky130_fd_sc_hd__buf_6 rebuffer159 (.A(net142),
    .X(net159));
 sky130_fd_sc_hd__buf_6 rebuffer160 (.A(_033_),
    .X(net160));
 sky130_fd_sc_hd__buf_4 rebuffer181 (.A(_005_),
    .X(net181));
endmodule
