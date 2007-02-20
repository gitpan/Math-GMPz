#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"
#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

#if defined USE_64_BIT_INT || defined USE_LONG_DOUBLE
#include <inttypes.h>
#endif

#ifdef OLDPERL
#define SvUOK SvIsUV
#endif

SV * Rmpz_init_set_str_nobless(SV * num, SV * base) {
     mpz_t * mpz_t_obj;
     unsigned long b = SvUV(base);
     SV * obj_ref, * obj;

     if(b == 1 || b > 36) croak("Second argument supplied to Rmpz_init_set_str_nobless() is not in acceptable range");

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_create function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, NULL);
     if(mpz_init_set_str (*mpz_t_obj, SvPV_nolen(num), b))
        croak("First argument supplied to Rmpz_create_init_nobless() is not a valid base %u number", b);

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;

}

SV * Rmpz_init2_nobless(SV * bits) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init2_nobless function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, NULL);
     mpz_init2 (*mpz_t_obj, SvUV(bits));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;

}

SV * Rmpz_init_nobless() {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_nobless function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, NULL);
     mpz_init(*mpz_t_obj);

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set_nobless(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_nobless function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, NULL);
     mpz_init_set(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(p)))));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set_ui_nobless(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_ui_nobless function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, NULL);
     mpz_init_set_ui(*mpz_t_obj, SvUV(p));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set_si_nobless(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_si_nobless function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, NULL);
     mpz_init_set_si(*mpz_t_obj, SvIV(p));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}


SV * Rmpz_init_set_d_nobless(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_d_nobless function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, NULL);
     mpz_init_set_d(*mpz_t_obj, SvNV(p));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init() {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init_set(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(p)))));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set_ui(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_ui function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init_set_ui(*mpz_t_obj, SvUV(p));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set_si(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_si function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init_set_si(*mpz_t_obj, SvIV(p));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}


SV * Rmpz_init_set_d(SV * p) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_d function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init_set_d(*mpz_t_obj, SvNV(p));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpz_init_set_str(SV * num, SV * base) {
     mpz_t * mpz_t_obj;
     unsigned long b = SvUV(base);
     SV * obj_ref, * obj;

     if(b == 1 || b > 36) croak("Second argument supplied to Rmpz_init_set_str() is not in acceptable range");

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init_set_str function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     if(mpz_init_set_str (*mpz_t_obj, SvPV_nolen(num), b))
        croak("First argument supplied to Rmpz_init_set_str() is not a valid base %u number", b);

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;

}

SV * Rmpz_init2(SV * bits) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in Rmpz_init2 function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init2 (*mpz_t_obj, SvUV(bits));

     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;

}

SV * Rmpz_get_str(SV * p, SV * base) {
     char * out;
     SV * outsv;
     unsigned long b = SvUV(base);

     if(b < 2 || b > 36) croak("Second argument supplied to Rmpz_get_str() is not in acceptable range");

     New(2, out, mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))), b) + 5, char);
     if(out == NULL) croak("Failed to allocate memory in Rmpz_deref function");

     mpz_get_str(out, b, *(INT2PTR(mpz_t *, SvIV(SvRV(p)))));
     outsv = newSVpv(out, 0);
     Safefree(out);
     return outsv;
}

void DESTROY(SV * p) {
/*     printf("Destroying mpz "); */
     mpz_clear(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))));
     Safefree(INT2PTR(mpz_t *, SvIV(SvRV(p))));
/*     printf("...destroyed\n"); */
}

void Rmpz_clear(SV * p) {
     mpz_clear(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))));
     Safefree(INT2PTR(mpz_t *, SvIV(SvRV(p))));
}

void Rmpz_clear_mpz(SV * p) {
     mpz_clear(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))));
}

void Rmpz_clear_ptr(SV * p) {
     Safefree(INT2PTR(mpz_t *, SvIV(SvRV(p))));
}

void Rmpz_realloc2(SV * integer, SV * bits){
     mpz_realloc2(*(INT2PTR(mpz_t *, SvIV(SvRV(integer)))), SvUV(bits));
}

void Rmpz_set(SV * copy, SV * original) {
     mpz_set(*(INT2PTR(mpz_t *, SvIV(SvRV(copy)))), *(INT2PTR(mpz_t *, SvIV(SvRV(original)))));
}

void Rmpz_set_q(SV * copy, SV * original) {
     mpz_set_q(*(INT2PTR(mpz_t *, SvIV(SvRV(copy)))), *(INT2PTR(mpq_t *, SvIV(SvRV(original)))));
}

void Rmpz_set_f(SV * copy, SV * original) {
     mpz_set_f(*(INT2PTR(mpz_t *, SvIV(SvRV(copy)))), *(INT2PTR(mpf_t *, SvIV(SvRV(original)))));
}

void Rmpz_set_si(SV * copy, SV * original) {
     mpz_set_si(*(INT2PTR(mpz_t *, SvIV(SvRV(copy)))), SvIV(original));
}

void Rmpz_set_ui(SV * copy, SV * original) {
     mpz_set_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(copy)))), SvUV(original));
}

void Rmpz_set_d(SV * copy, SV * original) {
     mpz_set_d(*(INT2PTR(mpz_t *, SvIV(SvRV(copy)))), SvNV(original));
}

void Rmpz_set_str(SV * copy, SV * original, SV * base) {
    if(SvUV(base) == 1 || SvUV(base) > 36) croak("Second argument supplied to Rmpz_set_str() is not in acceptable range");
    if(mpz_set_str(*(INT2PTR(mpz_t *, SvIV(SvRV(copy)))), SvPV_nolen(original), SvUV(base)))
       croak("Second argument supplied to Rmpz_set_str() is not a valid base %u number", SvUV(base));
}

void Rmpz_swap(SV * a, SV * b) {
     mpz_swap(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
}

SV * Rmpz_get_ui(SV * n) {
     return newSVuv(mpz_get_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(n))))));
}

SV * Rmpz_get_si(SV * n) {
     return newSViv(mpz_get_si(*(INT2PTR(mpz_t *, SvIV(SvRV(n))))));
}

SV * Rmpz_get_d(SV * n) {
     return newSVnv(mpz_get_d(*(INT2PTR(mpz_t *, SvIV(SvRV(n))))));
}

void Rmpz_get_d_2exp(SV * n) {
     Inline_Stack_Vars;
     double d;
     unsigned long exp, *expptr;

     expptr = &exp;
     d = mpz_get_d_2exp(expptr, *(INT2PTR(mpz_t *, SvIV(SvRV(n)))));
 
     Inline_Stack_Reset;
     Inline_Stack_Push(sv_2mortal(newSVnv(d)));
     Inline_Stack_Push(sv_2mortal(newSVuv(exp)));
     Inline_Stack_Done;
     Inline_Stack_Return(2);
}

SV * Rmpz_getlimbn(SV * p, SV * n) {
     return newSVuv(mpz_getlimbn(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))), SvUV(n)));
}

void Rmpz_add(SV * dest, SV * src1, SV * src2) {
     mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src2)))) );
}

void Rmpz_add_ui(SV * dest, SV * src, SV * num) {
     mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src)))), SvUV(num));
/*     return sv_setref_pv(newSViv(0), Nullch, INT2PTR(mpz_t *, SvIV(SvRV(dest)))); */ 
}

void Rmpz_sub(SV * dest, SV * src1, SV * src2) {
     mpz_sub(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src2)))) );
}

void Rmpz_sub_ui(SV * dest, SV * src, SV * num) {
     mpz_sub_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src)))), SvUV(num));
}

void Rmpz_ui_sub(SV * dest, SV * num, SV * src) {
     mpz_ui_sub(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), SvUV(num), *(INT2PTR(mpz_t *, SvIV(SvRV(src)))));
}

void Rmpz_mul(SV * dest, SV * src1, SV * src2) {
     mpz_mul(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src2)))) );
}

void Rmpz_mul_si(SV * dest, SV * src, SV * num) {
     mpz_mul_si(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src)))), SvIV(num));
}

void Rmpz_mul_ui(SV * dest, SV * src, SV * num) {
     mpz_mul_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src)))), SvUV(num));
}

void Rmpz_addmul(SV * dest, SV * src1, SV * src2) {
     mpz_addmul(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src2)))) );
}

void Rmpz_addmul_ui(SV * dest, SV * src, SV * num) {
     mpz_addmul_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src)))), SvUV(num));
}

void Rmpz_submul(SV * dest, SV * src1, SV * src2) {
     mpz_submul(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src2)))) );
}

void Rmpz_submul_ui(SV * dest, SV * src, SV * num) {
     mpz_submul_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src)))), SvUV(num));
}

void Rmpz_mul_2exp(SV * dest, SV * src1, SV * b) {
     mpz_mul_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), SvUV(b));
}

void Rmpz_neg(SV * dest, SV * src) {
     mpz_neg(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src)))) );
}

void Rmpz_abs(SV * dest, SV * src) {
     mpz_abs(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src)))) );
}

void Rmpz_cdiv_q( SV * q, SV *  n, SV * d) {
     mpz_cdiv_q(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
}

void Rmpz_cdiv_r( SV * mod, SV *  n, SV * d) {
     mpz_cdiv_r(*(INT2PTR(mpz_t *, SvIV(SvRV(mod)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
}

void Rmpz_cdiv_qr( SV * q, SV * r, SV *  n, SV * d) {
     mpz_cdiv_qr(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
}

SV * Rmpz_cdiv_q_ui( SV * q, SV *  n, SV * d) {
     return newSVuv(mpz_cdiv_q_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d)));
}

SV * Rmpz_cdiv_r_ui( SV * q, SV *  n, SV * d) {
     return newSVuv(mpz_cdiv_r_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d)));
}

SV * Rmpz_cdiv_qr_ui( SV * q, SV * r, SV *  n, SV * d) {
     return newSVuv(mpz_cdiv_qr_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d)));
}

int Rmpz_cdiv_ui( SV *  n, SV * d) {
    return mpz_cdiv_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d));
}

void Rmpz_cdiv_q_2exp( SV * q, SV *  n, SV * b) {
     mpz_cdiv_q_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(b));
}

void Rmpz_cdiv_r_2exp( SV * r, SV *  n, SV * b) {
     mpz_cdiv_r_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(b));
}

void Rmpz_fdiv_q( SV * q, SV *  n, SV * d) {
     mpz_fdiv_q(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
}

/* % mpz-t (modulus) operator */
void Rmpz_fdiv_r( SV * mod, SV *  n, SV * d) {
     mpz_fdiv_r(*(INT2PTR(mpz_t *, SvIV(SvRV(mod)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
}

void Rmpz_fdiv_qr( SV * q, SV * r, SV *  n, SV * d) {
     mpz_fdiv_qr(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
}

SV * Rmpz_fdiv_q_ui( SV * q, SV *  n, SV * d) {
     return newSVuv(mpz_fdiv_q_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d)));
}

SV * Rmpz_fdiv_r_ui( SV * q, SV *  n, SV * d) {
     return newSVuv(mpz_fdiv_r_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d)));
}

SV * Rmpz_fdiv_qr_ui( SV * q, SV * r, SV *  n, SV * d) {
     return newSVuv(mpz_fdiv_qr_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d)));
}

/* % int (modulus) operator */
int Rmpz_fdiv_ui( SV *  n, SV * d) {
    return mpz_fdiv_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d));
}

void Rmpz_fdiv_q_2exp( SV * q, SV *  n, SV * b) {
     mpz_fdiv_q_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(b));
}

void Rmpz_fdiv_r_2exp( SV * r, SV *  n, SV * b) {
     mpz_fdiv_r_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(b));
}

void Rmpz_tdiv_q( SV * q, SV *  n, SV * d) {
     mpz_tdiv_q(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
}

/* % mpz-t (modulus) operator */
void Rmpz_tdiv_r( SV * mod, SV *  n, SV * d) {
     mpz_tdiv_r(*(INT2PTR(mpz_t *, SvIV(SvRV(mod)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
}

void Rmpz_tdiv_qr( SV * q, SV * r, SV *  n, SV * d) {
     mpz_tdiv_qr(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
}

SV * Rmpz_tdiv_q_ui( SV * q, SV *  n, SV * d) {
     return newSVuv(mpz_tdiv_q_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d)));
}

SV * Rmpz_tdiv_r_ui( SV * q, SV *  n, SV * d) {
     return newSVuv(mpz_tdiv_r_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d)));
}

SV * Rmpz_tdiv_qr_ui( SV * q, SV * r, SV *  n, SV * d) {
     return newSVuv(mpz_tdiv_qr_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d)));
}

/* % int (modulus) operator */
int Rmpz_tdiv_ui( SV *  n, SV * d) {
    return mpz_tdiv_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d));
}

void Rmpz_tdiv_q_2exp( SV * q, SV *  n, SV * b) {
     mpz_tdiv_q_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(b));
}

void Rmpz_tdiv_r_2exp( SV * r, SV *  n, SV * b) {
     mpz_tdiv_r_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(b));
}

void Rmpz_mod( SV * r, SV *  n, SV * d) {
     mpz_mod(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
}

SV * Rmpz_mod_ui( SV * r, SV *  n, SV * d) {
     return newSVuv(mpz_mod_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d)));
}

void Rmpz_divexact(SV * dest, SV * n, SV * d) {
     mpz_divexact(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))) );
}

void Rmpz_divexact_ui(SV * dest, SV * n, SV * d) {
     mpz_divexact_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d));
}

int Rmpz_divisible_p(SV * n, SV * d) {
    return mpz_divisible_p(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
}

int Rmpz_divisible_ui_p(SV * n, SV * d) {
    return mpz_divisible_ui_p(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d));
}

int Rmpz_divisible_2exp_p(SV * n, SV * b) {
    return mpz_divisible_2exp_p(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(b));
}

SV * Rmpz_congruent_p(SV * n, SV * c, SV * d) {
     return newSViv(mpz_congruent_p(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(c)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d))))));
}

SV * Rmpz_congruent_ui_p(SV * n, SV * c, SV * d) {
     return newSViv(mpz_congruent_ui_p(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(c), SvUV(d)));
}

SV * Rmpz_congruent_2exp_p(SV * n, SV * c, SV * d) {
     return newSViv(mpz_congruent_2exp_p(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(c)))), SvUV(d)));
}

void Rmpz_powm(SV * dest, SV * base, SV * exp, SV * mod) {
     mpz_powm(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(base)))), *(INT2PTR(mpz_t *, SvIV(SvRV(exp)))), *(INT2PTR(mpz_t *, SvIV(SvRV(mod)))));
}

void Rmpz_powm_ui(SV * dest, SV * base, SV * exp, SV * mod) {
     mpz_powm_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(base)))), SvUV(exp), *(INT2PTR(mpz_t *, SvIV(SvRV(mod)))));
}

void Rmpz_pow_ui(SV * dest, SV * base, SV * exp) {
     mpz_pow_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(base)))), SvUV(exp));
}

void Rmpz_ui_pow_ui(SV * dest, SV * base, SV * exp) {
     mpz_ui_pow_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), SvUV(base), SvUV(exp));
}

SV * Rmpz_root(SV * r, SV * n, SV * d) {
     return newSViv(mpz_root(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d)));
}

void Rmpz_sqrt(SV * r, SV * n) {
     mpz_sqrt(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))));
}

void Rmpz_sqrtrem(SV * root, SV * rem, SV * src) {
     mpz_sqrtrem(*(INT2PTR(mpz_t *, SvIV(SvRV(root)))), *(INT2PTR(mpz_t *, SvIV(SvRV(rem)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src)))));
}

int Rmpz_perfect_power_p(SV * in) {
    return mpz_perfect_power_p(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))));
}

int Rmpz_perfect_square_p(SV * in) {
    return mpz_perfect_square_p(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))));
}

int Rmpz_probab_prime_p(SV * cand, SV * reps) {
    return mpz_probab_prime_p(*(INT2PTR(mpz_t *, SvIV(SvRV(cand)))), SvUV(reps));
}

void Rmpz_nextprime(SV * prime, SV * init) {
     mpz_nextprime(*(INT2PTR(mpz_t *, SvIV(SvRV(prime)))), *(INT2PTR(mpz_t *, SvIV(SvRV(init)))));
}

void Rmpz_gcd(SV * gcd, SV * src1, SV * src2) {
     mpz_gcd(*(INT2PTR(mpz_t *, SvIV(SvRV(gcd)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src2)))));
}

void Rmpz_gcd_ui(SV * gcd, SV * n, SV * d) {
     mpz_gcd_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(gcd)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d));
}

void Rmpz_gcdext(SV * g, SV * s, SV * t, SV * a, SV * b) {
     mpz_gcdext(*(INT2PTR(mpz_t *, SvIV(SvRV(g)))), *(INT2PTR(mpz_t *, SvIV(SvRV(s)))), *(INT2PTR(mpz_t *, SvIV(SvRV(t)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
}

void Rmpz_lcm(SV * lcm, SV * src1, SV * src2) {
     mpz_lcm(*(INT2PTR(mpz_t *, SvIV(SvRV(lcm)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src2)))));
}

void Rmpz_lcm_ui(SV * lcm, SV * src1, SV * src2) {
     mpz_lcm_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(lcm)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), SvUV(src2));
}

int Rmpz_invert(SV * inv, SV * src1, SV * src2) {
    return mpz_invert(*(INT2PTR(mpz_t *, SvIV(SvRV(inv)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src2)))));
}

int Rmpz_jacobi(SV * a, SV * b) {
    return mpz_jacobi(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
}

int Rmpz_legendre(SV * a, SV * b) {
    return mpz_legendre(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
}

int Rmpz_kronecker(SV * a, SV * b) {
    return mpz_kronecker(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
}

int Rmpz_kronecker_si(SV * a, SV * b) {
    return mpz_kronecker_si(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
}

int Rmpz_kronecker_ui(SV * a, SV * b) {
    return mpz_kronecker_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
}

int Rmpz_si_kronecker(SV * a, SV * b) {
    return mpz_si_kronecker(SvIV(a), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
}

int Rmpz_ui_kronecker(SV * a, SV * b) {
    return mpz_ui_kronecker(SvUV(a), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
}

SV * Rmpz_remove(SV * rem, SV * src1, SV * src2) {
     return newSVuv(mpz_remove(*(INT2PTR(mpz_t *, SvIV(SvRV(rem)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src2))))));
}

void Rmpz_fac_ui(SV * fac, SV * b) {
     mpz_fac_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(fac)))), SvUV(b));
}

void Rmpz_bin_ui(SV * dest, SV * n, SV * d) {
     mpz_bin_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d));
}

void Rmpz_bin_uiui(SV * dest, SV * n, SV * d) {
     mpz_bin_uiui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), SvUV(n), SvUV(d));
}

void Rmpz_fib_ui(SV * dest, SV * b) {
     mpz_fib_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), SvUV(b));
}

void Rmpz_fib2_ui(SV * fn, SV * fnsub1, SV * b) {
     mpz_fib2_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(fn)))), *(INT2PTR(mpz_t *, SvIV(SvRV(fnsub1)))), SvUV(b));
}

void Rmpz_lucnum_ui(SV * dest, SV * b) {
     mpz_lucnum_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), SvUV(b));
}

void Rmpz_lucnum2_ui(SV * ln, SV * lnsub1, SV * b) {
     mpz_lucnum2_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(ln)))), *(INT2PTR(mpz_t *, SvIV(SvRV(lnsub1)))), SvUV(b));
}

int Rmpz_cmp(SV * n, SV * d) {
    return mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))) );
}

int Rmpz_cmp_d(SV * n, SV * d) {
    return mpz_cmp_d(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvNV(d));
}

int Rmpz_cmp_si(SV * n, SV * d) {
    return mpz_cmp_si(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvIV(d));
}

int Rmpz_cmp_ui(SV * n, int d) {
    return mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), d);
}

int Rmpz_cmpabs(SV * n, SV * d) {
    return mpz_cmpabs(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))) );
}

int Rmpz_cmpabs_d(SV * n, SV * d) {
    return mpz_cmpabs_d(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvNV(d));
}

int Rmpz_cmpabs_ui(SV * n, SV * d) {
    return mpz_cmpabs_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(d));
}

int Rmpz_sgn(SV * n) {
    return mpz_sgn(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))));
}

void Rmpz_and(SV * dest, SV * src1, SV * src2) {
     mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src2)))) );
}

void Rmpz_ior(SV * dest, SV * src1, SV * src2) {
     mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src2)))) );
}

void Rmpz_xor(SV * dest, SV * src1, SV * src2) {
     mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src2)))) );
}

void Rmpz_com(SV * dest, SV * src) {
     mpz_com(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src)))) );
}

int Rmpz_popcount(SV * in) {
    return mpz_popcount(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))));
}

int Rmpz_hamdist(SV * dest, SV * src) {
     return mpz_hamdist(*(INT2PTR(mpz_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpz_t *, SvIV(SvRV(src)))) );
}

int Rmpz_scan0(SV * n, SV * start_bit) {
    return mpz_scan0(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(start_bit));
}

int Rmpz_scan1(SV * n, SV * start_bit) {
    return mpz_scan1(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), SvUV(start_bit));
}

void Rmpz_setbit(SV * num, SV * bit_index) {
     mpz_setbit(*(INT2PTR(mpz_t *, SvIV(SvRV(num)))), SvUV(bit_index));
}

void Rmpz_clrbit(SV * num, SV * bit_index) {
     mpz_clrbit(*(INT2PTR(mpz_t *, SvIV(SvRV(num)))), SvUV(bit_index));
}

int Rmpz_tstbit(SV * num, SV * bit_index) {
    return mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(num)))), SvUV(bit_index));
}

/* Turn a binary string into an mpz_t */
void Rmpz_import(SV * rop, SV * count, SV * order, SV * size, SV * endian, SV * nails, SV * op){
     mpz_import(*(INT2PTR(mpz_t *, SvIV(SvRV(rop)))), SvUV(count), SvIV(order), SvIV(size), SvIV(endian), SvUV(nails), SvPV_nolen(op));
}

/* Return an mpz_t to a binary string */
SV * Rmpz_export(SV * order, SV * size, SV * endian, SV * nails, SV * number) {
     SV * outsv;
     char * out;
     size_t * cptr, count;

     cptr = &count;
     count = mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(number)))), 2);

     Newz(1, out, count / 8 + 7, char);
     if(out == NULL) croak("Failed to allocate memory in Rmpz_export function");
     
     mpz_export(out, cptr, SvIV(order), SvIV(size), SvIV(endian), SvIV(nails), *(INT2PTR(mpz_t *, SvIV(SvRV(number)))));
     outsv = newSVpv(out, count);
     Safefree(out);
     return outsv;
}

int Rmpz_fits_ulong_p(SV * in) {
    return mpz_fits_ulong_p(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))));
}

int Rmpz_fits_slong_p(SV * in) {
    return mpz_fits_slong_p(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))));
}

int Rmpz_fits_uint_p(SV * in) {
    return mpz_fits_uint_p(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))));
}

int Rmpz_fits_sint_p(SV * in) {
    return mpz_fits_sint_p(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))));
}

int Rmpz_fits_ushort_p(SV * in) {
    return mpz_fits_ushort_p(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))));
}

int Rmpz_fits_sshort_p(SV * in) {
    return mpz_fits_sshort_p(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))));
}

int Rmpz_odd_p(SV * in) {
    return mpz_odd_p(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))));
}

int Rmpz_even_p(SV * in) {
    return mpz_even_p(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))));
}

int Rmpz_size(SV * in) {
    return mpz_size(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))));
}

int Rmpz_sizeinbase(SV * in, SV * base) {
    return mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(in)))), SvUV(base));
}

void Rsieve_gmp(int x_arg, int a, SV *number) {
Inline_Stack_Vars;
unsigned short *v, *addon, set[16] = {65534,65533,65531,65527,65519,65503,65471,65407,65279,65023,64511,63487,61439,57343,49151,32767};
unsigned long init, leap, abits, asize, i, size, b, imax, k, x = x_arg;

if(sizeof(short) != 2) croak("The sieve_gmp function is unsuitable for this architecture.\nContact the author and he may do something about it.");
if(a & 1) croak("max_add must be even in sieve_gmp function");
if(x & 1) croak("max_prime must be even in sieve_gmp function");

if(!mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(number)))), 0)) croak("candidate must be odd in sieve_gmp function");

abits = (a / 2) + 1;

if(!(abits % 16)) asize = abits / 16;
else asize = (abits / 16) + 1;

Newz(1, addon, asize, unsigned short);
if(addon == NULL) croak("1: Unable to allocate memory in sieve_gmp function");

for(i = 0; i < asize; ++i) addon[i] = 65535;

imax = sqrt(x - 1) / 2;

b = (x + 1) / 2;

if(!(b % 16)) size = b / 16;
else size = (b / 16) + 1;

Newz(2, v, size, unsigned short);
if(v == NULL) croak("2: Unable to allocate memory in sieve_gmp function");

for(i = 1; i < size; ++i) v[i] = 65535;
v[0] = 65534;

for(i = 0; i <= imax; ++i) {
    
    if(v[i / 16] & (1 << (i % 16))) {
       leap = (2 * i) + 1;
       k = 2 * i * (i + 1);
       while(k < b) {
             v[k / 16] &= set[k % 16];
             k += leap;
             }
       }
}

size = 0;
Inline_Stack_Reset;

for(i = 0; i < b; ++i) {
    if(v[i / 16] & (1 << (i % 16))) {
      leap = 2 * i + 1;
        init = mpz_fdiv_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(number)))), leap);
      if(init) {
        if(init & 1) init = (leap - init) / 2;
        else init = leap - (init / 2);
        }
      while(init < abits) {
         addon[init / 16] &= set[init % 16];
         init += leap;
         }
      }
   }

Safefree(v);

for(i = 0; i < abits; ++i) {
    if(addon[i / 16] & (1 << (i % 16))) {
      Inline_Stack_Push(sv_2mortal(newSViv(2 * i)));
      ++size;
      }
   }

Safefree(addon);

Inline_Stack_Done;
Inline_Stack_Return(size);

}

int Rfermat_gmp(SV * num, SV * base){
            mpz_t b, num_less_1;

    mpz_init_set_ui(b, SvUV(base));
    mpz_init_set(num_less_1, *(INT2PTR(mpz_t *, SvIV(SvRV(num)))));
    mpz_sub_ui(num_less_1, num_less_1, 1);
    mpz_powm(b, b, num_less_1, *(INT2PTR(mpz_t *, SvIV(SvRV(num)))));

    if(!mpz_cmp_si(b, 1)) {
       mpz_clear(b);
       mpz_clear(num_less_1);
       return 1;
       }

    mpz_clear(b);
    mpz_clear(num_less_1);
    return 0;
}

int Rrm_gmp(SV * num, SV * base){
    mpz_t c_less, r, y, bb;
    unsigned long i, s = 0, b = SvUV(base);

    mpz_init(c_less);
    mpz_init(r);
    mpz_init(y);

    mpz_sub_ui(c_less, *(INT2PTR(mpz_t *, SvIV(SvRV(num)))), 1);
    mpz_set(r, c_less);
    mpz_init_set_ui(bb, b);

    while(mpz_even_p(r)) {
          mpz_tdiv_q_2exp(r, r, 1);
          ++s;
          } 

    mpz_powm(y, bb, r, *(INT2PTR(mpz_t *, SvIV(SvRV(num)))));
    mpz_clear(r);
    mpz_clear(bb);
    if(mpz_cmp_ui(y, 1) && mpz_cmp(y, c_less)) {
       for(i = 0; i < s; ++i) {
           mpz_powm_ui(y, y, 2, *(INT2PTR(mpz_t *, SvIV(SvRV(num))))); 
           if(!mpz_cmp_ui(y, 1)) {
              mpz_clear(c_less);
              mpz_clear(y);
              return 0;
              }
           if(!mpz_cmp(y, c_less)) break;
           }
       if(mpz_cmp(y, c_less)) {
          mpz_clear(c_less);
          mpz_clear(y);
          return 0;
          }
       }

   mpz_clear(c_less);
   mpz_clear(y);
   return 1; 
}

void Rprbg_ms(SV * outref, SV * p, SV * q, SV * seed, int bits_required) {
     mpz_t n, phi, pless1, qless1, mod, keep;
     unsigned long e, k, bign, r, its, i, r_shift, check;
     double kdoub;
     gmp_randstate_t state;

     mpz_init(n);
     mpz_init(phi);
     mpz_init(pless1);
     mpz_init(qless1);

     mpz_sub_ui(qless1, *(INT2PTR(mpz_t *, SvIV(SvRV(q)))), 1);
     mpz_sub_ui(pless1, *(INT2PTR(mpz_t *, SvIV(SvRV(p)))), 1);

     mpz_mul(n, *(INT2PTR(mpz_t *, SvIV(SvRV(p)))), *(INT2PTR(mpz_t *, SvIV(SvRV(q)))));

     mpz_mul(phi, pless1, qless1);
     mpz_clear(pless1);
     mpz_clear(qless1);

     bign = mpz_sizeinbase(n, 2);
     e = bign / 80;

     while(1) {
        if(mpz_gcd_ui(NULL, phi, e) == 1) break;
        --e;
        if(e < 3) croak("The chosen primes are unsuitable in prbg_ms() function");
        }

     mpz_clear(phi);

     kdoub = (double) 2 / (double) e;
     kdoub = (double) 1 - kdoub;
     kdoub *= (double) bign;
     k = kdoub;
     r = bign - k;

     gmp_randinit_default(state);
     gmp_randseed(state, *(INT2PTR(mpz_t *, SvIV(SvRV(seed)))));
     mpz_urandomb(*(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), state, r);
     gmp_randclear(state);

     r_shift = bits_required % k;

     if(r_shift) its = (bits_required / k) + 1;
     else its = bits_required / k;

     mpz_init(mod);
     mpz_init(keep);
     mpz_set_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(outref)))), 0);
     mpz_ui_pow_ui(mod, 2, k);

     for(i = 0; i < its; ++i) {
         mpz_powm_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), *(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), e, n);
         mpz_mod(keep, *(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), mod);
         mpz_mul_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(outref)))), *(INT2PTR(mpz_t *, SvIV(SvRV(outref)))), k);
         mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(outref)))), *(INT2PTR(mpz_t *, SvIV(SvRV(outref)))), keep);
         mpz_fdiv_q_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), *(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), k);
         if(!i) check = k - mpz_sizeinbase(keep, 2);    
         }
     mpz_clear(n); 
     mpz_clear(keep);
     mpz_clear(mod);

     if(r_shift) mpz_fdiv_q_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(outref)))), *(INT2PTR(mpz_t *, SvIV(SvRV(outref)))), k - r_shift);

     if(check + mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(outref)))), 2) != bits_required)
        croak("Bug in csprng() function");

}

void Rprbg_bbs(SV * outref, SV * p, SV * q, SV * seed, int bits_required) {
     mpz_t n, gcd, one;
     unsigned long i, k;
     gmp_randstate_t state;

     if(mpz_fdiv_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))), 4) != 3) croak ("First prime is unsuitable for Blum-Blum-Shub prbg (must be congruent to 3, mod 4)");
     if(mpz_fdiv_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), 4) != 3) croak ("Second prime is unsuitable for Blum-Blum-Shub prbg (must be congruent to 3, mod 4)"); 
     mpz_init(n);

     mpz_mul(n, *(INT2PTR(mpz_t *, SvIV(SvRV(p)))), *(INT2PTR(mpz_t *, SvIV(SvRV(q)))));

     mpz_init(gcd);
     gmp_randinit_default(state);
     gmp_randseed(state, *(INT2PTR(mpz_t *, SvIV(SvRV(seed)))));
     mpz_urandomm(*(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), state, n);
     gmp_randclear(state);

     while(1) {
           if(mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), 100) < 0)croak("Blum-Blum-Shub seed is ridiculously small. How did this happen ?");
           mpz_gcd(gcd, *(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), n);
           if(!mpz_cmp_ui(gcd, 1)) break;
           mpz_sub_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), *(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), 1);
           }

     mpz_powm_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), *(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), 2, n);

     mpz_init_set_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(outref)))), 0);
     mpz_init_set_ui(one, 1);

     for(i = 0; i < bits_required; ++i) {
         mpz_powm_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), *(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), 2, n);
         k = mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(seed)))), 0);
         if(k) {
            mpz_mul_2exp(gcd, one, i);      
            mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(outref)))), gcd, *(INT2PTR(mpz_t *, SvIV(SvRV(outref)))));
            }
         }

     mpz_clear(n); 
     mpz_clear(gcd);
     mpz_clear(one);

}

int Rmonobit(SV * bitstream) {
    unsigned long len, i, count = 0;

    len = mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), 2);

    if(len > 20000) croak("Wrong size random sequence for monobit test");
    if(len < 19967) {
       warn("More than 33 leading zeroes in Rmonobit test\n");
       return 0;
       }

    count = mpz_popcount(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))));

    if(count > 9654 && count < 10346) return 1;
    return 0;

}

int Rlong_run(SV * bitstream) {
    unsigned long i, el, init = 0, count = 0, len, t;

    len = mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), 2);

    if(len > 20000) croak("Wrong size random sequence for Rlong_run test");
    if(len < 19967) {
       warn("More than 33 leading zeroes in long_run test\n");
       return 0;
       }

    el = mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), 0);

    for(i = 0; i < len; ++i) {
        t = mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), i);
        if(t == el) ++count;
        else {
           el = t;
           if(count > init) init = count;
           count = 1;
           }
        }

    if(init < 34 && count < 34) return 1;
    return 0;

}

int Rruns(SV * bitstream) {
    int b[6] = {0,0,0,0,0,0}, g[6] = {0,0,0,0,0,0},
    len, count = 1, i, t, diff;

    len = mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), 2);
    diff = 20000 - len;

    if(len > 20000) croak("Wrong size random sequence for monobit test");
    if(len < 19967) {
       warn("More than 33 leading zeroes in runs test\n");
       return 0;
       }

    --len;

    for(i = 0; i < len; ++i) {
        t = mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), i);
        if(t == mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), i + 1)) ++ count;
        else {
           if(t) {
              if(count >= 6) ++b[5];
              else ++b[count - 1];
              }
            else {
              if(count >= 6) ++g[5];
              else ++g[count - 1];
              }
            count = 1;
            }
         }

     if(count >= 6) {
        if(mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), len)) {
           ++b[5];
           if(diff) ++g[diff - 1];
           }
        else ++g[5];
        }
     else {
        if(mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), len)) {
           ++b[count - 1];
           if(diff) ++g[diff - 1];
           }
        else {
          count += diff;
          if(count >= 6) ++g[5];
          else ++g[count - 1];
          }
        }

             
        if (
            b[0] <= 2267 || g[0] <= 2267 ||
            b[0] >= 2733 || g[0] >= 2733 ||
            b[1] <= 1079 || g[1] <= 1079 ||
            b[1] >= 1421 || g[1] >= 1421 ||
            b[2] <= 502  || g[2] <= 502  ||
            b[2] >= 748  || g[2] >= 748  ||
            b[3] <= 223  || g[3] <= 223  ||
            b[3] >= 402  || g[3] >= 402  ||
            b[4] <= 90   || g[4] <= 90   ||
            b[4] >= 223  || g[4] >= 223  ||
            b[5] <= 90   || g[5] <= 90   ||
            b[5] >= 223  || g[5] >= 223
           ) return 0;

    return 1;

}

int Rpoker (SV * bitstream) {
    int counts[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
       len, i, st, diff;
    double n = 0;

    len = mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), 2);

    if(len > 20000) croak("Wrong size random sequence for poker test");
    if(len < 19967) {
       warn("More than 33 leading zeroes in poker test\n");
       return 0;
       }

/* pad with trailing zeroes (if necessary) to achieve length of 20000 bits. */
    diff = 20000 - len;
    if(diff) mpz_mul_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), *(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), diff);
    if(mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), 2) != 20000) croak("Bug in bit sequence manipulation in poker() function");

    for(i = 0; i < 20000; i += 4) {
        st = mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), i) +
             (mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), i + 1) * 2) +
             (mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), i + 2) * 4) +
             (mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(bitstream)))), i + 3) * 8);
        ++counts[st];
        } 


    for(i = 0; i < 16; ++i) n += counts[i] * counts[i];

    n /= 5000;
    n *= 16;
    n -= 5000;

    if(n > 1.03 && n < 57.4) return 1;
    
    return 0;        
}

int Rparity_ul(unsigned long v) {
    v = (v >> 16) ^ v;
    v = (v >> 8) ^ v;
    v = (v >> 4) ^ v;
    v = (v >> 2) ^ v;

    return ((v >> 1) ^ v) & 1;
}

int Rparity_gmp(SV * num) {

    if(mpz_popcount(*(INT2PTR(mpz_t *, SvIV(SvRV(num))))) & 1) return 1;
    return 0;
}

SV * Rrotate_left_ul(SV * ulnum, SV * ulb, SV * uls) {
     int i, r = 0, a;
     unsigned long num = SvUV(ulnum), b = SvUV(ulb), s = SvUV(uls);
     b -= 1;

     if(s > b) croak ("rotate_left_ul() undefined for given arguments");
     for(i = 0; i < s; ++i) {
         if(num & (1 << (b - i))) {
            r += 1 << (s - 1 - i);
            }
         }

     num <<= s;
     num += r;

     a = 1 << (b + 1);
     a -= 1;
     num &= a;
     return newSVuv(num);
}

void Rrotate_left_gmp(SV * out, SV * num, SV * bsv, SV * ssv) {
     mpz_t r;
     int i;
     unsigned long s = SvUV(ssv), b = SvUV(bsv);

     if(s >= b) croak ("rotate_left_gmp() undefined for given arguments");

     mpz_init2(r, s);

     mpz_set(*(INT2PTR(mpz_t *, SvIV(SvRV(out)))), *(INT2PTR(mpz_t *, SvIV(SvRV(num)))));

     for(i = b - s; i < b; ++i) {
         if(mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(out)))), i)) {
            mpz_setbit(r, i - (b - s));
            mpz_clrbit(*(INT2PTR(mpz_t *, SvIV(SvRV(out)))), i);
            }
         } 

     mpz_mul_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(out)))), *(INT2PTR(mpz_t *, SvIV(SvRV(out)))), s);
     mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(out)))), *(INT2PTR(mpz_t *, SvIV(SvRV(out)))), r);
     mpz_clear(r);
}  

SV * Rrotate_right_ul(SV * ulnum, SV * ulb, SV * uls) {
     int i, r = 0, a, t;
     unsigned long num = SvUV(ulnum), b = SvUV(ulb), s = SvUV(uls);

     if(s >= b) croak ("rotate_right_ul() undefined for given arguments");

     a = 1 << b;
     a -= 1;
     num &= a;

     for(i = 0; i < s; ++i) {
         t = 1 << i;
         if(num & t) {
            r += t;
            }
         }

     num >>= s;
     num += r << (b - s);

     return newSVuv(num);
}

void Rrotate_right_gmp(SV * out, SV * num, SV * ulb, SV * uls) {
     mpz_t r;
     int i;
     unsigned long b = SvUV(ulb), s = SvUV(uls);

     if(s >= b) croak ("rotate_right_gmp() undefined for given arguments");

     mpz_init2(r, b);
     mpz_set(*(INT2PTR(mpz_t *, SvIV(SvRV(out)))), *(INT2PTR(mpz_t *, SvIV(SvRV(num))))); 

     for(i = 0; i < s; ++i) {
         if(mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(out)))), i)) mpz_setbit(r, b - s + i);
         }

     mpz_div_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(out)))), *(INT2PTR(mpz_t *, SvIV(SvRV(out)))), s);
     mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(out)))), *(INT2PTR(mpz_t *, SvIV(SvRV(out)))), r);
     mpz_clear(r);
}

void Rrsa_cert(SV * n,SV * d, SV * e, SV * p, SV * q) {
     mpz_t pless1, qless1;

     mpz_init(pless1);
     mpz_init(qless1);

     mpz_mul(*(INT2PTR(mpz_t *, SvIV(SvRV(n)))), *(INT2PTR(mpz_t *, SvIV(SvRV(p)))), *(INT2PTR(mpz_t *, SvIV(SvRV(q)))));
     if(!mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(e)))), 0))
        mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(e)))), *(INT2PTR(mpz_t *, SvIV(SvRV(e)))), 1);

     mpz_sub_ui(pless1, *(INT2PTR(mpz_t *, SvIV(SvRV(p)))), 1);
     mpz_sub_ui(qless1, *(INT2PTR(mpz_t *, SvIV(SvRV(q)))), 1);
     mpz_mul(pless1, pless1, qless1);

     while(1) {
           mpz_gcd(qless1, pless1, *(INT2PTR(mpz_t *, SvIV(SvRV(e)))));
           if(!mpz_cmp_ui(qless1, 1)) break;
           mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(e)))), *(INT2PTR(mpz_t *, SvIV(SvRV(e)))), 2);           
           }

     mpz_gcdext(qless1, *(INT2PTR(mpz_t *, SvIV(SvRV(d)))), NULL, *(INT2PTR(mpz_t *, SvIV(SvRV(e)))), pless1);
     if(mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(d)))), 0) < 0)
        mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(d)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))), pless1);

/* Sanity Check */
     mpz_mul(qless1, *(INT2PTR(mpz_t *, SvIV(SvRV(d)))), *(INT2PTR(mpz_t *, SvIV(SvRV(e)))));
     mpz_mod(qless1, qless1, pless1);
     if(mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(d)))), 0) <= 0 ||
        mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(d)))), pless1) >= 0 ||
        mpz_cmp_ui(qless1, 1)) croak ("Error in RSA certificate calculation");
         

mpz_clear(pless1);
mpz_clear(qless1);
}

void Rmers_div_q(SV * q, SV * n, SV * d) {
     mpz_t n_copy, add;
     unsigned long s = mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(d)))), 2);

     mpz_init_set(n_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(n)))));
     mpz_init2(add, mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(d)))), 2));

     mpz_set_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), 0);

     while(mpz_cmp(n_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(d))))) > 0) {
           mpz_and(add, n_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
           mpz_tdiv_q_2exp(n_copy, n_copy, s);
           mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(q)))), n_copy);
           mpz_add(n_copy, n_copy, add);
           }

     if(!mpz_cmp(n_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(d))))))
        mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(q)))), 1);

     mpz_clear(n_copy);
     mpz_clear(add);     
  
}

void Rmers_div_r(SV * r, SV * n, SV * d) {
     mpz_t n_copy, add;
     unsigned long s = mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(d)))), 2);

     mpz_init_set(n_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(n)))));
     mpz_init2(add, mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(d)))), 2));

     mpz_set_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), 0);

     while(mpz_cmp(n_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(d))))) > 0) {
           mpz_and(add, n_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
           mpz_tdiv_q_2exp(n_copy, n_copy, s);
           mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), add);
           }

     mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), n_copy);
     mpz_tdiv_r(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));

     mpz_clear(n_copy);
     mpz_clear(add);     
  
}

void Rmers_div_r5(SV * r, SV * n, SV * d, SV * n_copy, SV * add) {
     unsigned long s = mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(d)))), 2);

     mpz_set(*(INT2PTR(mpz_t *, SvIV(SvRV(n_copy)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n)))));
     mpz_set_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), 0);

     while(mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(n_copy)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d))))) > 0) {
           mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(add)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n_copy)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
           mpz_tdiv_q_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(n_copy)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n_copy)))), s);
           mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(add)))));
           }

     mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(n_copy)))));
     mpz_tdiv_r(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));

}

void Rmers_div_qr(SV * q, SV * r, SV * n, SV * d) {
     mpz_t n_copy, n2_copy, add;
     unsigned long s = mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(d)))), 2);

     mpz_init_set(n_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(n)))));
     mpz_init_set(n2_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(n)))));
     mpz_init2(add, mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(d)))), 2));

     mpz_set_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), 0);
     mpz_set_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), 0);

     while(mpz_cmp(n_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(d))))) > 0) {
           mpz_and(add, n_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
           mpz_tdiv_q_2exp(n_copy, n_copy, s);
           mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(q)))), n_copy);
           mpz_add(n_copy, n_copy, add);
           }

     if(!mpz_cmp(n_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(d))))))
        mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(q)))), *(INT2PTR(mpz_t *, SvIV(SvRV(q)))), 1);

     while(mpz_cmp(n2_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(d))))) > 0) {
           mpz_and(add, n2_copy, *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));
           mpz_tdiv_q_2exp(n2_copy, n2_copy, s);
           mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), add);
           }

     mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), n2_copy);
     mpz_tdiv_r(*(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(r)))), *(INT2PTR(mpz_t *, SvIV(SvRV(d)))));

     mpz_clear(n_copy);
     mpz_clear(n2_copy);
     mpz_clear(add);     
  
}

SV * Rmpz_out_str(SV * p, SV * base) {
     return newSVuv(mpz_out_str(NULL, SvUV(base), *(INT2PTR(mpz_t *, SvIV(SvRV(p))))));
}

SV * Rmpz_inp_str(SV * p, SV * base) {
     return newSVuv(mpz_inp_str(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))), NULL, SvUV(base)));
}

void eratosthenes(SV * x_arg) {
Inline_Stack_Vars;

unsigned short *v, set[16] = {65534,65533,65531,65527,65519,65503,65471,65407,65279,65023,64511,63487,61439,57343,49151,32767};
unsigned long leap, i, size, b, imax, k, x = SvUV(x_arg);

if(x & 1) croak("max_num argument must be even in eratosthenes function");

imax = sqrt(x - 1) / 2;

b = (x + 1) / 2;

if(!(b % 16)) size = b / 16;
else size = (b / 16) + 1;

Newz(2, v, size, unsigned short);
if(v == NULL) croak("2: Unable to allocate memory in eratosthenes function");

for(i = 1; i < size; ++i) v[i] = 65535;
v[0] = 65534;

for(i = 0; i <= imax; ++i) {
    
    if(v[i / 16] & (1 << (i % 16))) {
       leap = (2 * i) + 1;
       k = 2 * i * (i + 1);
       while(k < b) {
             v[k / 16] &= set[k % 16];
             k += leap;
             }
       }
}

size = 1;
Inline_Stack_Reset;
Inline_Stack_Push(sv_2mortal(newSVuv(2)));

for(i = 0; i < b; ++i) {
    if(v[i / 16] & (1 << (i % 16))) {
      Inline_Stack_Push(sv_2mortal(newSVuv(2 * i + 1)));
      ++size;
      }
   }

Safefree(v);

Inline_Stack_Done;
Inline_Stack_Return(size);

}


int trial_div_ul(SV * num, SV * x_arg) {

unsigned short *v, set[16] = {65534,65533,65531,65527,65519,65503,65471,65407,65279,65023,64511,63487,61439,57343,49151,32767};
unsigned long leap, i, size, b, imax, k, x = SvUV(x_arg);

if(x & 1) croak("Second argument supplied to trial_div_ul() must be even");

imax = sqrt(x - 1) / 2;

b = (x + 1) / 2;

if(!(b % 16)) size = b / 16;
else size = (b / 16) + 1;

Newz(2, v, size, unsigned short);
if(v == NULL) croak("2: Unable to allocate memory in trial_div_ul() function");

for(i = 1; i < size; ++i) v[i] = 65535;
v[0] = 65534;

for(i = 0; i <= imax; ++i) {
    
    if(v[i / 16] & (1 << (i % 16))) {
       leap = (2 * i) + 1;
       k = 2 * i * (i + 1);
       while(k < b) {
             v[k / 16] &= set[k % 16];
             k += leap;
             }
       }
}

if(mpz_divisible_ui_p(*(INT2PTR(mpz_t *, SvIV(SvRV(num)))), 2)) {
   Safefree(v);
   return 2;
   }

for(i = 0; i < b; ++i) {
    if(v[i / 16] & (1 << (i % 16))) {
      if(mpz_divisible_ui_p(*(INT2PTR(mpz_t *, SvIV(SvRV(num)))), 2 * i + 1)) {
         Safefree(v);
         return (2 * i + 1);
         }
      }
   }

Safefree(v);

return 1;

}

void Rflipbit(SV * flipped, SV * orig) {
     int i, len;

     mpz_set_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(flipped)))), 0);
     len = mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(orig)))), 2);

     for(i = 0; i < len; ++i) {
        if(!mpz_tstbit(*(INT2PTR(mpz_t *, SvIV(SvRV(orig)))), i)) mpz_setbit(*(INT2PTR(mpz_t *, SvIV(SvRV(flipped)))), i);
        }
     }

void Rmpz_urandomb(SV * p, ...) {
     Inline_Stack_Vars;
     unsigned long q, i, thingies;

     thingies = Inline_Stack_Items;
     q = SvUV(Inline_Stack_Item(thingies - 1)); 

     if((q + 3) != thingies) croak ("Wrong args supplied to mpz_urandomb function");

     for(i = 0; i < q; ++i) {
        mpz_urandomb(*(INT2PTR(mpz_t *, SvIV(SvRV(Inline_Stack_Item(i))))), *(INT2PTR(gmp_randstate_t *, SvIV(SvRV(Inline_Stack_Item(thingies - 3))))), SvUV(Inline_Stack_Item(thingies - 2)));
        }

     Inline_Stack_Void;
}

void Rmpz_urandomm(SV * x, ...){
     Inline_Stack_Vars;
     unsigned long q, i, thingies;

     thingies = Inline_Stack_Items;
     q = SvUV(Inline_Stack_Item(thingies - 1)); 

     if((q + 3) != thingies) croak ("Wrong args supplied to mpz_urandomm function"); 

     for(i = 0; i < q; ++i) {
        mpz_urandomm(*(INT2PTR(mpz_t *, SvIV(SvRV(Inline_Stack_Item(i))))), *(INT2PTR(gmp_randstate_t *, SvIV(SvRV(Inline_Stack_Item(thingies - 3))))), *(INT2PTR(mpz_t *, SvIV(SvRV(Inline_Stack_Item(thingies - 2))))));
        }
     
     Inline_Stack_Void;
}

void Rmpz_rrandomb(SV * x, ...) {
     Inline_Stack_Vars;
     unsigned long q, i, thingies;

     thingies = Inline_Stack_Items;
     q = SvUV(Inline_Stack_Item(thingies - 1)); 

     if((q + 3) != thingies) croak ("Wrong args supplied to mpz_rrandomb function"); 

     for(i = 0; i < q; ++i) {
        mpz_rrandomb(*(INT2PTR(mpz_t *, SvIV(SvRV(Inline_Stack_Item(i))))), *(INT2PTR(gmp_randstate_t *, SvIV(SvRV(Inline_Stack_Item(thingies - 3))))), SvUV(Inline_Stack_Item(thingies - 2)));
        }

     Inline_Stack_Void;
}

SV * rand_init(SV * seed) {
     gmp_randstate_t * state;
     SV * obj_ref, * obj;

     New(1, state, 1, gmp_randstate_t);
     if(state == NULL) croak("Failed to allocate memory in rand_init function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, NULL);
     gmp_randinit_default(*state);
     gmp_randseed(*state, *(INT2PTR(mpz_t *, SvIV(SvRV(seed)))));
     sv_setiv(obj, INT2PTR(IV, state));
     SvREADONLY_on(obj);
     return obj_ref;
     }

void rand_clear(SV * p) {
     gmp_randclear(*(INT2PTR(gmp_randstate_t *, SvIV(SvRV(p)))));
     Safefree(INT2PTR(gmp_randstate_t *, SvIV(SvRV(p))));
     }

SV * overload_mul(SV * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_mul function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak(" Invalid string supplied to Math::GMPz::overload_mul");
       mpz_mul(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }
#else

     if(SvUOK(b)) {
       mpz_mul_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       mpz_mul_si(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
       mpz_set_d(*mpz_t_obj, SvNV(b));
       mpz_mul(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak(" Invalid string supplied to Math::GMPz::overload_mul");
       mpz_mul(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_mul(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_mul");
}

SV * overload_mul_eq(SV * a, SV * b, SV * third) {
     mpz_t t;

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);      
         croak(" Invalid string supplied to Math::GMPz::overload_mul_eq");
         }
       mpz_mul(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_mul_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       mpz_mul_si(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       return a;
       }
#endif

     if(SvNOK(b)) {
       mpz_init_set_d(t, SvNV(b));
       mpz_mul(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);      
         croak(" Invalid string supplied to Math::GMPz::overload_mul_eq");
         }
       mpz_mul(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_mul(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_mul_eq");
}

SV * overload_add(SV * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_add function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak(" Invalid string supplied to Math::GMPz::overload_add");
       mpz_add(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       mpz_add_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpz_add_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
         return obj_ref;
         }
       mpz_sub_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
       mpz_set_d(*mpz_t_obj, SvNV(b));
       mpz_add(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak(" Invalid string supplied to Math::GMPz::overload_add");
       mpz_add(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_add(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_add function");

}

SV * overload_add_eq(SV * a, SV * b, SV * third) {
     mpz_t t;

     SvREFCNT_inc(a);



#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_add_eq");
         }
       mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
         return a;
         }
       mpz_sub_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       return a;
       }
#endif

     if(SvNOK(b)) {
       mpz_init_set_d(t, SvNV(b));
       mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_add_eq");
         }
       mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }


     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_add(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_add_eq function");

}

SV * overload_sub(SV * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_sub function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);


#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak(" Invalid string supplied to Math::GMPz::overload_sub");
       if(third == &PL_sv_yes) mpz_sub(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
       else mpz_sub(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       if(third == &PL_sv_yes) {
         mpz_ui_sub(*mpz_t_obj, SvUV(b), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
         return obj_ref;
         }
       mpz_sub_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         if(third == &PL_sv_yes) {
           mpz_ui_sub(*mpz_t_obj, SvIV(b), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
           return obj_ref;
           }
         mpz_sub_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
         return obj_ref;
         }
       mpz_add_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       if(third == &PL_sv_yes) mpz_neg(*mpz_t_obj, *mpz_t_obj);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
       mpz_set_d(*mpz_t_obj, SvNV(b));
       if(third == &PL_sv_yes) mpz_sub(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
       else mpz_sub(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak(" Invalid string supplied to Math::GMPz::overload_sub");
       if(third == &PL_sv_yes) mpz_sub(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
       else mpz_sub(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_sub(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_sub function");

}

SV * overload_sub_eq(SV * a, SV * b, SV * third) {
     mpz_t t;

     SvREFCNT_inc(a);


#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_sub_eq");
         }
       mpz_sub(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_sub_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpz_sub_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
         return a;
         }
       mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       return a;
       }
#endif

     if(SvNOK(b)) {
       mpz_init_set_d(t, SvNV(b));
       mpz_sub(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_sub_eq");
         }
       mpz_sub(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_sub(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_sub_eq function");

}

SV * overload_div(SV * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_div function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);



#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
          croak(" Invalid string supplied to Math::GMPz::overload_div");
       if(third == &PL_sv_yes) mpz_tdiv_q(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
       else mpz_tdiv_q(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       if(third == &PL_sv_yes) {
         mpz_set_ui(*mpz_t_obj, SvUV(b));
         mpz_tdiv_q(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
         return obj_ref;
         }
       mpz_tdiv_q_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         if(third == &PL_sv_yes) {
           mpz_set_si(*mpz_t_obj, SvIV(b));
           mpz_tdiv_q(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
           return obj_ref;
           }
         mpz_tdiv_q_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
         return obj_ref;
         }
       if(third == &PL_sv_yes) {
         mpz_set_si(*mpz_t_obj, SvIV(b));
         mpz_tdiv_q(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
         return obj_ref;
         }
       mpz_tdiv_q_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       mpz_neg(*mpz_t_obj, *mpz_t_obj);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
       mpz_set_d(*mpz_t_obj, SvNV(b));
       if(third == &PL_sv_yes) mpz_tdiv_q(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
       else mpz_tdiv_q(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
          croak(" Invalid string supplied to Math::GMPz::overload_div");
       if(third == &PL_sv_yes) mpz_tdiv_q(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
       else mpz_tdiv_q(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_tdiv_q(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_div function");

}

SV * overload_div_eq(SV * a, SV * b, SV * third) {
     mpz_t t;

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_div_eq");
         }
       mpz_tdiv_q(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_tdiv_q_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpz_tdiv_q_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
         return a;
         }
       mpz_tdiv_q_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       mpz_neg(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));
       return a;
       }
#endif

     if(SvNOK(b)) {
       mpz_init_set_d(t, SvNV(b));
       mpz_tdiv_q(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_div_eq");
         }
       mpz_tdiv_q(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_tdiv_q(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_div_eq function");

}

SV * overload_mod (SV * a, SV * b, SV * third) {
     mpz_t *mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_mod function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
          croak(" Invalid string supplied to Math::GMPz::overload_mod");
       if(third == &PL_sv_yes) {
         mpz_mod(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));  
         return obj_ref;   
         }
       mpz_mod(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);  
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       if(third == &PL_sv_yes) {
         mpz_set_ui(*mpz_t_obj, SvUV(b));
         mpz_mod(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));  
         return obj_ref;       
         }
       mpz_mod_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       mpz_set_si(*mpz_t_obj, SvIV(b));
       if(third == &PL_sv_yes) {
         mpz_mod(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));  
         return obj_ref;   
         }
       mpz_mod(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);  
       return obj_ref;
       } 
#endif  

     if(SvNOK(b)) {
       mpz_set_d(*mpz_t_obj, SvNV(b));
       if(third == &PL_sv_yes) {
         mpz_mod(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));  
         return obj_ref;   
         }
       mpz_mod(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);  
       return obj_ref;   
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
          croak(" Invalid string supplied to Math::GMPz::overload_mod");
       if(third == &PL_sv_yes) {
         mpz_mod(*mpz_t_obj, *mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))));  
         return obj_ref;   
         }
       mpz_mod(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);  
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_mod(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_mod function");
}

SV * overload_mod_eq(SV * a, SV * b, SV * third) {
     mpz_t t;

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_mod_eq");
         }
       mpz_mod(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_mod_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) > 0) {
         mpz_mod_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
         return a;
         }
       mpz_init_set_si(t, SvNV(b));
       mpz_mod(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#endif

     if(SvNOK(b)) {
       mpz_init_set_d(t, SvNV(b));
       mpz_mod(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_mod_eq");
         }
       mpz_mod(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_mod(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_mod_eq");
}

SV * get_refcnt(SV * s) {
     return newSVuv(SvREFCNT(s));
}

SV * overload_string(SV * p, SV * second, SV * third) {
     char * out;
     SV * outsv;

     New(2, out, mpz_sizeinbase(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))), 10) + 3, char);
     if(out == NULL) croak("Failed to allocate memory in overload_string function");

     mpz_get_str(out, 10, *(INT2PTR(mpz_t *, SvIV(SvRV(p)))));
     outsv = newSVpv(out, 0);
     Safefree(out);
     return outsv;
}

SV * overload_inc(SV * p, SV * second, SV * third) {
     SvREFCNT_inc(p);
     mpz_add_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))), *(INT2PTR(mpz_t *, SvIV(SvRV(p)))), 1);
     return p;
}

SV * overload_dec(SV * p, SV * second, SV * third) {
     SvREFCNT_inc(p);
     mpz_sub_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))), *(INT2PTR(mpz_t *, SvIV(SvRV(p)))), 1);
     return p;
}

SV * overload_copy(SV * p, SV * second, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_copy function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");

     mpz_init_set(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(p)))));
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_abs(SV * p, SV * second, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_abs function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);

     mpz_abs(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(p)))));
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_lshift(SV * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_lshift function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);

     if(SvUOK(b)) {
       mpz_mul_2exp(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
       SvREADONLY_on(obj);
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) < 0) croak("Invalid argument supplied to Math::GMPz::overload_lshift");
       mpz_mul_2exp(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
       SvREADONLY_on(obj);
       return obj_ref;
       }

     croak("Invalid argument supplied to Math::GMPz::overload_lshift");
}

SV * overload_lshift_eq(SV * a, SV * b, SV * third) {

     SvREFCNT_inc(a);

     if(SvUOK(b)) {
       mpz_mul_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) < 0) croak("Invalid argument supplied to Math::GMPz::overload_lshift_eq");
       mpz_mul_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       return a;
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_lshift_eq");
}

SV * overload_rshift(SV * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_rshift function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);

     if(SvUOK(b)) {
       mpz_tdiv_q_2exp(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
       SvREADONLY_on(obj);
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) < 0) croak("Invalid argument supplied to Math::GMPz::overload_rshift");
       mpz_tdiv_q_2exp(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
       SvREADONLY_on(obj);
       return obj_ref;
       }

     croak("Invalid argument supplied to Math::GMPz::overload_rshift");
}

SV * overload_rshift_eq(SV * a, SV * b, SV * third) {

     SvREFCNT_inc(a);

     if(SvUOK(b)) {
       mpz_tdiv_q_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) < 0) croak("Invalid argument supplied to Math::GMPz::overload_rshift_eq");
       mpz_tdiv_q_2exp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       return a;
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_rshift_eq");
}

SV * overload_pow(SV * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     if(third == &PL_sv_yes) croak("Invalid argument supplied to Math::GMPz::overload_pow function");

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_pow function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

     if(SvUOK(b)) {
       mpz_pow_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) < 0) croak("Invalid argument supplied to Math::GMPz::overload_pow");
       mpz_pow_ui(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return obj_ref;
       }

     croak("Invalid argument supplied to Math::GMPz::overload_pow");
}

SV * overload_pow_eq(SV * a, SV * b, SV * third) {
     SvREFCNT_inc(a);

     if(SvUOK(b)) {
       mpz_pow_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) < 0) croak("Invalid argument supplied to Math::GMPz::overload_pow_eq");
       mpz_pow_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_pow_eq");
}

SV * overload_sqrt(SV * p, SV * second, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_sqrt function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);

     if(mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(p)))), 0) < 0) croak("Negative value supplied as argument supplied to overload_sqrt");
     mpz_sqrt(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(p)))));
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_and(SV * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_and function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_and");
       mpz_and(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       mpz_set_ui(*mpz_t_obj, SvUV(b));
       mpz_and(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(SvIOK(b)) {
       mpz_set_si(*mpz_t_obj, SvIV(b));
       mpz_and(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }
#endif


     if(SvNOK(b)) {
       mpz_set_d(*mpz_t_obj, SvNV(b));
       mpz_and(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_and");
       mpz_and(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_and(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_and");
}

SV * overload_and_eq(SV * a, SV * b, SV * third) {
     mpz_t t;

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_and_eq");
         }
       mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_init_set_ui(t, SvUV(b));
       mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvIOK(b)) {
       mpz_init_set_si(t, SvIV(b));
       mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#endif

     if(SvNOK(b)) {
       mpz_init_set_d(t, SvNV(b));
       mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_and_eq");
         }
       mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_and(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_and_eq");
}

SV * overload_ior(SV * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_ior function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_ior");
       mpz_ior(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       mpz_set_ui(*mpz_t_obj, SvUV(b));
       mpz_ior(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(SvIOK(b)) {
       mpz_set_si(*mpz_t_obj, SvIV(b));
       mpz_ior(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
       mpz_set_d(*mpz_t_obj, SvNV(b));
       mpz_ior(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_ior");
       mpz_ior(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_ior(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_ior");
}

SV * overload_ior_eq(SV * a, SV * b, SV * third) {
     mpz_t t;

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_ior_eq");
         }
       mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_init_set_ui(t, SvUV(b));
       mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvIOK(b)) {
       mpz_init_set_si(t, SvIV(b));
       mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#endif

     if(SvNOK(b)) {
       mpz_init_set_d(t, SvNV(b));
       mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_ior_eq");
         }
       mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_ior(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_ior_eq");
}

SV * overload_xor(SV * a, SV * b, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_xor function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_xor");
       mpz_xor(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       mpz_set_ui(*mpz_t_obj, SvUV(b));
       mpz_xor(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(SvIOK(b)) {
       mpz_set_si(*mpz_t_obj, SvIV(b));
       mpz_xor(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
       mpz_set_d(*mpz_t_obj, SvNV(b));
       mpz_xor(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpz_set_str(*mpz_t_obj, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_xor");
       mpz_xor(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *mpz_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_xor(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_xor");
}

SV * overload_xor_eq(SV * a, SV * b, SV * third) {
     mpz_t t;

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_xor_eq");
         }
       mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpz_init_set_ui(t, SvUV(b));
       mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvIOK(b)) {
       mpz_init_set_si(t, SvIV(b));
       mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }
#endif

     if(SvNOK(b)) {
       mpz_init_set_d(t, SvNV(b));
       mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPz::overload_xor_eq");
         }
       mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       return a;
       }


     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         mpz_xor(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPz::overload_xor_eq");
}

SV * overload_com(SV * p, SV * second, SV * third) {
     mpz_t * mpz_t_obj;
     SV * obj_ref, * obj;

     New(1, mpz_t_obj, 1, mpz_t);
     if(mpz_t_obj == NULL) croak("Failed to allocate memory in overload_com function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPz");
     mpz_init(*mpz_t_obj);

     mpz_com(*mpz_t_obj, *(INT2PTR(mpz_t *, SvIV(SvRV(p)))));
     sv_setiv(obj, INT2PTR(IV, mpz_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_gt(SV * a, SV * b, SV * third) {
     int ret;
     mpz_t t;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_gt");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
     if(SvIOK(b)) {
       ret = mpz_cmp_si(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       ret = mpz_cmp_d(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvNV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_gt");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         if(ret > 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_gt");
}

SV * overload_gte(SV * a, SV * b, SV * third) {
     int ret;
     mpz_t t;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_gte");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpz_cmp_si(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       ret = mpz_cmp_d(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvNV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_gte");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         if(ret >= 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_gte");
}

SV * overload_lt(SV * a, SV * b, SV * third) {
     int ret;
     mpz_t t;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_lt");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpz_cmp_si(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       ret = mpz_cmp_d(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvNV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_lt");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         if(ret < 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_lt");
}

SV * overload_lte(SV * a, SV * b, SV * third) {
     int ret;
     mpz_t t;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_lte");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpz_cmp_si(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       ret = mpz_cmp_d(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvNV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_lte");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         if(ret <= 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_lte");
}

SV * overload_spaceship(SV * a, SV * b, SV * third) {
     int ret;
     mpz_t t;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_spaceship");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       return newSViv(ret);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       return newSViv(ret);
       }

     if(SvIOK(b)) {
       ret = mpz_cmp_si(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       return newSViv(ret);
       }
#endif

     if(SvNOK(b)) {
       ret = mpz_cmp_d(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvNV(b));
       if(third == &PL_sv_yes) ret *= -1;
       return newSViv(ret);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_spaceship");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       return newSViv(ret);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return newSViv(ret);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_spaceship");
}

SV * overload_equiv(SV * a, SV * b, SV * third) {
     int ret;
     mpz_t t;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_equiv");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpz_cmp_si(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       ret = mpz_cmp_d(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvNV(b));
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_equiv");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         if(ret == 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_equiv");
}

SV * overload_not_equiv(SV * a, SV * b, SV * third) {
     int ret;
     mpz_t t;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_not_equiv");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpz_cmp_si(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       ret = mpz_cmp_d(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), SvNV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpz_init_set_str(t, SvPV_nolen(b), 0))
         croak("Invalid string supplied to Math::GMPz::overload_not_equiv");
       ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), t);
       mpz_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz")) {
         ret = mpz_cmp(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         if(ret != 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPz::overload_not_equiv");
}

SV * overload_not(SV * a, SV * second, SV * third) {
     if(mpz_cmp_ui(*(INT2PTR(mpz_t *, SvIV(SvRV(a)))), 0)) return newSViv(0);
     return newSViv(1);
}

SV * gmp_v() {
     return newSVpv(gmp_version, 0);
}

void wrap_gmp_printf(SV * a, SV * b) {
     if(sv_isobject(b)) { 
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz") ||
          strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMP") ||
          strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpz"))
          gmp_printf(SvPV_nolen(a), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
       else {
         if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPq") ||
            strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpq"))
            gmp_printf(SvPV_nolen(a), *(INT2PTR(mpq_t *, SvIV(SvRV(b)))));
         else {
           if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf") ||
              strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpf"))
              gmp_printf(SvPV_nolen(a), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
              else croak("Unrecognised object supplied as argument to Rmpz_printf");
           }
         }
       } 

     else {
       if(SvUOK(b)) gmp_printf(SvPV_nolen(a), SvUV(b));
       else {
         if(SvIOK(b)) gmp_printf(SvPV_nolen(a), SvIV(b)); 
         else {
           if(SvNOK(b)) gmp_printf(SvPV_nolen(a), SvNV(b)); 
           else {
             if(SvPOK(b)) gmp_printf(SvPV_nolen(a), SvPV_nolen(b));
             else croak("Unrecognised type supplied as argument to Rmpz_printf");
             }
           } 
         }
       }
}

SV * eratosthenes_string(SV * x_arg) {

unsigned char *v, set[8] = {254,253,251,247,239,223,191,127};
unsigned long leap, i, size, b, imax, k, x = (unsigned long)SvUV(x_arg);
SV * ret;

if(x & 1) croak("max_num argument must be even in eratosthenes_string()");

imax = sqrt(x - 1) / 2;

b = (x + 1) / 2;

if(!(b % 8)) size = b / 8;
else size = (b / 8) + 1;

ret = NEWSV(0, size);

for(i = 1; i < size; ++i) SvPVX(ret)[i] = 255;
SvPVX(ret)[0] = 254;

for(i = 0; i <= imax; ++i) {
    
    if(SvPVX(ret)[i / 8] & (1 << (i % 8))) {
       leap = (2 * i) + 1;
       k = 2 * i * (i + 1);
       while(k < b) {
             SvPVX(ret)[k / 8] &= set[k % 8];
             k += leap;
             }
       }
}

SvPOK_on(ret);
SvCUR_set(ret, size);
*SvEND(ret) = 0;

return ret;

}

// Next 2 functions became available with GMP-4.2

void Rmpz_rootrem(SV * root, SV * rem, SV * u, SV * d) { 
     mpz_rootrem(*(INT2PTR(mpz_t *, SvIV(SvRV(root)))), *(INT2PTR(mpz_t *, SvIV(SvRV(rem)))), *(INT2PTR(mpz_t *, SvIV(SvRV(u)))), (unsigned long)SvUV(d));
}

void Rmpz_combit(SV * num, SV * bitpos) {
     mpz_combit(*(INT2PTR(mpz_t *, SvIV(SvRV(num)))), (unsigned long)SvUV(bitpos));
}

SV * _itsa(SV * a) {
     if(SvUOK(a)) return newSVuv(1);
     if(SvIOK(a)) return newSVuv(2);
     if(SvNOK(a)) return newSVuv(3);
     if(SvPOK(a)) return newSVuv(4);
     if(sv_isobject(a)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(a))), "Math::GMPz")) return newSVuv(5);
       }
     return newSVuv(0);
}

MODULE = Math::GMPz	PACKAGE = Math::GMPz	

PROTOTYPES: DISABLE


SV *
Rmpz_init_set_str_nobless (num, base)
	SV *	num
	SV *	base

SV *
Rmpz_init2_nobless (bits)
	SV *	bits

SV *
Rmpz_init_nobless ()

SV *
Rmpz_init_set_nobless (p)
	SV *	p

SV *
Rmpz_init_set_ui_nobless (p)
	SV *	p

SV *
Rmpz_init_set_si_nobless (p)
	SV *	p

SV *
Rmpz_init_set_d_nobless (p)
	SV *	p

SV *
Rmpz_init ()

SV *
Rmpz_init_set (p)
	SV *	p

SV *
Rmpz_init_set_ui (p)
	SV *	p

SV *
Rmpz_init_set_si (p)
	SV *	p

SV *
Rmpz_init_set_d (p)
	SV *	p

SV *
Rmpz_init_set_str (num, base)
	SV *	num
	SV *	base

SV *
Rmpz_init2 (bits)
	SV *	bits

SV *
Rmpz_get_str (p, base)
	SV *	p
	SV *	base

void
DESTROY (p)
	SV *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	DESTROY(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_clear (p)
	SV *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_clear(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_clear_mpz (p)
	SV *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_clear_mpz(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_clear_ptr (p)
	SV *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_clear_ptr(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_realloc2 (integer, bits)
	SV *	integer
	SV *	bits
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_realloc2(integer, bits);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set (copy, original)
	SV *	copy
	SV *	original
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set(copy, original);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set_q (copy, original)
	SV *	copy
	SV *	original
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set_q(copy, original);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set_f (copy, original)
	SV *	copy
	SV *	original
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set_f(copy, original);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set_si (copy, original)
	SV *	copy
	SV *	original
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set_si(copy, original);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set_ui (copy, original)
	SV *	copy
	SV *	original
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set_ui(copy, original);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set_d (copy, original)
	SV *	copy
	SV *	original
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set_d(copy, original);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_set_str (copy, original, base)
	SV *	copy
	SV *	original
	SV *	base
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_set_str(copy, original, base);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_swap (a, b)
	SV *	a
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_swap(a, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_get_ui (n)
	SV *	n

SV *
Rmpz_get_si (n)
	SV *	n

SV *
Rmpz_get_d (n)
	SV *	n

void
Rmpz_get_d_2exp (n)
	SV *	n
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_get_d_2exp(n);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_getlimbn (p, n)
	SV *	p
	SV *	n

void
Rmpz_add (dest, src1, src2)
	SV *	dest
	SV *	src1
	SV *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_add(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_add_ui (dest, src, num)
	SV *	dest
	SV *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_add_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_sub (dest, src1, src2)
	SV *	dest
	SV *	src1
	SV *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_sub(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_sub_ui (dest, src, num)
	SV *	dest
	SV *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_sub_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_ui_sub (dest, num, src)
	SV *	dest
	SV *	num
	SV *	src
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_ui_sub(dest, num, src);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_mul (dest, src1, src2)
	SV *	dest
	SV *	src1
	SV *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_mul(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_mul_si (dest, src, num)
	SV *	dest
	SV *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_mul_si(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_mul_ui (dest, src, num)
	SV *	dest
	SV *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_mul_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_addmul (dest, src1, src2)
	SV *	dest
	SV *	src1
	SV *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_addmul(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_addmul_ui (dest, src, num)
	SV *	dest
	SV *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_addmul_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_submul (dest, src1, src2)
	SV *	dest
	SV *	src1
	SV *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_submul(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_submul_ui (dest, src, num)
	SV *	dest
	SV *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_submul_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_mul_2exp (dest, src1, b)
	SV *	dest
	SV *	src1
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_mul_2exp(dest, src1, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_neg (dest, src)
	SV *	dest
	SV *	src
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_neg(dest, src);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_abs (dest, src)
	SV *	dest
	SV *	src
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_abs(dest, src);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_cdiv_q (q, n, d)
	SV *	q
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_cdiv_q(q, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_cdiv_r (mod, n, d)
	SV *	mod
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_cdiv_r(mod, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_cdiv_qr (q, r, n, d)
	SV *	q
	SV *	r
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_cdiv_qr(q, r, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_cdiv_q_ui (q, n, d)
	SV *	q
	SV *	n
	SV *	d

SV *
Rmpz_cdiv_r_ui (q, n, d)
	SV *	q
	SV *	n
	SV *	d

SV *
Rmpz_cdiv_qr_ui (q, r, n, d)
	SV *	q
	SV *	r
	SV *	n
	SV *	d

int
Rmpz_cdiv_ui (n, d)
	SV *	n
	SV *	d

void
Rmpz_cdiv_q_2exp (q, n, b)
	SV *	q
	SV *	n
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_cdiv_q_2exp(q, n, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_cdiv_r_2exp (r, n, b)
	SV *	r
	SV *	n
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_cdiv_r_2exp(r, n, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_fdiv_q (q, n, d)
	SV *	q
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fdiv_q(q, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_fdiv_r (mod, n, d)
	SV *	mod
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fdiv_r(mod, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_fdiv_qr (q, r, n, d)
	SV *	q
	SV *	r
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fdiv_qr(q, r, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_fdiv_q_ui (q, n, d)
	SV *	q
	SV *	n
	SV *	d

SV *
Rmpz_fdiv_r_ui (q, n, d)
	SV *	q
	SV *	n
	SV *	d

SV *
Rmpz_fdiv_qr_ui (q, r, n, d)
	SV *	q
	SV *	r
	SV *	n
	SV *	d

int
Rmpz_fdiv_ui (n, d)
	SV *	n
	SV *	d

void
Rmpz_fdiv_q_2exp (q, n, b)
	SV *	q
	SV *	n
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fdiv_q_2exp(q, n, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_fdiv_r_2exp (r, n, b)
	SV *	r
	SV *	n
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fdiv_r_2exp(r, n, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_tdiv_q (q, n, d)
	SV *	q
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_tdiv_q(q, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_tdiv_r (mod, n, d)
	SV *	mod
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_tdiv_r(mod, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_tdiv_qr (q, r, n, d)
	SV *	q
	SV *	r
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_tdiv_qr(q, r, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_tdiv_q_ui (q, n, d)
	SV *	q
	SV *	n
	SV *	d

SV *
Rmpz_tdiv_r_ui (q, n, d)
	SV *	q
	SV *	n
	SV *	d

SV *
Rmpz_tdiv_qr_ui (q, r, n, d)
	SV *	q
	SV *	r
	SV *	n
	SV *	d

int
Rmpz_tdiv_ui (n, d)
	SV *	n
	SV *	d

void
Rmpz_tdiv_q_2exp (q, n, b)
	SV *	q
	SV *	n
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_tdiv_q_2exp(q, n, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_tdiv_r_2exp (r, n, b)
	SV *	r
	SV *	n
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_tdiv_r_2exp(r, n, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_mod (r, n, d)
	SV *	r
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_mod(r, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_mod_ui (r, n, d)
	SV *	r
	SV *	n
	SV *	d

void
Rmpz_divexact (dest, n, d)
	SV *	dest
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_divexact(dest, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_divexact_ui (dest, n, d)
	SV *	dest
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_divexact_ui(dest, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmpz_divisible_p (n, d)
	SV *	n
	SV *	d

int
Rmpz_divisible_ui_p (n, d)
	SV *	n
	SV *	d

int
Rmpz_divisible_2exp_p (n, b)
	SV *	n
	SV *	b

SV *
Rmpz_congruent_p (n, c, d)
	SV *	n
	SV *	c
	SV *	d

SV *
Rmpz_congruent_ui_p (n, c, d)
	SV *	n
	SV *	c
	SV *	d

SV *
Rmpz_congruent_2exp_p (n, c, d)
	SV *	n
	SV *	c
	SV *	d

void
Rmpz_powm (dest, base, exp, mod)
	SV *	dest
	SV *	base
	SV *	exp
	SV *	mod
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_powm(dest, base, exp, mod);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_powm_ui (dest, base, exp, mod)
	SV *	dest
	SV *	base
	SV *	exp
	SV *	mod
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_powm_ui(dest, base, exp, mod);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_pow_ui (dest, base, exp)
	SV *	dest
	SV *	base
	SV *	exp
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_pow_ui(dest, base, exp);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_ui_pow_ui (dest, base, exp)
	SV *	dest
	SV *	base
	SV *	exp
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_ui_pow_ui(dest, base, exp);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_root (r, n, d)
	SV *	r
	SV *	n
	SV *	d

void
Rmpz_sqrt (r, n)
	SV *	r
	SV *	n
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_sqrt(r, n);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_sqrtrem (root, rem, src)
	SV *	root
	SV *	rem
	SV *	src
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_sqrtrem(root, rem, src);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmpz_perfect_power_p (in)
	SV *	in

int
Rmpz_perfect_square_p (in)
	SV *	in

int
Rmpz_probab_prime_p (cand, reps)
	SV *	cand
	SV *	reps

void
Rmpz_nextprime (prime, init)
	SV *	prime
	SV *	init
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_nextprime(prime, init);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_gcd (gcd, src1, src2)
	SV *	gcd
	SV *	src1
	SV *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_gcd(gcd, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_gcd_ui (gcd, n, d)
	SV *	gcd
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_gcd_ui(gcd, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_gcdext (g, s, t, a, b)
	SV *	g
	SV *	s
	SV *	t
	SV *	a
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_gcdext(g, s, t, a, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_lcm (lcm, src1, src2)
	SV *	lcm
	SV *	src1
	SV *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_lcm(lcm, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_lcm_ui (lcm, src1, src2)
	SV *	lcm
	SV *	src1
	SV *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_lcm_ui(lcm, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmpz_invert (inv, src1, src2)
	SV *	inv
	SV *	src1
	SV *	src2

int
Rmpz_jacobi (a, b)
	SV *	a
	SV *	b

int
Rmpz_legendre (a, b)
	SV *	a
	SV *	b

int
Rmpz_kronecker (a, b)
	SV *	a
	SV *	b

int
Rmpz_kronecker_si (a, b)
	SV *	a
	SV *	b

int
Rmpz_kronecker_ui (a, b)
	SV *	a
	SV *	b

int
Rmpz_si_kronecker (a, b)
	SV *	a
	SV *	b

int
Rmpz_ui_kronecker (a, b)
	SV *	a
	SV *	b

SV *
Rmpz_remove (rem, src1, src2)
	SV *	rem
	SV *	src1
	SV *	src2

void
Rmpz_fac_ui (fac, b)
	SV *	fac
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fac_ui(fac, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_bin_ui (dest, n, d)
	SV *	dest
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_bin_ui(dest, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_bin_uiui (dest, n, d)
	SV *	dest
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_bin_uiui(dest, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_fib_ui (dest, b)
	SV *	dest
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fib_ui(dest, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_fib2_ui (fn, fnsub1, b)
	SV *	fn
	SV *	fnsub1
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_fib2_ui(fn, fnsub1, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_lucnum_ui (dest, b)
	SV *	dest
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_lucnum_ui(dest, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_lucnum2_ui (ln, lnsub1, b)
	SV *	ln
	SV *	lnsub1
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_lucnum2_ui(ln, lnsub1, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmpz_cmp (n, d)
	SV *	n
	SV *	d

int
Rmpz_cmp_d (n, d)
	SV *	n
	SV *	d

int
Rmpz_cmp_si (n, d)
	SV *	n
	SV *	d

int
Rmpz_cmp_ui (n, d)
	SV *	n
	int	d

int
Rmpz_cmpabs (n, d)
	SV *	n
	SV *	d

int
Rmpz_cmpabs_d (n, d)
	SV *	n
	SV *	d

int
Rmpz_cmpabs_ui (n, d)
	SV *	n
	SV *	d

int
Rmpz_sgn (n)
	SV *	n

void
Rmpz_and (dest, src1, src2)
	SV *	dest
	SV *	src1
	SV *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_and(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_ior (dest, src1, src2)
	SV *	dest
	SV *	src1
	SV *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_ior(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_xor (dest, src1, src2)
	SV *	dest
	SV *	src1
	SV *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_xor(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_com (dest, src)
	SV *	dest
	SV *	src
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_com(dest, src);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmpz_popcount (in)
	SV *	in

int
Rmpz_hamdist (dest, src)
	SV *	dest
	SV *	src

int
Rmpz_scan0 (n, start_bit)
	SV *	n
	SV *	start_bit

int
Rmpz_scan1 (n, start_bit)
	SV *	n
	SV *	start_bit

void
Rmpz_setbit (num, bit_index)
	SV *	num
	SV *	bit_index
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_setbit(num, bit_index);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_clrbit (num, bit_index)
	SV *	num
	SV *	bit_index
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_clrbit(num, bit_index);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmpz_tstbit (num, bit_index)
	SV *	num
	SV *	bit_index

void
Rmpz_import (rop, count, order, size, endian, nails, op)
	SV *	rop
	SV *	count
	SV *	order
	SV *	size
	SV *	endian
	SV *	nails
	SV *	op
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_import(rop, count, order, size, endian, nails, op);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_export (order, size, endian, nails, number)
	SV *	order
	SV *	size
	SV *	endian
	SV *	nails
	SV *	number

int
Rmpz_fits_ulong_p (in)
	SV *	in

int
Rmpz_fits_slong_p (in)
	SV *	in

int
Rmpz_fits_uint_p (in)
	SV *	in

int
Rmpz_fits_sint_p (in)
	SV *	in

int
Rmpz_fits_ushort_p (in)
	SV *	in

int
Rmpz_fits_sshort_p (in)
	SV *	in

int
Rmpz_odd_p (in)
	SV *	in

int
Rmpz_even_p (in)
	SV *	in

int
Rmpz_size (in)
	SV *	in

int
Rmpz_sizeinbase (in, base)
	SV *	in
	SV *	base

void
Rsieve_gmp (x_arg, a, number)
	int	x_arg
	int	a
	SV *	number
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rsieve_gmp(x_arg, a, number);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rfermat_gmp (num, base)
	SV *	num
	SV *	base

int
Rrm_gmp (num, base)
	SV *	num
	SV *	base

void
Rprbg_ms (outref, p, q, seed, bits_required)
	SV *	outref
	SV *	p
	SV *	q
	SV *	seed
	int	bits_required
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rprbg_ms(outref, p, q, seed, bits_required);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rprbg_bbs (outref, p, q, seed, bits_required)
	SV *	outref
	SV *	p
	SV *	q
	SV *	seed
	int	bits_required
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rprbg_bbs(outref, p, q, seed, bits_required);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
Rmonobit (bitstream)
	SV *	bitstream

int
Rlong_run (bitstream)
	SV *	bitstream

int
Rruns (bitstream)
	SV *	bitstream

int
Rpoker (bitstream)
	SV *	bitstream

int
Rparity_ul (v)
	unsigned long	v

int
Rparity_gmp (num)
	SV *	num

SV *
Rrotate_left_ul (ulnum, ulb, uls)
	SV *	ulnum
	SV *	ulb
	SV *	uls

void
Rrotate_left_gmp (out, num, bsv, ssv)
	SV *	out
	SV *	num
	SV *	bsv
	SV *	ssv
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rrotate_left_gmp(out, num, bsv, ssv);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rrotate_right_ul (ulnum, ulb, uls)
	SV *	ulnum
	SV *	ulb
	SV *	uls

void
Rrotate_right_gmp (out, num, ulb, uls)
	SV *	out
	SV *	num
	SV *	ulb
	SV *	uls
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rrotate_right_gmp(out, num, ulb, uls);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rrsa_cert (n, d, e, p, q)
	SV *	n
	SV *	d
	SV *	e
	SV *	p
	SV *	q
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rrsa_cert(n, d, e, p, q);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmers_div_q (q, n, d)
	SV *	q
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmers_div_q(q, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmers_div_r (r, n, d)
	SV *	r
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmers_div_r(r, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmers_div_r5 (r, n, d, n_copy, add)
	SV *	r
	SV *	n
	SV *	d
	SV *	n_copy
	SV *	add
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmers_div_r5(r, n, d, n_copy, add);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmers_div_qr (q, r, n, d)
	SV *	q
	SV *	r
	SV *	n
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmers_div_qr(q, r, n, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpz_out_str (p, base)
	SV *	p
	SV *	base

SV *
Rmpz_inp_str (p, base)
	SV *	p
	SV *	base

void
eratosthenes (x_arg)
	SV *	x_arg
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	eratosthenes(x_arg);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
trial_div_ul (num, x_arg)
	SV *	num
	SV *	x_arg

void
Rflipbit (flipped, orig)
	SV *	flipped
	SV *	orig
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rflipbit(flipped, orig);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_urandomb (p, ...)
	SV *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_urandomb(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_urandomm (x, ...)
	SV *	x
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_urandomm(x);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_rrandomb (x, ...)
	SV *	x
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_rrandomb(x);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
rand_init (seed)
	SV *	seed

void
rand_clear (p)
	SV *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	rand_clear(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
overload_mul (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_mul_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_add (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_add_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_sub (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_sub_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_div (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_div_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_mod (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_mod_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
get_refcnt (s)
	SV *	s

SV *
overload_string (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_inc (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_dec (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_copy (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_abs (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_lshift (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_lshift_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_rshift (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_rshift_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_pow (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_pow_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_sqrt (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_and (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_and_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_ior (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_ior_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_xor (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_xor_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_com (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_gt (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_gte (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_lt (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_lte (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_spaceship (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_equiv (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_not_equiv (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_not (a, second, third)
	SV *	a
	SV *	second
	SV *	third

SV *
gmp_v ()

void
wrap_gmp_printf (a, b)
	SV *	a
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	wrap_gmp_printf(a, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
eratosthenes_string (x_arg)
	SV *	x_arg

void
Rmpz_rootrem (root, rem, u, d)
	SV *	root
	SV *	rem
	SV *	u
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_rootrem(root, rem, u, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpz_combit (num, bitpos)
	SV *	num
	SV *	bitpos
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpz_combit(num, bitpos);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
_itsa (a)
	SV *	a

