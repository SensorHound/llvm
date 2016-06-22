; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instsimplify -S | FileCheck %s

define i32 @foo(i32 %x) {
; CHECK-LABEL: @foo(
; CHECK-NEXT:    [[O:%.*]] = and i32 %x, 1
; CHECK-NEXT:    [[N:%.*]] = add i32 [[O]], -1
; CHECK-NEXT:    ret i32 [[N]]
;
  %o = and i32 %x, 1
  %n = add i32 %o, -1
  %t = ashr i32 %n, 17
  ret i32 %t
}

define i1 @exact_lshr_eq_both_zero(i8 %a) {
; CHECK-LABEL: @exact_lshr_eq_both_zero(
; CHECK-NEXT:    ret i1 true
;
  %shr = lshr exact i8 0, %a
  %cmp = icmp eq i8 %shr, 0
  ret i1 %cmp
}

define i1 @exact_ashr_eq_both_zero(i8 %a) {
; CHECK-LABEL: @exact_ashr_eq_both_zero(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr exact i8 0, %a
  %cmp = icmp eq i8 %shr, 0
  ret i1 %cmp
}

define i1 @nonexact_ashr_eq_both_zero(i8 %a) {
; CHECK-LABEL: @nonexact_ashr_eq_both_zero(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr i8 0, %a
  %cmp = icmp eq i8 %shr, 0
  ret i1 %cmp
}

define i1 @exact_lshr_ne_both_zero(i8 %a) {
; CHECK-LABEL: @exact_lshr_ne_both_zero(
; CHECK-NEXT:    ret i1 false
;
  %shr = lshr exact i8 0, %a
  %cmp = icmp ne i8 %shr, 0
  ret i1 %cmp
}

define i1 @exact_ashr_ne_both_zero(i8 %a) {
; CHECK-LABEL: @exact_ashr_ne_both_zero(
; CHECK-NEXT:    ret i1 false
;
  %shr = ashr exact i8 0, %a
  %cmp = icmp ne i8 %shr, 0
  ret i1 %cmp
}

define i1 @nonexact_lshr_ne_both_zero(i8 %a) {
; CHECK-LABEL: @nonexact_lshr_ne_both_zero(
; CHECK-NEXT:    ret i1 false
;
  %shr = lshr i8 0, %a
  %cmp = icmp ne i8 %shr, 0
  ret i1 %cmp
}

define i1 @nonexact_ashr_ne_both_zero(i8 %a) {
; CHECK-LABEL: @nonexact_ashr_ne_both_zero(
; CHECK-NEXT:    ret i1 false
;
  %shr = ashr i8 0, %a
  %cmp = icmp ne i8 %shr, 0
  ret i1 %cmp
}

define i1 @exact_lshr_eq_last_zero(i8 %a) {
; CHECK-LABEL: @exact_lshr_eq_last_zero(
; CHECK-NEXT:    ret i1 false
;
  %shr = lshr exact i8 128, %a
  %cmp = icmp eq i8 %shr, 0
  ret i1 %cmp
}

define i1 @exact_ashr_eq_last_zero(i8 %a) {
; CHECK-LABEL: @exact_ashr_eq_last_zero(
; CHECK-NEXT:    ret i1 false
;
  %shr = ashr exact i8 -128, %a
  %cmp = icmp eq i8 %shr, 0
  ret i1 %cmp
}

define i1 @nonexact_lshr_eq_both_zero(i8 %a) {
; CHECK-LABEL: @nonexact_lshr_eq_both_zero(
; CHECK-NEXT:    ret i1 true
;
  %shr = lshr i8 0, %a
  %cmp = icmp eq i8 %shr, 0
  ret i1 %cmp
}

define i1 @exact_lshr_ne_last_zero(i8 %a) {
; CHECK-LABEL: @exact_lshr_ne_last_zero(
; CHECK-NEXT:    ret i1 true
;
  %shr = lshr exact i8 128, %a
  %cmp = icmp ne i8 %shr, 0
  ret i1 %cmp
}

define i1 @exact_ashr_ne_last_zero(i8 %a) {
; CHECK-LABEL: @exact_ashr_ne_last_zero(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr exact i8 -128, %a
  %cmp = icmp ne i8 %shr, 0
  ret i1 %cmp
}

define i1 @nonexact_lshr_eq_last_zero(i8 %a) {
; CHECK-LABEL: @nonexact_lshr_eq_last_zero(
; CHECK-NEXT:    ret i1 false
;
  %shr = lshr i8 128, %a
  %cmp = icmp eq i8 %shr, 0
  ret i1 %cmp
}

define i1 @nonexact_ashr_eq_last_zero(i8 %a) {
; CHECK-LABEL: @nonexact_ashr_eq_last_zero(
; CHECK-NEXT:    ret i1 false
;
  %shr = ashr i8 -128, %a
  %cmp = icmp eq i8 %shr, 0
  ret i1 %cmp
}

define i1 @nonexact_lshr_ne_last_zero(i8 %a) {
; CHECK-LABEL: @nonexact_lshr_ne_last_zero(
; CHECK-NEXT:    ret i1 true
;
  %shr = lshr i8 128, %a
  %cmp = icmp ne i8 %shr, 0
  ret i1 %cmp
}

define i1 @nonexact_ashr_ne_last_zero(i8 %a) {
; CHECK-LABEL: @nonexact_ashr_ne_last_zero(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr i8 -128, %a
  %cmp = icmp ne i8 %shr, 0
  ret i1 %cmp
}

define i1 @lshr_eq_first_zero(i8 %a) {
; CHECK-LABEL: @lshr_eq_first_zero(
; CHECK-NEXT:    ret i1 false
;
  %shr = lshr i8 0, %a
  %cmp = icmp eq i8 %shr, 2
  ret i1 %cmp
}

define i1 @ashr_eq_first_zero(i8 %a) {
; CHECK-LABEL: @ashr_eq_first_zero(
; CHECK-NEXT:    ret i1 false
;
  %shr = ashr i8 0, %a
  %cmp = icmp eq i8 %shr, 2
  ret i1 %cmp
}

define i1 @lshr_ne_first_zero(i8 %a) {
; CHECK-LABEL: @lshr_ne_first_zero(
; CHECK-NEXT:    ret i1 true
;
  %shr = lshr i8 0, %a
  %cmp = icmp ne i8 %shr, 2
  ret i1 %cmp
}

define i1 @ashr_ne_first_zero(i8 %a) {
; CHECK-LABEL: @ashr_ne_first_zero(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr i8 0, %a
  %cmp = icmp ne i8 %shr, 2
  ret i1 %cmp
}

define i1 @ashr_eq_both_minus1(i8 %a) {
; CHECK-LABEL: @ashr_eq_both_minus1(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr i8 -1, %a
  %cmp = icmp eq i8 %shr, -1
  ret i1 %cmp
}

define i1 @ashr_ne_both_minus1(i8 %a) {
; CHECK-LABEL: @ashr_ne_both_minus1(
; CHECK-NEXT:    ret i1 false
;
  %shr = ashr i8 -1, %a
  %cmp = icmp ne i8 %shr, -1
  ret i1 %cmp
}

define i1 @exact_ashr_eq_both_minus1(i8 %a) {
; CHECK-LABEL: @exact_ashr_eq_both_minus1(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr exact i8 -1, %a
  %cmp = icmp eq i8 %shr, -1
  ret i1 %cmp
}

define i1 @exact_ashr_ne_both_minus1(i8 %a) {
; CHECK-LABEL: @exact_ashr_ne_both_minus1(
; CHECK-NEXT:    ret i1 false
;
  %shr = ashr exact i8 -1, %a
  %cmp = icmp ne i8 %shr, -1
  ret i1 %cmp
}

define i1 @exact_ashr_eq_opposite_msb(i8 %a) {
; CHECK-LABEL: @exact_ashr_eq_opposite_msb(
; CHECK-NEXT:    ret i1 false
;
  %shr = ashr exact i8 -128, %a
  %cmp = icmp eq i8 %shr, 1
  ret i1 %cmp
}

define i1 @exact_ashr_eq_noexactlog(i8 %a) {
; CHECK-LABEL: @exact_ashr_eq_noexactlog(
; CHECK-NEXT:    ret i1 false
;
  %shr = ashr exact i8 -90, %a
  %cmp = icmp eq i8 %shr, -30
  ret i1 %cmp
}

define i1 @exact_ashr_ne_opposite_msb(i8 %a) {
; CHECK-LABEL: @exact_ashr_ne_opposite_msb(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr exact i8 -128, %a
  %cmp = icmp ne i8 %shr, 1
  ret i1 %cmp
}

define i1 @ashr_eq_opposite_msb(i8 %a) {
; CHECK-LABEL: @ashr_eq_opposite_msb(
; CHECK-NEXT:    ret i1 false
;
  %shr = ashr i8 -128, %a
  %cmp = icmp eq i8 %shr, 1
  ret i1 %cmp
}

define i1 @ashr_ne_opposite_msb(i8 %a) {
; CHECK-LABEL: @ashr_ne_opposite_msb(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr i8 -128, %a
  %cmp = icmp ne i8 %shr, 1
  ret i1 %cmp
}

define i1 @exact_ashr_eq_shift_gt(i8 %a) {
; CHECK-LABEL: @exact_ashr_eq_shift_gt(
; CHECK-NEXT:    ret i1 false
;
  %shr = ashr exact i8 -2, %a
  %cmp = icmp eq i8 %shr, -8
  ret i1 %cmp
}

define i1 @exact_ashr_ne_shift_gt(i8 %a) {
; CHECK-LABEL: @exact_ashr_ne_shift_gt(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr exact i8 -2, %a
  %cmp = icmp ne i8 %shr, -8
  ret i1 %cmp
}

define i1 @nonexact_ashr_eq_shift_gt(i8 %a) {
; CHECK-LABEL: @nonexact_ashr_eq_shift_gt(
; CHECK-NEXT:    ret i1 false
;
  %shr = ashr i8 -2, %a
  %cmp = icmp eq i8 %shr, -8
  ret i1 %cmp
}

define i1 @nonexact_ashr_ne_shift_gt(i8 %a) {
; CHECK-LABEL: @nonexact_ashr_ne_shift_gt(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr i8 -2, %a
  %cmp = icmp ne i8 %shr, -8
  ret i1 %cmp
}

define i1 @exact_lshr_eq_shift_gt(i8 %a) {
; CHECK-LABEL: @exact_lshr_eq_shift_gt(
; CHECK-NEXT:    ret i1 false
;
  %shr = lshr exact i8 2, %a
  %cmp = icmp eq i8 %shr, 8
  ret i1 %cmp
}

define i1 @exact_lshr_ne_shift_gt(i8 %a) {
; CHECK-LABEL: @exact_lshr_ne_shift_gt(
; CHECK-NEXT:    ret i1 true
;
  %shr = lshr exact i8 2, %a
  %cmp = icmp ne i8 %shr, 8
  ret i1 %cmp
}

define i1 @nonexact_lshr_eq_shift_gt(i8 %a) {
; CHECK-LABEL: @nonexact_lshr_eq_shift_gt(
; CHECK-NEXT:    ret i1 false
;
  %shr = lshr i8 2, %a
  %cmp = icmp eq i8 %shr, 8
  ret i1 %cmp
}

define i1 @nonexact_lshr_ne_shift_gt(i8 %a) {
; CHECK-LABEL: @nonexact_lshr_ne_shift_gt(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr i8 2, %a
  %cmp = icmp ne i8 %shr, 8
  ret i1 %cmp
}

define i1 @exact_ashr_ne_noexactlog(i8 %a) {
; CHECK-LABEL: @exact_ashr_ne_noexactlog(
; CHECK-NEXT:    ret i1 true
;
  %shr = ashr exact i8 -90, %a
  %cmp = icmp ne i8 %shr, -30
  ret i1 %cmp
}

define i1 @exact_lshr_eq_noexactlog(i8 %a) {
; CHECK-LABEL: @exact_lshr_eq_noexactlog(
; CHECK-NEXT:    ret i1 false
;
  %shr = lshr exact i8 90, %a
  %cmp = icmp eq i8 %shr, 30
  ret i1 %cmp
}

define i1 @exact_lshr_ne_noexactlog(i8 %a) {
; CHECK-LABEL: @exact_lshr_ne_noexactlog(
; CHECK-NEXT:    ret i1 true
;
  %shr = lshr exact i8 90, %a
  %cmp = icmp ne i8 %shr, 30
  ret i1 %cmp
}

define i32 @exact_lshr_lowbit(i32 %shiftval) {
; CHECK-LABEL: @exact_lshr_lowbit(
; CHECK-NEXT:    ret i32 7
;
  %shr = lshr exact i32 7, %shiftval
  ret i32 %shr
}

define i32 @exact_ashr_lowbit(i32 %shiftval) {
; CHECK-LABEL: @exact_ashr_lowbit(
; CHECK-NEXT:    ret i32 7
;
  %shr = ashr exact i32 7, %shiftval
  ret i32 %shr
}

define i32 @ashr_zero(i32 %shiftval) {
; CHECK-LABEL: @ashr_zero(
; CHECK-NEXT:    ret i32 0
;
  %shr = ashr i32 0, %shiftval
  ret i32 %shr
}

define i257 @ashr_minus1(i257 %shiftval) {
; CHECK-LABEL: @ashr_minus1(
; CHECK-NEXT:    ret i257 -1
;
  %shr = ashr i257 -1, %shiftval
  ret i257 %shr
}

define <2 x i4097> @ashr_zero_vec(<2 x i4097> %shiftval) {
; CHECK-LABEL: @ashr_zero_vec(
; CHECK-NEXT:    ret <2 x i4097> zeroinitializer
;
  %shr = ashr <2 x i4097> zeroinitializer, %shiftval
  ret <2 x i4097> %shr
}

define <2 x i64> @ashr_minus1_vec(<2 x i64> %shiftval) {
; CHECK-LABEL: @ashr_minus1_vec(
; CHECK-NEXT:    ret <2 x i64> <i64 -1, i64 -1>
;
  %shr = ashr <2 x i64> <i64 -1, i64 -1>, %shiftval
  ret <2 x i64> %shr
}

define <2 x i4> @ashr_zero_minus1_vec(<2 x i4> %shiftval) {
; CHECK-LABEL: @ashr_zero_minus1_vec(
; CHECK-NEXT:    ret <2 x i4> <i4 0, i4 -1>
;
  %shr = ashr <2 x i4> <i4 0, i4 -1>, %shiftval
  ret <2 x i4> %shr
}

