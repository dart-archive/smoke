// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Tests for [minArgs] and [maxArgs].
library smoke.test.args_test;

import 'package:smoke/smoke.dart'
    show minArgs, maxArgs, canAcceptNArgs, SUPPORTED_ARGS;
import 'package:unittest/unittest.dart';

main() {
  var a = new A();
  var instanceMethods = [
    a.m1,
    a.m2,
    a.m3,
    a.m4,
    a.m5,
    a.m6,
    a.m7,
    a.m8,
    a.m9,
    a.m10,
    a.m11,
    a.m12,
    a.m13,
    a.m14,
    a.m15,
    a.m16,
    a.m17,
    a.m18,
    a.m19,
    a.m20,
    a.m21,
    a.m22,
    a.m23,
    a.m24,
    a.m25,
    a.m26,
    a.m27,
    a.m28,
    a.m29,
    a.m30,
    a.m31,
    a.m32,
    a.m33,
    a.m34,
    a.m35,
    a.m36,
    a.m37,
    a.m38,
    a.m39,
    a.m40,
    a.m41,
    a.m42,
    a.m43,
    a.m44,
    a.m45,
    a.m46,
    a.m47,
    a.m48,
    a.m49,
    a.m50,
    a.m51,
    a.m52,
    a.m53,
    a.m54,
    a.m55,
    a.m56,
    a.m57
  ];
  group('instance methods', () => checkMethods(instanceMethods));
  group('static methods', () => checkMethods(staticMethods));
  group('closures', () => checkMethods(closures));
  group('top level methods', () => checkMethods(topLevelMethods));
}

checkMethods(List methods) {
  test('min args', () {
    expect(methods.map((m) => minArgs(m)), expectedMin);
  });

  test('max args', () {
    expect(methods.map((m) => maxArgs(m)), expectedMax);
  });

  test('can accept n arguments', () {
    for (var m in methods) {
      for (int n = 0; n < SUPPORTED_ARGS; n++) {
        expect(canAcceptNArgs(m, n), n >= minArgs(m) && n <= maxArgs(m));
      }
    }
  });
}

class A {
  // required args only
  static s1() {}
  static s2(p1) {}
  static s3(p1, p2) {}
  static s4(p1, p2, p3) {}
  static s5(p1, p2, p3, p4) {}
  static s6(p1, p2, p3, p4, p5) {}

  // optional args only
  static s7([o1]) {}
  static s8([o1, o2]) {}
  static s9([o1, o2, o3]) {}
  static s10([o1, o2, o3, o4]) {}
  static s11([o1, o2, o3, o4, o5]) {}

  // 1 required, some optional
  static s12(p1, [o2]) {}
  static s13(p1, [o2, o3]) {}
  static s14(p1, [o2, o3, o4]) {}
  static s15(p1, [o2, o3, o4, o5]) {}

  // 2 required, some optional
  static s16(p1, p2, [o3]) {}
  static s17(p1, p2, [o3, o4]) {}
  static s18(p1, p2, [o3, o4, o5]) {}

  // 3 required, some optional
  static s19(p1, p2, p3, [o4]) {}
  static s20(p1, p2, p3, [o4, o5]) {}

  // 4 required, some optional
  static s21(p1, p2, p3, p4, [o5]) {}

  // >5 arguments, required args only.
  static s22(p1, p2, p3, p4, p5, p6) {}
  static s23(p1, p2, p3, p4, p5, p6, p7) {}
  static s24(p1, p2, p3, p4, p5, p6, p7, p8) {}
  static s25(p1, p2, p3, p4, p5, p6, p7, p8, p9) {}
  static s26(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) {}
  static s27(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11) {}
  static s28(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12) {}
  static s29(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13) {}
  static s30(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14) {}
  static s31(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15) {
  }
  static s32(
      p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16) {}
  static s33(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15,
      p16, p17) {}

  // >5 arguments, all but one required.
  static s34(p1, p2, p3, p4, p5, [o6]) {}
  static s35(p1, p2, p3, p4, p5, p6, [o7]) {}
  static s36(p1, p2, p3, p4, p5, p6, p7, [o8]) {}
  static s37(p1, p2, p3, p4, p5, p6, p7, p8, [o9]) {}
  static s38(p1, p2, p3, p4, p5, p6, p7, p8, p9, [o10]) {}
  static s39(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, [o11]) {}
  static s40(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, [o12]) {}
  static s41(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, [o13]) {}
  static s42(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, [o14]) {}
  static s43(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14,
      [o15]) {}
  static s44(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15,
      [o16]) {}
  static s45(
      p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16,
      [o17]) {}

  // >5 arguments, 5 required.
  static s46(p1, p2, p3, p4, p5, [o6]) {}
  static s47(p1, p2, p3, p4, p5, [o6, o7]) {}
  static s48(p1, p2, p3, p4, p5, [o6, o7, o8]) {}
  static s49(p1, p2, p3, p4, p5, [o6, o7, o8, o9]) {}
  static s50(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10]) {}
  static s51(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11]) {}
  static s52(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12]) {}
  static s53(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13]) {}
  static s54(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13, o14]) {}
  static s55(p1, p2, p3, p4, p5,
      [o6, o7, o8, o9, o10, o11, o12, o13, o14, o15]) {}
  static s56(p1, p2, p3, p4, p5,
      [o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16]) {}
  static s57(p1, p2, p3, p4, p5,
      [o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17]) {}

  m1() {}
  m2(p1) {}
  m3(p1, p2) {}
  m4(p1, p2, p3) {}
  m5(p1, p2, p3, p4) {}
  m6(p1, p2, p3, p4, p5) {}
  m7([o1]) {}
  m8([o1, o2]) {}
  m9([o1, o2, o3]) {}
  m10([o1, o2, o3, o4]) {}
  m11([o1, o2, o3, o4, o5]) {}
  m12(p1, [o2]) {}
  m13(p1, [o2, o3]) {}
  m14(p1, [o2, o3, o4]) {}
  m15(p1, [o2, o3, o4, o5]) {}
  m16(p1, p2, [o3]) {}
  m17(p1, p2, [o3, o4]) {}
  m18(p1, p2, [o3, o4, o5]) {}
  m19(p1, p2, p3, [o4]) {}
  m20(p1, p2, p3, [o4, o5]) {}
  m21(p1, p2, p3, p4, [o5]) {}

  // >5 arguments, required args only.
  m22(p1, p2, p3, p4, p5, p6) {}
  m23(p1, p2, p3, p4, p5, p6, p7) {}
  m24(p1, p2, p3, p4, p5, p6, p7, p8) {}
  m25(p1, p2, p3, p4, p5, p6, p7, p8, p9) {}
  m26(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) {}
  m27(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11) {}
  m28(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12) {}
  m29(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13) {}
  m30(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14) {}
  m31(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15) {}
  m32(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16) {}
  m33(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16,
      p17) {}

  // >5 arguments, all but one required.
  m34(p1, p2, p3, p4, p5, [o6]) {}
  m35(p1, p2, p3, p4, p5, p6, [o7]) {}
  m36(p1, p2, p3, p4, p5, p6, p7, [o8]) {}
  m37(p1, p2, p3, p4, p5, p6, p7, p8, [o9]) {}
  m38(p1, p2, p3, p4, p5, p6, p7, p8, p9, [o10]) {}
  m39(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, [o11]) {}
  m40(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, [o12]) {}
  m41(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, [o13]) {}
  m42(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, [o14]) {}
  m43(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, [o15]) {}
  m44(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, [o16]) {
  }
  m45(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16,
      [o17]) {}

  // >5 arguments, 5 required.
  m46(p1, p2, p3, p4, p5, [o6]) {}
  m47(p1, p2, p3, p4, p5, [o6, o7]) {}
  m48(p1, p2, p3, p4, p5, [o6, o7, o8]) {}
  m49(p1, p2, p3, p4, p5, [o6, o7, o8, o9]) {}
  m50(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10]) {}
  m51(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11]) {}
  m52(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12]) {}
  m53(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13]) {}
  m54(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13, o14]) {}
  m55(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13, o14, o15]) {}
  m56(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16]) {
  }
  m57(p1, p2, p3, p4, p5,
      [o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17]) {}
}

t1() {}
t2(p1) {}
t3(p1, p2) {}
t4(p1, p2, p3) {}
t5(p1, p2, p3, p4) {}
t6(p1, p2, p3, p4, p5) {}
t7([o1]) {}
t8([o1, o2]) {}
t9([o1, o2, o3]) {}
t10([o1, o2, o3, o4]) {}
t11([o1, o2, o3, o4, o5]) {}
t12(p1, [o2]) {}
t13(p1, [o2, o3]) {}
t14(p1, [o2, o3, o4]) {}
t15(p1, [o2, o3, o4, o5]) {}
t16(p1, p2, [o3]) {}
t17(p1, p2, [o3, o4]) {}
t18(p1, p2, [o3, o4, o5]) {}
t19(p1, p2, p3, [o4]) {}
t20(p1, p2, p3, [o4, o5]) {}
t21(p1, p2, p3, p4, [o5]) {}

// >5 arguments, required args only.
t22(p1, p2, p3, p4, p5, p6) {}
t23(p1, p2, p3, p4, p5, p6, p7) {}
t24(p1, p2, p3, p4, p5, p6, p7, p8) {}
t25(p1, p2, p3, p4, p5, p6, p7, p8, p9) {}
t26(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) {}
t27(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11) {}
t28(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12) {}
t29(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13) {}
t30(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14) {}
t31(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15) {}
t32(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16) {}
t33(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16,
    p17) {}

// >5 arguments, all but one required.
t34(p1, p2, p3, p4, p5, [o6]) {}
t35(p1, p2, p3, p4, p5, p6, [o7]) {}
t36(p1, p2, p3, p4, p5, p6, p7, [o8]) {}
t37(p1, p2, p3, p4, p5, p6, p7, p8, [o9]) {}
t38(p1, p2, p3, p4, p5, p6, p7, p8, p9, [o10]) {}
t39(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, [o11]) {}
t40(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, [o12]) {}
t41(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, [o13]) {}
t42(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, [o14]) {}
t43(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, [o15]) {}
t44(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, [o16]) {}
t45(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16,
    [o17]) {}

// >5 arguments, 5 required.
t46(p1, p2, p3, p4, p5, [o6]) {}
t47(p1, p2, p3, p4, p5, [o6, o7]) {}
t48(p1, p2, p3, p4, p5, [o6, o7, o8]) {}
t49(p1, p2, p3, p4, p5, [o6, o7, o8, o9]) {}
t50(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10]) {}
t51(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11]) {}
t52(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12]) {}
t53(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13]) {}
t54(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13, o14]) {}
t55(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13, o14, o15]) {}
t56(p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16]) {}
t57(p1, p2, p3, p4, p5,
    [o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17]) {}

List closures = [
  () {},
  (p1) {},
  (p1, p2) {},
  (p1, p2, p3) {},
  (p1, p2, p3, p4) {},
  (p1, p2, p3, p4, p5) {},
  ([o1]) {},
  ([o1, o2]) {},
  ([o1, o2, o3]) {},
  ([o1, o2, o3, o4]) {},
  ([o1, o2, o3, o4, o5]) {},
  (p1, [o2]) {},
  (p1, [o2, o3]) {},
  (p1, [o2, o3, o4]) {},
  (p1, [o2, o3, o4, o5]) {},
  (p1, p2, [o3]) {},
  (p1, p2, [o3, o4]) {},
  (p1, p2, [o3, o4, o5]) {},
  (p1, p2, p3, [o4]) {},
  (p1, p2, p3, [o4, o5]) {},
  (p1, p2, p3, p4, [o5]) {},

  // >5 arguments, required args only.
  (p1, p2, p3, p4, p5, p6) {},
  (p1, p2, p3, p4, p5, p6, p7) {},
  (p1, p2, p3, p4, p5, p6, p7, p8) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17) {
  },

  // >5 arguments, all but one required.
  (p1, p2, p3, p4, p5, [o6]) {},
  (p1, p2, p3, p4, p5, p6, [o7]) {},
  (p1, p2, p3, p4, p5, p6, p7, [o8]) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, [o9]) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, [o10]) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, [o11]) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, [o12]) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, [o13]) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, [o14]) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, [o15]) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, [o16]) {},
  (p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16,
      [o17]) {},

  // >5 arguments, 5 required.
  (p1, p2, p3, p4, p5, [o6]) {},
  (p1, p2, p3, p4, p5, [o6, o7]) {},
  (p1, p2, p3, p4, p5, [o6, o7, o8]) {},
  (p1, p2, p3, p4, p5, [o6, o7, o8, o9]) {},
  (p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10]) {},
  (p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11]) {},
  (p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12]) {},
  (p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13]) {},
  (p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13, o14]) {},
  (p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13, o14, o15]) {},
  (p1, p2, p3, p4, p5, [o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16]) {},
  (p1, p2, p3, p4, p5,
      [o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17]) {}
];

List staticMethods = [
  A.s1,
  A.s2,
  A.s3,
  A.s4,
  A.s5,
  A.s6,
  A.s7,
  A.s8,
  A.s9,
  A.s10,
  A.s11,
  A.s12,
  A.s13,
  A.s14,
  A.s15,
  A.s16,
  A.s17,
  A.s18,
  A.s19,
  A.s20,
  A.s21,
  A.s22,
  A.s23,
  A.s24,
  A.s25,
  A.s26,
  A.s27,
  A.s28,
  A.s29,
  A.s30,
  A.s31,
  A.s32,
  A.s33,
  A.s34,
  A.s35,
  A.s36,
  A.s37,
  A.s38,
  A.s39,
  A.s40,
  A.s41,
  A.s42,
  A.s43,
  A.s44,
  A.s45,
  A.s46,
  A.s47,
  A.s48,
  A.s49,
  A.s50,
  A.s51,
  A.s52,
  A.s53,
  A.s54,
  A.s55,
  A.s56,
  A.s57
];

List topLevelMethods = [
  t1,
  t2,
  t3,
  t4,
  t5,
  t6,
  t7,
  t8,
  t9,
  t10,
  t11,
  t12,
  t13,
  t14,
  t15,
  t16,
  t17,
  t18,
  t19,
  t20,
  t21,
  t22,
  t23,
  t24,
  t25,
  t26,
  t27,
  t28,
  t29,
  t30,
  t31,
  t32,
  t33,
  t34,
  t35,
  t36,
  t37,
  t38,
  t39,
  t40,
  t41,
  t42,
  t43,
  t44,
  t45,
  t46,
  t47,
  t48,
  t49,
  t50,
  t51,
  t52,
  t53,
  t54,
  t55,
  t56,
  t57
];

const MIN_NOT_KNOWN = SUPPORTED_ARGS + 1;
List expectedMin = const [
  0,
  1,
  2,
  3,
  4,
  5, // required only
  0,
  0,
  0,
  0,
  0, // optional only
  1,
  1,
  1,
  1, // 1 required
  2,
  2,
  2, // 2 required
  3,
  3, // 3 required
  4, // 4 required
  // >5 arguments, required args only.
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  MIN_NOT_KNOWN,
  MIN_NOT_KNOWN,
  // >5 arguments, 1 optional argument.
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  MIN_NOT_KNOWN,
  // >5 arguments, 5 required
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5,
  5
];

const MAX_NOT_KNOWN = -1;
List expectedMax = const [
  0,
  1,
  2,
  3,
  4,
  5, // required only
  1,
  2,
  3,
  4,
  5, // optional only
  2,
  3,
  4,
  5, // 1 required
  3,
  4,
  5, // 2 required
  4,
  5, // 3 required
  5, // 4 required
  // >5 arguments, required args only.
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  MAX_NOT_KNOWN,
  MAX_NOT_KNOWN,
  // >5 arguments, 1 optional argument.
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  15,
  MAX_NOT_KNOWN,
  // >5 arguments, 5 required
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  15,
  15
];
