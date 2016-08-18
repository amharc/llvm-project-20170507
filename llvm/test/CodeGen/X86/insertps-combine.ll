; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -mattr=+sse4.1 | FileCheck %s --check-prefix=ALL --check-prefix=SSE --check-prefix=SSE41
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -mattr=+avx | FileCheck %s --check-prefix=ALL --check-prefix=AVX --check-prefix=AVX1
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -mattr=+avx2 | FileCheck %s --check-prefix=ALL --check-prefix=AVX --check-prefix=AVX2

define <4 x float> @shuffle_v4f32_0z27(<4 x float> %x, <4 x float> %a) {
; SSE-LABEL: shuffle_v4f32_0z27:
; SSE:       # BB#0:
; SSE-NEXT:    insertps {{.*#+}} xmm0 = xmm0[0],zero,xmm0[2],xmm1[2]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_0z27:
; AVX:       # BB#0:
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = xmm0[0],zero,xmm0[2],xmm1[2]
; AVX-NEXT:    retq
  %vecext = extractelement <4 x float> %x, i32 0
  %vecinit = insertelement <4 x float> undef, float %vecext, i32 0
  %vecinit1 = insertelement <4 x float> %vecinit, float 0.0, i32 1
  %vecinit3 = shufflevector <4 x float> %vecinit1, <4 x float> %x, <4 x i32> <i32 0, i32 1, i32 6, i32 undef>
  %vecinit5 = shufflevector <4 x float> %vecinit3, <4 x float> %a, <4 x i32> <i32 0, i32 1, i32 2, i32 6>
  ret <4 x float> %vecinit5
}

define <4 x float> @shuffle_v4f32_0zz4(<4 x float> %xyzw, <4 x float> %abcd) {
; SSE-LABEL: shuffle_v4f32_0zz4:
; SSE:       # BB#0:
; SSE-NEXT:    insertps {{.*#+}} xmm0 = xmm0[0],zero,zero,xmm1[0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_0zz4:
; AVX:       # BB#0:
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = xmm0[0],zero,zero,xmm1[0]
; AVX-NEXT:    retq
  %vecext = extractelement <4 x float> %xyzw, i32 0
  %vecinit = insertelement <4 x float> undef, float %vecext, i32 0
  %vecinit1 = insertelement <4 x float> %vecinit, float 0.000000e+00, i32 1
  %vecinit2 = insertelement <4 x float> %vecinit1, float 0.000000e+00, i32 2
  %vecinit4 = shufflevector <4 x float> %vecinit2, <4 x float> %abcd, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  ret <4 x float> %vecinit4
}

define <4 x float> @shuffle_v4f32_0z24(<4 x float> %xyzw, <4 x float> %abcd) {
; SSE-LABEL: shuffle_v4f32_0z24:
; SSE:       # BB#0:
; SSE-NEXT:    insertps {{.*#+}} xmm0 = xmm0[0],zero,xmm0[2],xmm1[0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_0z24:
; AVX:       # BB#0:
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = xmm0[0],zero,xmm0[2],xmm1[0]
; AVX-NEXT:    retq
  %vecext = extractelement <4 x float> %xyzw, i32 0
  %vecinit = insertelement <4 x float> undef, float %vecext, i32 0
  %vecinit1 = insertelement <4 x float> %vecinit, float 0.000000e+00, i32 1
  %vecinit3 = shufflevector <4 x float> %vecinit1, <4 x float> %xyzw, <4 x i32> <i32 0, i32 1, i32 6, i32 undef>
  %vecinit5 = shufflevector <4 x float> %vecinit3, <4 x float> %abcd, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  ret <4 x float> %vecinit5
}

define <4 x float> @shuffle_v4f32_0zz0(float %a) {
; SSE-LABEL: shuffle_v4f32_0zz0:
; SSE:       # BB#0:
; SSE-NEXT:    insertps {{.*#+}} xmm0 = xmm0[0],zero,zero,xmm0[0]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_0zz0:
; AVX:       # BB#0:
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = xmm0[0],zero,zero,xmm0[0]
; AVX-NEXT:    retq
  %vecinit = insertelement <4 x float> undef, float %a, i32 0
  %vecinit1 = insertelement <4 x float> %vecinit, float 0.000000e+00, i32 1
  %vecinit2 = insertelement <4 x float> %vecinit1, float 0.000000e+00, i32 2
  %vecinit3 = insertelement <4 x float> %vecinit2, float %a, i32 3
  ret <4 x float> %vecinit3
}

define <4 x float> @shuffle_v4f32_0z6z(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: shuffle_v4f32_0z6z:
; SSE:       # BB#0:
; SSE-NEXT:    insertps {{.*#+}} xmm0 = xmm0[0],zero,xmm1[2],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_0z6z:
; AVX:       # BB#0:
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = xmm0[0],zero,xmm1[2],zero
; AVX-NEXT:    retq
  %vecext = extractelement <4 x float> %A, i32 0
  %vecinit = insertelement <4 x float> undef, float %vecext, i32 0
  %vecinit1 = insertelement <4 x float> %vecinit, float 0.000000e+00, i32 1
  %vecext2 = extractelement <4 x float> %B, i32 2
  %vecinit3 = insertelement <4 x float> %vecinit1, float %vecext2, i32 2
  %vecinit4 = insertelement <4 x float> %vecinit3, float 0.000000e+00, i32 3
  ret <4 x float> %vecinit4
}

define <4 x float> @shuffle_v4f32_z06z(<4 x float> %a, <4 x float> %b) {
; SSE-LABEL: shuffle_v4f32_z06z:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,0],xmm1[2,3]
; SSE-NEXT:    xorps %xmm1, %xmm1
; SSE-NEXT:    blendps {{.*#+}} xmm0 = xmm1[0],xmm0[1,2],xmm1[3]
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_z06z:
; AVX:       # BB#0:
; AVX-NEXT:    vshufps {{.*#+}} xmm0 = xmm0[0,0],xmm1[2,3]
; AVX-NEXT:    vxorps %xmm1, %xmm1, %xmm1
; AVX-NEXT:    vblendps {{.*#+}} xmm0 = xmm1[0],xmm0[1,2],xmm1[3]
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 undef, i32 0, i32 6, i32 undef>
  %shuffle1 = shufflevector <4 x float> %shuffle, <4 x float> <float 0.000000e+00, float undef, float undef, float 0.000000e+00>, <4 x i32> <i32 4, i32 1, i32 2, i32 7>
  ret <4 x float> %shuffle1
}

define <4 x float> @shuffle_v4f32_05zz(<4 x float> %a, <4 x float> %b) {
; SSE-LABEL: shuffle_v4f32_05zz:
; SSE:       # BB#0:
; SSE-NEXT:    blendps {{.*#+}} xmm0 = xmm0[0],xmm1[1],xmm0[2,3]
; SSE-NEXT:    movq {{.*#+}} xmm0 = xmm0[0],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: shuffle_v4f32_05zz:
; AVX:       # BB#0:
; AVX-NEXT:    vblendps {{.*#+}} xmm0 = xmm0[0],xmm1[1],xmm0[2,3]
; AVX-NEXT:    vmovq {{.*#+}} xmm0 = xmm0[0],zero
; AVX-NEXT:    retq
  %shuffle = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 0, i32 5, i32 undef, i32 undef>
  %shuffle1 = shufflevector <4 x float> %shuffle, <4 x float> <float undef, float undef, float 0.000000e+00, float 0.000000e+00>, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  ret <4 x float> %shuffle1
}

define <4 x float> @insertps_undef_input0(<4 x float> %a0, <4 x float> %a1) {
; SSE-LABEL: insertps_undef_input0:
; SSE:       # BB#0:
; SSE-NEXT:    insertps {{.*#+}} xmm0 = zero,xmm1[0],zero,zero
; SSE-NEXT:    retq
;
; AVX-LABEL: insertps_undef_input0:
; AVX:       # BB#0:
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = zero,xmm1[0],zero,zero
; AVX-NEXT:    retq
  %res0 = fadd <4 x float> %a0, <float 1.0, float 1.0, float 1.0, float 1.0>
  %res1 = call <4 x float> @llvm.x86.sse41.insertps(<4 x float> %res0, <4 x float> %a1, i8 21)
  %res2 = shufflevector <4 x float> %res1, <4 x float> zeroinitializer, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  ret <4 x float> %res2
}

define <4 x float> @insertps_undef_input1(<4 x float> %a0, <4 x float> %a1) {
; SSE-LABEL: insertps_undef_input1:
; SSE:       # BB#0:
; SSE-NEXT:    xorps %xmm1, %xmm1
; SSE-NEXT:    blendps {{.*#+}} xmm0 = xmm1[0,1,2],xmm0[3]
; SSE-NEXT:    retq
;
; AVX-LABEL: insertps_undef_input1:
; AVX:       # BB#0:
; AVX-NEXT:    vxorps %xmm1, %xmm1, %xmm1
; AVX-NEXT:    vblendps {{.*#+}} xmm0 = xmm1[0,1,2],xmm0[3]
; AVX-NEXT:    retq
  %res0 = fadd <4 x float> %a1, <float 1.0, float 1.0, float 1.0, float 1.0>
  %res1 = call <4 x float> @llvm.x86.sse41.insertps(<4 x float> %a0, <4 x float> %res0, i8 21)
  %res2 = shufflevector <4 x float> %res1, <4 x float> zeroinitializer, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  ret <4 x float> %res2
}

define <4 x float> @insertps_zero_from_v2f64(<4 x float> %a0, <2 x double>* %a1) nounwind {
; SSE-LABEL: insertps_zero_from_v2f64:
; SSE:       # BB#0:
; SSE-NEXT:    movapd (%rdi), %xmm1
; SSE-NEXT:    addpd {{.*}}(%rip), %xmm1
; SSE-NEXT:    insertps {{.*#+}} xmm0 = zero,xmm0[2,2,3]
; SSE-NEXT:    movapd %xmm1, (%rdi)
; SSE-NEXT:    retq
;
; AVX-LABEL: insertps_zero_from_v2f64:
; AVX:       # BB#0:
; AVX-NEXT:    vmovapd (%rdi), %xmm1
; AVX-NEXT:    vaddpd {{.*}}(%rip), %xmm1, %xmm1
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = zero,xmm0[2,2,3]
; AVX-NEXT:    vmovapd %xmm1, (%rdi)
; AVX-NEXT:    retq
  %1 = load <2 x double>, <2 x double>* %a1
  %2 = bitcast <2 x double> <double 1.0, double 2.0> to <4 x float>
  %3 = fadd <2 x double> %1, <double 1.0, double 2.0>
  %4 = shufflevector <4 x float> %a0, <4 x float> %2, <4 x i32> <i32 6, i32 2, i32 2, i32 3>
  store <2 x double> %3, <2 x double> *%a1
  ret <4 x float> %4
}

define <4 x float> @insertps_zero_from_v2i64(<4 x float> %a0, <2 x i64>* %a1) nounwind {
; SSE-LABEL: insertps_zero_from_v2i64:
; SSE:       # BB#0:
; SSE-NEXT:    movdqa (%rdi), %xmm1
; SSE-NEXT:    paddq {{.*}}(%rip), %xmm1
; SSE-NEXT:    insertps {{.*#+}} xmm0 = zero,xmm0[2,2,3]
; SSE-NEXT:    movdqa %xmm1, (%rdi)
; SSE-NEXT:    retq
;
; AVX-LABEL: insertps_zero_from_v2i64:
; AVX:       # BB#0:
; AVX-NEXT:    vmovdqa (%rdi), %xmm1
; AVX-NEXT:    vpaddq {{.*}}(%rip), %xmm1, %xmm1
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = zero,xmm0[2,2,3]
; AVX-NEXT:    vmovdqa %xmm1, (%rdi)
; AVX-NEXT:    retq
  %1 = load <2 x i64>, <2 x i64>* %a1
  %2 = bitcast <2 x i64> <i64 1, i64 -2> to <4 x float>
  %3 = add <2 x i64> %1, <i64 1, i64 -2>
  %4 = shufflevector <4 x float> %a0, <4 x float> %2, <4 x i32> <i32 5, i32 2, i32 2, i32 3>
  store <2 x i64> %3, <2 x i64> *%a1
  ret <4 x float> %4
}

define <4 x float> @insertps_zero_from_v8i16(<4 x float> %a0, <8 x i16>* %a1) nounwind {
; SSE-LABEL: insertps_zero_from_v8i16:
; SSE:       # BB#0:
; SSE-NEXT:    movdqa (%rdi), %xmm1
; SSE-NEXT:    paddw {{.*}}(%rip), %xmm1
; SSE-NEXT:    insertps {{.*#+}} xmm0 = zero,xmm0[2,2,3]
; SSE-NEXT:    movdqa %xmm1, (%rdi)
; SSE-NEXT:    retq
;
; AVX-LABEL: insertps_zero_from_v8i16:
; AVX:       # BB#0:
; AVX-NEXT:    vmovdqa (%rdi), %xmm1
; AVX-NEXT:    vpaddw {{.*}}(%rip), %xmm1, %xmm1
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = zero,xmm0[2,2,3]
; AVX-NEXT:    vmovdqa %xmm1, (%rdi)
; AVX-NEXT:    retq
  %1 = load <8 x i16>, <8 x i16>* %a1
  %2 = bitcast <8 x i16> <i16 0, i16 0, i16 1, i16 1, i16 2, i16 2, i16 3, i16 3> to <4 x float>
  %3 = add <8 x i16> %1, <i16 0, i16 0, i16 1, i16 1, i16 2, i16 2, i16 3, i16 3>
  %4 = shufflevector <4 x float> %a0, <4 x float> %2, <4 x i32> <i32 4, i32 2, i32 2, i32 3>
  store <8 x i16> %3, <8 x i16> *%a1
  ret <4 x float> %4
}

define <4 x float> @consecutive_load_insertps_04zz(float* %p) {
; SSE-LABEL: consecutive_load_insertps_04zz:
; SSE:       # BB#0:
; SSE-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: consecutive_load_insertps_04zz:
; AVX:       # BB#0:
; AVX-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    retq
  %p0 = getelementptr inbounds float, float* %p, i64 1
  %p1 = getelementptr inbounds float, float* %p, i64 2
  %s0 = load float, float* %p0
  %s1 = load float, float* %p1
  %v0 = insertelement <4 x float> undef, float %s0, i32 0
  %v1 = insertelement <4 x float> undef, float %s1, i32 0
  %res = call <4 x float> @llvm.x86.sse41.insertps(<4 x float> %v0, <4 x float> %v1, i8 28)
  ret <4 x float> %res
}

define float @extract_zero_insertps_z0z7(<4 x float> %a0, <4 x float> %a1) {
; SSE-LABEL: extract_zero_insertps_z0z7:
; SSE:       # BB#0:
; SSE-NEXT:    xorps %xmm0, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: extract_zero_insertps_z0z7:
; AVX:       # BB#0:
; AVX-NEXT:    vxorps %xmm0, %xmm0, %xmm0
; AVX-NEXT:    retq
  %res = call <4 x float> @llvm.x86.sse41.insertps(<4 x float> %a0, <4 x float> %a1, i8 21)
  %ext = extractelement <4 x float> %res, i32 0
  ret float %ext
}

define float @extract_lane_insertps_5123(<4 x float> %a0, <4 x float> *%p1) {
; SSE-LABEL: extract_lane_insertps_5123:
; SSE:       # BB#0:
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    retq
;
; AVX-LABEL: extract_lane_insertps_5123:
; AVX:       # BB#0:
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    retq
  %a1 = load <4 x float>, <4 x float> *%p1
  %res = call <4 x float> @llvm.x86.sse41.insertps(<4 x float> %a0, <4 x float> %a1, i8 128)
  %ext = extractelement <4 x float> %res, i32 0
  ret float %ext
}

declare <4 x float> @llvm.x86.sse41.insertps(<4 x float>, <4 x float>, i8) nounwind readnone
