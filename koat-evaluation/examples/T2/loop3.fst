model main {
  var A, B, C;
  states f0, f154, f160, f166, f172, f180, f186, f192, f198, f206, f212, f218, f224, f232, f238, f244, f250, f258, f264, f270, f276, f284, f290, f296, f302, f310, f316, f322, f328, f336, f342, f348, f354, f362, f368, f374, f380, f388, f394, f400, f406, f414, f420, f426, f432, f440, f446, f452, f458, f466, f472, f478, f484, f492, f498, f504, f510, f518, f524, f530, f536, f544, f550, f556, f562, f570, f576, f582, f588, f596, f602, f608, f614, f622, f628, f634, f640, f648, f654, f660, f666, f674, f680, f686, f692, f700, f706, f712, f718, f726, f732, f738, f744, f752, f758, f764, f770, f778, f784, f790, f796, f804, f810, f816, f822, f830, f836, f842, f848, f856, f862, f868, f874, f882, f888, f894, f900, f908, f914, f920, f926, f934;
  transition t0 := {
    from   := f0;
    to     := f154;
    guard  := true;
    action := A' = 0, B' = 2, C' = 0;
  };
  transition t1 := {
    from   := f154;
    to     := f154;
    guard  := 2 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t2 := {
    from   := f160;
    to     := f160;
    guard  := 3 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t3 := {
    from   := f166;
    to     := f166;
    guard  := 2 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t4 := {
    from   := f172;
    to     := f172;
    guard  := 3 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t5 := {
    from   := f180;
    to     := f180;
    guard  := 1 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t6 := {
    from   := f186;
    to     := f186;
    guard  := 2 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t7 := {
    from   := f192;
    to     := f192;
    guard  := 1 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t8 := {
    from   := f198;
    to     := f198;
    guard  := 2 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t9 := {
    from   := f206;
    to     := f206;
    guard  := 0 > 2 + C;
    action := A' = A + C, C' = C + 1;
  };
  transition t10 := {
    from   := f212;
    to     := f212;
    guard  := 0 > 1 + C;
    action := A' = A + C, C' = C + 1;
  };
  transition t11 := {
    from   := f218;
    to     := f218;
    guard  := 0 > 2 + C;
    action := A' = A + C, C' = C + 1;
  };
  transition t12 := {
    from   := f224;
    to     := f224;
    guard  := 0 > 1 + C;
    action := A' = A + C, C' = C + 1;
  };
  transition t13 := {
    from   := f232;
    to     := f232;
    guard  := 0 > 1 + C;
    action := A' = A + C, C' = C + 1;
  };
  transition t14 := {
    from   := f238;
    to     := f238;
    guard  := 0 > C;
    action := A' = A + C, C' = C + 1;
  };
  transition t15 := {
    from   := f244;
    to     := f244;
    guard  := 0 > 1 + C;
    action := A' = A + C, C' = C + 1;
  };
  transition t16 := {
    from   := f250;
    to     := f250;
    guard  := 0 > C;
    action := A' = A + C, C' = C + 1;
  };
  transition t17 := {
    from   := f258;
    to     := f258;
    guard  := 0 > C;
    action := A' = A + C, C' = C + 1;
  };
  transition t18 := {
    from   := f264;
    to     := f264;
    guard  := 0 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t19 := {
    from   := f270;
    to     := f270;
    guard  := 0 > C;
    action := A' = A + C, C' = C + 1;
  };
  transition t20 := {
    from   := f276;
    to     := f276;
    guard  := 0 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t21 := {
    from   := f284;
    to     := f284;
    guard  := 3 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t22 := {
    from   := f290;
    to     := f290;
    guard  := 4 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t23 := {
    from   := f296;
    to     := f296;
    guard  := 3 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t24 := {
    from   := f302;
    to     := f302;
    guard  := 4 >= C;
    action := A' = A + C, C' = C + 1;
  };
  transition t25 := {
    from   := f310;
    to     := f310;
    guard  := 2 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t26 := {
    from   := f316;
    to     := f316;
    guard  := 3 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t27 := {
    from   := f322;
    to     := f322;
    guard  := 2 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t28 := {
    from   := f328;
    to     := f328;
    guard  := 3 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t29 := {
    from   := f336;
    to     := f336;
    guard  := 1 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t30 := {
    from   := f342;
    to     := f342;
    guard  := 2 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t31 := {
    from   := f348;
    to     := f348;
    guard  := 1 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t32 := {
    from   := f354;
    to     := f354;
    guard  := 2 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t33 := {
    from   := f362;
    to     := f362;
    guard  := 0 > 2 + C;
    action := A' = A + C, C' = C + B;
  };
  transition t34 := {
    from   := f368;
    to     := f368;
    guard  := 0 > 1 + C;
    action := A' = A + C, C' = C + B;
  };
  transition t35 := {
    from   := f374;
    to     := f374;
    guard  := 0 > 2 + C;
    action := A' = A + C, C' = C + B;
  };
  transition t36 := {
    from   := f380;
    to     := f380;
    guard  := 0 > 1 + C;
    action := A' = A + C, C' = C + B;
  };
  transition t37 := {
    from   := f388;
    to     := f388;
    guard  := 0 > 1 + C;
    action := A' = A + C, C' = C + B;
  };
  transition t38 := {
    from   := f394;
    to     := f394;
    guard  := 0 > C;
    action := A' = A + C, C' = C + B;
  };
  transition t39 := {
    from   := f400;
    to     := f400;
    guard  := 0 > 1 + C;
    action := A' = A + C, C' = C + B;
  };
  transition t40 := {
    from   := f406;
    to     := f406;
    guard  := 0 > C;
    action := A' = A + C, C' = C + B;
  };
  transition t41 := {
    from   := f414;
    to     := f414;
    guard  := 0 > C;
    action := A' = A + C, C' = C + B;
  };
  transition t42 := {
    from   := f420;
    to     := f420;
    guard  := 0 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t43 := {
    from   := f426;
    to     := f426;
    guard  := 0 > C;
    action := A' = A + C, C' = C + B;
  };
  transition t44 := {
    from   := f432;
    to     := f432;
    guard  := 0 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t45 := {
    from   := f440;
    to     := f440;
    guard  := 3 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t46 := {
    from   := f446;
    to     := f446;
    guard  := 4 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t47 := {
    from   := f452;
    to     := f452;
    guard  := 3 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t48 := {
    from   := f458;
    to     := f458;
    guard  := 4 >= C;
    action := A' = A + C, C' = C + B;
  };
  transition t49 := {
    from   := f466;
    to     := f466;
    guard  := C > 2;
    action := A' = A + C, C' = C - 1;
  };
  transition t50 := {
    from   := f472;
    to     := f472;
    guard  := C > 1;
    action := A' = A + C, C' = C - 1;
  };
  transition t51 := {
    from   := f478;
    to     := f478;
    guard  := C > 2;
    action := A' = A + C, C' = C - 1;
  };
  transition t52 := {
    from   := f484;
    to     := f484;
    guard  := C > 1;
    action := A' = A + C, C' = C - 1;
  };
  transition t53 := {
    from   := f492;
    to     := f492;
    guard  := C > 1;
    action := A' = A + C, C' = C - 1;
  };
  transition t54 := {
    from   := f498;
    to     := f498;
    guard  := C > 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t55 := {
    from   := f504;
    to     := f504;
    guard  := C > 1;
    action := A' = A + C, C' = C - 1;
  };
  transition t56 := {
    from   := f510;
    to     := f510;
    guard  := C > 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t57 := {
    from   := f518;
    to     := f518;
    guard  := C > 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t58 := {
    from   := f524;
    to     := f524;
    guard  := C >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t59 := {
    from   := f530;
    to     := f530;
    guard  := C > 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t60 := {
    from   := f536;
    to     := f536;
    guard  := C >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t61 := {
    from   := f544;
    to     := f544;
    guard  := C >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t62 := {
    from   := f550;
    to     := f550;
    guard  := C + 1 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t63 := {
    from   := f556;
    to     := f556;
    guard  := C >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t64 := {
    from   := f562;
    to     := f562;
    guard  := C + 1 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t65 := {
    from   := f570;
    to     := f570;
    guard  := C + 1 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t66 := {
    from   := f576;
    to     := f576;
    guard  := C + 2 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t67 := {
    from   := f582;
    to     := f582;
    guard  := C + 1 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t68 := {
    from   := f588;
    to     := f588;
    guard  := C + 2 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t69 := {
    from   := f596;
    to     := f596;
    guard  := C + 2 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t70 := {
    from   := f602;
    to     := f602;
    guard  := C + 3 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t71 := {
    from   := f608;
    to     := f608;
    guard  := C + 2 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t72 := {
    from   := f614;
    to     := f614;
    guard  := C + 3 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t73 := {
    from   := f622;
    to     := f622;
    guard  := C + 4 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t74 := {
    from   := f628;
    to     := f628;
    guard  := C + 5 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t75 := {
    from   := f634;
    to     := f634;
    guard  := C + 4 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t76 := {
    from   := f640;
    to     := f640;
    guard  := C + 5 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t77 := {
    from   := f648;
    to     := f648;
    guard  := C + 6 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t78 := {
    from   := f654;
    to     := f654;
    guard  := C + 7 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t79 := {
    from   := f660;
    to     := f660;
    guard  := C + 6 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t80 := {
    from   := f666;
    to     := f666;
    guard  := C + 7 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t81 := {
    from   := f674;
    to     := f674;
    guard  := C + 7 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t82 := {
    from   := f680;
    to     := f680;
    guard  := C + 8 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t83 := {
    from   := f686;
    to     := f686;
    guard  := C + 7 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t84 := {
    from   := f692;
    to     := f692;
    guard  := C + 8 >= 0;
    action := A' = A + C, C' = C - 1;
  };
  transition t85 := {
    from   := f700;
    to     := f700;
    guard  := C > 2;
    action := A' = A + C, C' = C - B;
  };
  transition t86 := {
    from   := f706;
    to     := f706;
    guard  := C > 1;
    action := A' = A + C, C' = C - B;
  };
  transition t87 := {
    from   := f712;
    to     := f712;
    guard  := C > 2;
    action := A' = A + C, C' = C - B;
  };
  transition t88 := {
    from   := f718;
    to     := f718;
    guard  := C > 1;
    action := A' = A + C, C' = C - B;
  };
  transition t89 := {
    from   := f726;
    to     := f726;
    guard  := C > 1;
    action := A' = A + C, C' = C - B;
  };
  transition t90 := {
    from   := f732;
    to     := f732;
    guard  := C > 0;
    action := A' = A + C, C' = C - B;
  };
  transition t91 := {
    from   := f738;
    to     := f738;
    guard  := C > 1;
    action := A' = A + C, C' = C - B;
  };
  transition t92 := {
    from   := f744;
    to     := f744;
    guard  := C > 0;
    action := A' = A + C, C' = C - B;
  };
  transition t93 := {
    from   := f752;
    to     := f752;
    guard  := C > 0;
    action := A' = A + C, C' = C - B;
  };
  transition t94 := {
    from   := f758;
    to     := f758;
    guard  := C >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t95 := {
    from   := f764;
    to     := f764;
    guard  := C > 0;
    action := A' = A + C, C' = C - B;
  };
  transition t96 := {
    from   := f770;
    to     := f770;
    guard  := C >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t97 := {
    from   := f778;
    to     := f778;
    guard  := C >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t98 := {
    from   := f784;
    to     := f784;
    guard  := C + 1 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t99 := {
    from   := f790;
    to     := f790;
    guard  := C >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t100 := {
    from   := f796;
    to     := f796;
    guard  := C + 1 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t101 := {
    from   := f804;
    to     := f804;
    guard  := C + 1 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t102 := {
    from   := f810;
    to     := f810;
    guard  := C + 2 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t103 := {
    from   := f816;
    to     := f816;
    guard  := C + 1 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t104 := {
    from   := f822;
    to     := f822;
    guard  := C + 2 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t105 := {
    from   := f830;
    to     := f830;
    guard  := C + 2 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t106 := {
    from   := f836;
    to     := f836;
    guard  := C + 3 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t107 := {
    from   := f842;
    to     := f842;
    guard  := C + 2 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t108 := {
    from   := f848;
    to     := f848;
    guard  := C + 3 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t109 := {
    from   := f856;
    to     := f856;
    guard  := C + 4 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t110 := {
    from   := f862;
    to     := f862;
    guard  := C + 5 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t111 := {
    from   := f868;
    to     := f868;
    guard  := C + 4 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t112 := {
    from   := f874;
    to     := f874;
    guard  := C + 5 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t113 := {
    from   := f882;
    to     := f882;
    guard  := C + 6 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t114 := {
    from   := f888;
    to     := f888;
    guard  := C + 7 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t115 := {
    from   := f894;
    to     := f894;
    guard  := C + 6 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t116 := {
    from   := f900;
    to     := f900;
    guard  := C + 7 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t117 := {
    from   := f908;
    to     := f908;
    guard  := C + 7 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t118 := {
    from   := f914;
    to     := f914;
    guard  := C + 8 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t119 := {
    from   := f920;
    to     := f920;
    guard  := C + 7 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t120 := {
    from   := f926;
    to     := f926;
    guard  := C + 8 >= 0;
    action := A' = A + C, C' = C - B;
  };
  transition t121 := {
    from   := f926;
    to     := f934;
    guard  := 0 > 8 + C;
    action := ;
  };
  transition t122 := {
    from   := f920;
    to     := f926;
    guard  := 0 > 7 + C;
    action := C' = 16;
  };
  transition t123 := {
    from   := f914;
    to     := f920;
    guard  := 0 > 8 + C;
    action := C' = 16;
  };
  transition t124 := {
    from   := f908;
    to     := f914;
    guard  := 0 > 7 + C;
    action := C' = 16;
  };
  transition t125 := {
    from   := f900;
    to     := f908;
    guard  := 0 > 7 + C;
    action := C' = 16;
  };
  transition t126 := {
    from   := f894;
    to     := f900;
    guard  := 0 > 6 + C;
    action := C' = -2;
  };
  transition t127 := {
    from   := f888;
    to     := f894;
    guard  := 0 > 7 + C;
    action := C' = -2;
  };
  transition t128 := {
    from   := f882;
    to     := f888;
    guard  := 0 > 6 + C;
    action := C' = -2;
  };
  transition t129 := {
    from   := f874;
    to     := f882;
    guard  := 0 > 5 + C;
    action := C' = -2;
  };
  transition t130 := {
    from   := f868;
    to     := f874;
    guard  := 0 > 4 + C;
    action := C' = -1;
  };
  transition t131 := {
    from   := f862;
    to     := f868;
    guard  := 0 > 5 + C;
    action := C' = -1;
  };
  transition t132 := {
    from   := f856;
    to     := f862;
    guard  := 0 > 4 + C;
    action := C' = -1;
  };
  transition t133 := {
    from   := f848;
    to     := f856;
    guard  := 0 > 3 + C;
    action := C' = -1;
  };
  transition t134 := {
    from   := f842;
    to     := f848;
    guard  := 0 > 2 + C;
    action := C' = 0;
  };
  transition t135 := {
    from   := f836;
    to     := f842;
    guard  := 0 > 3 + C;
    action := C' = 0;
  };
  transition t136 := {
    from   := f830;
    to     := f836;
    guard  := 0 > 2 + C;
    action := C' = 0;
  };
  transition t137 := {
    from   := f822;
    to     := f830;
    guard  := 0 > 2 + C;
    action := C' = 0;
  };
  transition t138 := {
    from   := f816;
    to     := f822;
    guard  := 0 > 1 + C;
    action := C' = 9;
  };
  transition t139 := {
    from   := f810;
    to     := f816;
    guard  := 0 > 2 + C;
    action := C' = 9;
  };
  transition t140 := {
    from   := f804;
    to     := f810;
    guard  := 0 > 1 + C;
    action := C' = 9;
  };
  transition t141 := {
    from   := f796;
    to     := f804;
    guard  := 0 > 1 + C;
    action := C' = 9;
  };
  transition t142 := {
    from   := f790;
    to     := f796;
    guard  := 0 > C;
    action := C' = 8;
  };
  transition t143 := {
    from   := f784;
    to     := f790;
    guard  := 0 > 1 + C;
    action := C' = 8;
  };
  transition t144 := {
    from   := f778;
    to     := f784;
    guard  := 0 > C;
    action := C' = 8;
  };
  transition t145 := {
    from   := f770;
    to     := f778;
    guard  := 0 > C;
    action := C' = 8;
  };
  transition t146 := {
    from   := f764;
    to     := f770;
    guard  := 0 >= C;
    action := C' = 7;
  };
  transition t147 := {
    from   := f758;
    to     := f764;
    guard  := 0 > C;
    action := C' = 7;
  };
  transition t148 := {
    from   := f752;
    to     := f758;
    guard  := 0 >= C;
    action := C' = 7;
  };
  transition t149 := {
    from   := f744;
    to     := f752;
    guard  := 0 >= C;
    action := C' = 7;
  };
  transition t150 := {
    from   := f738;
    to     := f744;
    guard  := 1 >= C;
    action := C' = 6;
  };
  transition t151 := {
    from   := f732;
    to     := f738;
    guard  := 0 >= C;
    action := C' = 6;
  };
  transition t152 := {
    from   := f726;
    to     := f732;
    guard  := 1 >= C;
    action := C' = 6;
  };
  transition t153 := {
    from   := f718;
    to     := f726;
    guard  := 1 >= C;
    action := C' = 6;
  };
  transition t154 := {
    from   := f712;
    to     := f718;
    guard  := 2 >= C;
    action := C' = 5;
  };
  transition t155 := {
    from   := f706;
    to     := f712;
    guard  := 1 >= C;
    action := C' = 5;
  };
  transition t156 := {
    from   := f700;
    to     := f706;
    guard  := 2 >= C;
    action := C' = 5;
  };
  transition t157 := {
    from   := f692;
    to     := f700;
    guard  := 0 > 8 + C;
    action := C' = 5;
  };
  transition t158 := {
    from   := f686;
    to     := f692;
    guard  := 0 > 7 + C;
    action := C' = 16;
  };
  transition t159 := {
    from   := f680;
    to     := f686;
    guard  := 0 > 8 + C;
    action := C' = 16;
  };
  transition t160 := {
    from   := f674;
    to     := f680;
    guard  := 0 > 7 + C;
    action := C' = 16;
  };
  transition t161 := {
    from   := f666;
    to     := f674;
    guard  := 0 > 7 + C;
    action := C' = 16;
  };
  transition t162 := {
    from   := f660;
    to     := f666;
    guard  := 0 > 6 + C;
    action := C' = -2;
  };
  transition t163 := {
    from   := f654;
    to     := f660;
    guard  := 0 > 7 + C;
    action := C' = -2;
  };
  transition t164 := {
    from   := f648;
    to     := f654;
    guard  := 0 > 6 + C;
    action := C' = -2;
  };
  transition t165 := {
    from   := f640;
    to     := f648;
    guard  := 0 > 5 + C;
    action := C' = -2;
  };
  transition t166 := {
    from   := f634;
    to     := f640;
    guard  := 0 > 4 + C;
    action := C' = -1;
  };
  transition t167 := {
    from   := f628;
    to     := f634;
    guard  := 0 > 5 + C;
    action := C' = -1;
  };
  transition t168 := {
    from   := f622;
    to     := f628;
    guard  := 0 > 4 + C;
    action := C' = -1;
  };
  transition t169 := {
    from   := f614;
    to     := f622;
    guard  := 0 > 3 + C;
    action := C' = -1;
  };
  transition t170 := {
    from   := f608;
    to     := f614;
    guard  := 0 > 2 + C;
    action := C' = 0;
  };
  transition t171 := {
    from   := f602;
    to     := f608;
    guard  := 0 > 3 + C;
    action := C' = 0;
  };
  transition t172 := {
    from   := f596;
    to     := f602;
    guard  := 0 > 2 + C;
    action := C' = 0;
  };
  transition t173 := {
    from   := f588;
    to     := f596;
    guard  := 0 > 2 + C;
    action := C' = 0;
  };
  transition t174 := {
    from   := f582;
    to     := f588;
    guard  := 0 > 1 + C;
    action := C' = 9;
  };
  transition t175 := {
    from   := f576;
    to     := f582;
    guard  := 0 > 2 + C;
    action := C' = 9;
  };
  transition t176 := {
    from   := f570;
    to     := f576;
    guard  := 0 > 1 + C;
    action := C' = 9;
  };
  transition t177 := {
    from   := f562;
    to     := f570;
    guard  := 0 > 1 + C;
    action := C' = 9;
  };
  transition t178 := {
    from   := f556;
    to     := f562;
    guard  := 0 > C;
    action := C' = 8;
  };
  transition t179 := {
    from   := f550;
    to     := f556;
    guard  := 0 > 1 + C;
    action := C' = 8;
  };
  transition t180 := {
    from   := f544;
    to     := f550;
    guard  := 0 > C;
    action := C' = 8;
  };
  transition t181 := {
    from   := f536;
    to     := f544;
    guard  := 0 > C;
    action := C' = 8;
  };
  transition t182 := {
    from   := f530;
    to     := f536;
    guard  := 0 >= C;
    action := C' = 7;
  };
  transition t183 := {
    from   := f524;
    to     := f530;
    guard  := 0 > C;
    action := C' = 7;
  };
  transition t184 := {
    from   := f518;
    to     := f524;
    guard  := 0 >= C;
    action := C' = 7;
  };
  transition t185 := {
    from   := f510;
    to     := f518;
    guard  := 0 >= C;
    action := C' = 7;
  };
  transition t186 := {
    from   := f504;
    to     := f510;
    guard  := 1 >= C;
    action := C' = 6;
  };
  transition t187 := {
    from   := f498;
    to     := f504;
    guard  := 0 >= C;
    action := C' = 6;
  };
  transition t188 := {
    from   := f492;
    to     := f498;
    guard  := 1 >= C;
    action := C' = 6;
  };
  transition t189 := {
    from   := f484;
    to     := f492;
    guard  := 1 >= C;
    action := C' = 6;
  };
  transition t190 := {
    from   := f478;
    to     := f484;
    guard  := 2 >= C;
    action := C' = 5;
  };
  transition t191 := {
    from   := f472;
    to     := f478;
    guard  := 1 >= C;
    action := C' = 5;
  };
  transition t192 := {
    from   := f466;
    to     := f472;
    guard  := 2 >= C;
    action := C' = 5;
  };
  transition t193 := {
    from   := f458;
    to     := f466;
    guard  := C > 4;
    action := C' = 5;
  };
  transition t194 := {
    from   := f452;
    to     := f458;
    guard  := C > 3;
    action := C' = -6;
  };
  transition t195 := {
    from   := f446;
    to     := f452;
    guard  := C > 4;
    action := C' = -6;
  };
  transition t196 := {
    from   := f440;
    to     := f446;
    guard  := C > 3;
    action := C' = -6;
  };
  transition t197 := {
    from   := f432;
    to     := f440;
    guard  := C > 0;
    action := C' = -6;
  };
  transition t198 := {
    from   := f426;
    to     := f432;
    guard  := C >= 0;
    action := C' = -5;
  };
  transition t199 := {
    from   := f420;
    to     := f426;
    guard  := C > 0;
    action := C' = -5;
  };
  transition t200 := {
    from   := f414;
    to     := f420;
    guard  := C >= 0;
    action := C' = -5;
  };
  transition t201 := {
    from   := f406;
    to     := f414;
    guard  := C >= 0;
    action := C' = -5;
  };
  transition t202 := {
    from   := f400;
    to     := f406;
    guard  := C + 1 >= 0;
    action := C' = -4;
  };
  transition t203 := {
    from   := f394;
    to     := f400;
    guard  := C >= 0;
    action := C' = -4;
  };
  transition t204 := {
    from   := f388;
    to     := f394;
    guard  := C + 1 >= 0;
    action := C' = -4;
  };
  transition t205 := {
    from   := f380;
    to     := f388;
    guard  := C + 1 >= 0;
    action := C' = -4;
  };
  transition t206 := {
    from   := f374;
    to     := f380;
    guard  := C + 2 >= 0;
    action := C' = -3;
  };
  transition t207 := {
    from   := f368;
    to     := f374;
    guard  := C + 1 >= 0;
    action := C' = -3;
  };
  transition t208 := {
    from   := f362;
    to     := f368;
    guard  := C + 2 >= 0;
    action := C' = -3;
  };
  transition t209 := {
    from   := f354;
    to     := f362;
    guard  := C > 2;
    action := C' = -3;
  };
  transition t210 := {
    from   := f348;
    to     := f354;
    guard  := C > 1;
    action := C' = 1;
  };
  transition t211 := {
    from   := f342;
    to     := f348;
    guard  := C > 2;
    action := C' = 1;
  };
  transition t212 := {
    from   := f336;
    to     := f342;
    guard  := C > 1;
    action := C' = 1;
  };
  transition t213 := {
    from   := f328;
    to     := f336;
    guard  := C > 3;
    action := C' = 1;
  };
  transition t214 := {
    from   := f322;
    to     := f328;
    guard  := C > 2;
    action := C' = 0;
  };
  transition t215 := {
    from   := f316;
    to     := f322;
    guard  := C > 3;
    action := C' = 0;
  };
  transition t216 := {
    from   := f310;
    to     := f316;
    guard  := C > 2;
    action := C' = 0;
  };
  transition t217 := {
    from   := f302;
    to     := f310;
    guard  := C > 4;
    action := C' = 0;
  };
  transition t218 := {
    from   := f296;
    to     := f302;
    guard  := C > 3;
    action := C' = -6;
  };
  transition t219 := {
    from   := f290;
    to     := f296;
    guard  := C > 4;
    action := C' = -6;
  };
  transition t220 := {
    from   := f284;
    to     := f290;
    guard  := C > 3;
    action := C' = -6;
  };
  transition t221 := {
    from   := f276;
    to     := f284;
    guard  := C > 0;
    action := C' = -6;
  };
  transition t222 := {
    from   := f270;
    to     := f276;
    guard  := C >= 0;
    action := C' = -5;
  };
  transition t223 := {
    from   := f264;
    to     := f270;
    guard  := C > 0;
    action := C' = -5;
  };
  transition t224 := {
    from   := f258;
    to     := f264;
    guard  := C >= 0;
    action := C' = -5;
  };
  transition t225 := {
    from   := f250;
    to     := f258;
    guard  := C >= 0;
    action := C' = -5;
  };
  transition t226 := {
    from   := f244;
    to     := f250;
    guard  := C + 1 >= 0;
    action := C' = -4;
  };
  transition t227 := {
    from   := f238;
    to     := f244;
    guard  := C >= 0;
    action := C' = -4;
  };
  transition t228 := {
    from   := f232;
    to     := f238;
    guard  := C + 1 >= 0;
    action := C' = -4;
  };
  transition t229 := {
    from   := f224;
    to     := f232;
    guard  := C + 1 >= 0;
    action := C' = -4;
  };
  transition t230 := {
    from   := f218;
    to     := f224;
    guard  := C + 2 >= 0;
    action := C' = -3;
  };
  transition t231 := {
    from   := f212;
    to     := f218;
    guard  := C + 1 >= 0;
    action := C' = -3;
  };
  transition t232 := {
    from   := f206;
    to     := f212;
    guard  := C + 2 >= 0;
    action := C' = -3;
  };
  transition t233 := {
    from   := f198;
    to     := f206;
    guard  := C > 2;
    action := C' = -3;
  };
  transition t234 := {
    from   := f192;
    to     := f198;
    guard  := C > 1;
    action := C' = 1;
  };
  transition t235 := {
    from   := f186;
    to     := f192;
    guard  := C > 2;
    action := C' = 1;
  };
  transition t236 := {
    from   := f180;
    to     := f186;
    guard  := C > 1;
    action := C' = 1;
  };
  transition t237 := {
    from   := f172;
    to     := f180;
    guard  := C > 3;
    action := C' = 1;
  };
  transition t238 := {
    from   := f166;
    to     := f172;
    guard  := C > 2;
    action := C' = 0;
  };
  transition t239 := {
    from   := f160;
    to     := f166;
    guard  := C > 3;
    action := C' = 0;
  };
  transition t240 := {
    from   := f154;
    to     := f160;
    guard  := C > 2;
    action := C' = 0;
  };
}
strategy dumb {
  Region init := { state = f0 };
}
