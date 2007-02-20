    package Math::GMPz;
    use strict;
    require Exporter;
    *import = \&Exporter::import;
    require DynaLoader;

use overload
    '+'    => \&overload_add,
    '-'    => \&overload_sub,
    '*'    => \&overload_mul,
    '/'    => \&overload_div,
    '+='   => \&overload_add_eq,
    '-='   => \&overload_sub_eq,
    '*='   => \&overload_mul_eq,
    '/='   => \&overload_div_eq,
    '%'    => \&overload_mod,
    '%='   => \&overload_mod_eq,
    '<<'   => \&overload_lshift,
    '<<='  => \&overload_lshift_eq,
    '>>'   => \&overload_rshift,
    '>>='  => \&overload_rshift_eq,
    '&'    => \&overload_and,
    '&='   => \&overload_and_eq,
    '|'    => \&overload_ior,
    '|='   => \&overload_ior_eq,
    '^'    => \&overload_xor,
    '^='   => \&overload_xor_eq,
    '~'    => \&overload_com,
    '**'   => \&overload_pow,
    '**='  => \&overload_pow_eq,
    'sqrt' => \&overload_sqrt,
    '""'   => \&overload_string,
    '++'   => \&overload_inc,
    '--'   => \&overload_dec,
    '>'    => \&overload_gt,
    '>='   => \&overload_gte,
    '<'    => \&overload_lt,
    '<='   => \&overload_lte,
    '<=>'  => \&overload_spaceship,
    '=='   => \&overload_equiv,
    '!='   => \&overload_not_equiv,
    '!'    => \&overload_not,
    'not'  => \&overload_not,
    '='    => \&overload_copy,
    'abs'  => \&overload_abs;

    @Math::GMPz::ISA = qw(Exporter DynaLoader);
    @Math::GMPz::EXPORT_OK = qw(
Rmpz_abs Rmpz_add Rmpz_add_ui Rmpz_addmul Rmpz_addmul_ui Rmpz_and Rmpz_bin_ui
Rmpz_bin_uiui Rmpz_cdiv_q Rmpz_cdiv_q_2exp Rmpz_cdiv_q_ui Rmpz_cdiv_qr 
Rmpz_cdiv_qr_ui Rmpz_cdiv_r Rmpz_cdiv_r_2exp Rmpz_cdiv_r_ui Rmpz_cdiv_ui 
Rmpz_clear Rmpz_clrbit Rmpz_cmp Rmpz_cmp_d Rmpz_cmp_si Rmpz_cmp_ui Rmpz_cmpabs
Rmpz_cmpabs_d Rmpz_cmpabs_ui Rmpz_com Rmpz_combit Rmpz_congruent_2exp_p 
Rmpz_congruent_p Rmpz_congruent_ui_p Rmpz_divexact Rmpz_divexact_ui 
Rmpz_divisible_2exp_p Rmpz_divisible_p Rmpz_divisible_ui_p Rmpz_even_p 
Rmpz_export Rmpz_fac_ui Rmpz_fdiv_q Rmpz_fdiv_q_2exp Rmpz_fdiv_q_ui 
Rmpz_fdiv_qr Rmpz_fdiv_qr_ui Rmpz_fdiv_r Rmpz_fdiv_r_2exp Rmpz_fdiv_r_ui 
Rmpz_fdiv_ui Rmpz_fib2_ui Rmpz_fib_ui Rmpz_fits_sint_p Rmpz_fits_slong_p 
Rmpz_fits_sshort_p Rmpz_fits_uint_p Rmpz_fits_ulong_p Rmpz_fits_ushort_p
Rmpz_gcd Rmpz_gcd_ui Rmpz_gcdext Rmpz_get_d_2exp Rmpz_get_si Rmpz_get_str 
Rmpz_get_ui Rmpz_getlimbn Rmpz_hamdist Rmpz_import Rmpz_init Rmpz_init2 
Rmpz_init2_nobless Rmpz_init_nobless Rmpz_init_set Rmpz_init_set_d 
Rmpz_init_set_d_nobless Rmpz_init_set_nobless Rmpz_init_set_si 
Rmpz_init_set_si_nobless Rmpz_init_set_str Rmpz_init_set_str_nobless
Rmpz_init_set_ui Rmpz_init_set_ui_nobless Rmpz_inp_str Rmpz_invert Rmpz_ior 
Rmpz_jacobi Rmpz_kronecker Rmpz_kronecker_si Rmpz_kronecker_ui Rmpz_lcm 
Rmpz_lcm_ui Rmpz_legendre Rmpz_lucnum2_ui Rmpz_lucnum_ui Rmpz_mod Rmpz_mod_ui
Rmpz_mul Rmpz_mul_2exp Rmpz_mul_si Rmpz_mul_ui Rmpz_neg Rmpz_nextprime 
Rmpz_odd_p Rmpz_out_str Rmpz_perfect_power_p Rmpz_perfect_square_p 
Rmpz_popcount Rmpz_pow_ui Rmpz_powm Rmpz_powm_ui Rmpz_printf 
Rmpz_probab_prime_p Rmpz_realloc2 Rmpz_remove Rmpz_root Rmpz_rootrem 
Rmpz_rrandomb Rmpz_scan0 Rmpz_scan1 Rmpz_set Rmpz_set_d Rmpz_set_f Rmpz_set_q
Rmpz_set_si Rmpz_set_str Rmpz_set_ui Rmpz_setbit Rmpz_sgn Rmpz_si_kronecker 
Rmpz_size Rmpz_sizeinbase Rmpz_sqrt Rmpz_sqrtrem Rmpz_sub Rmpz_sub_ui 
Rmpz_submul Rmpz_submul_ui Rmpz_swap Rmpz_tdiv_q Rmpz_tdiv_q_2exp 
Rmpz_tdiv_q_ui Rmpz_tdiv_qr Rmpz_tdiv_qr_ui Rmpz_tdiv_r Rmpz_tdiv_r_2exp
Rmpz_tdiv_r_ui Rmpz_tdiv_ui Rmpz_tstbit Rmpz_ui_kronecker Rmpz_ui_pow_ui 
Rmpz_ui_sub Rmpz_urandomb Rmpz_urandomm Rmpz_xor
rand_init rand_clear
Rfermat_gmp Rflipbit Rgenerator_zp Rlong_run Rmers_div_q Rmers_div_qr Rmers_div_r
Rmonobit Rnext_germaine_prime Rnext_proven Rparity_gmp Rparity_ul Rpi_x Rpoker
Rprbg_bbs Rprbg_ms Rprime_test Rprovable_small Rrm_gmp Rrotate_left_gmp
Rrotate_left_ul Rrotate_right_gmp Rrotate_right_ul Rrsa_cert Rruns Rsieve_gmp
eratosthenes eratosthenes_string merten prime_ratio query_eratosthenes_string
trial_div_ul
    );
    $Math::GMPz::VERSION = '0.20';

    DynaLoader::bootstrap Math::GMPz $Math::GMPz::VERSION;

    %Math::GMPz::EXPORT_TAGS =(mpz => [qw(
Rmpz_abs Rmpz_add Rmpz_add_ui Rmpz_addmul Rmpz_addmul_ui Rmpz_and Rmpz_bin_ui
Rmpz_bin_uiui Rmpz_cdiv_q Rmpz_cdiv_q_2exp Rmpz_cdiv_q_ui Rmpz_cdiv_qr 
Rmpz_cdiv_qr_ui Rmpz_cdiv_r Rmpz_cdiv_r_2exp Rmpz_cdiv_r_ui Rmpz_cdiv_ui 
Rmpz_clear Rmpz_clrbit Rmpz_cmp Rmpz_cmp_d Rmpz_cmp_si Rmpz_cmp_ui Rmpz_cmpabs
Rmpz_cmpabs_d Rmpz_cmpabs_ui Rmpz_com Rmpz_combit Rmpz_congruent_2exp_p 
Rmpz_congruent_p Rmpz_congruent_ui_p Rmpz_divexact Rmpz_divexact_ui 
Rmpz_divisible_2exp_p Rmpz_divisible_p Rmpz_divisible_ui_p Rmpz_even_p 
Rmpz_export Rmpz_fac_ui Rmpz_fdiv_q Rmpz_fdiv_q_2exp Rmpz_fdiv_q_ui 
Rmpz_fdiv_qr Rmpz_fdiv_qr_ui Rmpz_fdiv_r Rmpz_fdiv_r_2exp Rmpz_fdiv_r_ui 
Rmpz_fdiv_ui Rmpz_fib2_ui Rmpz_fib_ui Rmpz_fits_sint_p Rmpz_fits_slong_p 
Rmpz_fits_sshort_p Rmpz_fits_uint_p Rmpz_fits_ulong_p Rmpz_fits_ushort_p
Rmpz_gcd Rmpz_gcd_ui Rmpz_gcdext Rmpz_get_d_2exp Rmpz_get_si Rmpz_get_str 
Rmpz_get_ui Rmpz_getlimbn Rmpz_hamdist Rmpz_import Rmpz_init Rmpz_init2 
Rmpz_init2_nobless Rmpz_init_nobless Rmpz_init_set Rmpz_init_set_d 
Rmpz_init_set_d_nobless Rmpz_init_set_nobless Rmpz_init_set_si 
Rmpz_init_set_si_nobless Rmpz_init_set_str Rmpz_init_set_str_nobless
Rmpz_init_set_ui Rmpz_init_set_ui_nobless Rmpz_inp_str Rmpz_invert Rmpz_ior 
Rmpz_jacobi Rmpz_kronecker Rmpz_kronecker_si Rmpz_kronecker_ui Rmpz_lcm 
Rmpz_lcm_ui Rmpz_legendre Rmpz_lucnum2_ui Rmpz_lucnum_ui Rmpz_mod Rmpz_mod_ui
Rmpz_mul Rmpz_mul_2exp Rmpz_mul_si Rmpz_mul_ui Rmpz_neg Rmpz_nextprime 
Rmpz_odd_p Rmpz_out_str Rmpz_perfect_power_p Rmpz_perfect_square_p 
Rmpz_popcount Rmpz_pow_ui Rmpz_powm Rmpz_powm_ui Rmpz_printf 
Rmpz_probab_prime_p Rmpz_realloc2 Rmpz_remove Rmpz_root Rmpz_rootrem 
Rmpz_rrandomb Rmpz_scan0 Rmpz_scan1 Rmpz_set Rmpz_set_d Rmpz_set_f Rmpz_set_q
Rmpz_set_si Rmpz_set_str Rmpz_set_ui Rmpz_setbit Rmpz_sgn Rmpz_si_kronecker 
Rmpz_size Rmpz_sizeinbase Rmpz_sqrt Rmpz_sqrtrem Rmpz_sub Rmpz_sub_ui 
Rmpz_submul Rmpz_submul_ui Rmpz_swap Rmpz_tdiv_q Rmpz_tdiv_q_2exp 
Rmpz_tdiv_q_ui Rmpz_tdiv_qr Rmpz_tdiv_qr_ui Rmpz_tdiv_r Rmpz_tdiv_r_2exp
Rmpz_tdiv_r_ui Rmpz_tdiv_ui Rmpz_tstbit Rmpz_ui_kronecker Rmpz_ui_pow_ui 
Rmpz_ui_sub Rmpz_urandomb Rmpz_urandomm Rmpz_xor
rand_init rand_clear)],
primes => [qw(Rsieve_gmp Rfermat_gmp Rrm_gmp
eratosthenes eratosthenes_string trial_div_ul Rnext_germaine_prime 
Rprovable_small Rnext_proven query_eratosthenes_string
prime_ratio Rpi_x Rprime_test merten)],
supp => [qw(Rprbg_ms Rprbg_bbs Rmonobit Rlong_run Rruns Rpoker
Rmers_div_q Rmers_div_r Rmers_div_qr Rgenerator_zp Rflipbit
Rparity_gmp Rparity_ul Rrotate_left_ul Rrotate_right_ul Rrotate_left_gmp 
Rrotate_right_gmp Rrsa_cert)]);

sub dl_load_flags {0} # Prevent DynaLoader from complaining and croaking

sub new {
    if(@_ > 3) {die "Too many arguments supplied to new()"}
    my @ret = ();
    if(!@_) {return Rmpz_init()}
    if(ref($_[0]) || $_[0] ne "Math::GMPz") {
      my $type = _itsa($_[0]);

      if(!$type) {die "Inappropriate argument supplied to new()"}

      if($type == 1 || $type == 2) { # UOK or IOK
        if(@_ > 1) {die "Too many arguments supplied to new() - expected only one"}
          return Rmpz_init_set_str($_[0], 10);
      }
      if($type == 3) { # NOK
        if(@_ > 1) {die "Too many arguments supplied to new() - expected only one"}
        return Rmpz_init_set_d($_[0]);
      }
      if($type == 4) { # POK
        if(@_ > 2) {die "Too many arguments supplied to new() - expected no more than two"}
        if(@_ == 2) {return Rmpz_init_set_str($_[0], $_[1])}
        else {return Rmpz_init_set_str($_[0], 0)}
      }
      if($type == 5) { # Math::GMPz object
        if(@_ > 1) {die "Too many arguments supplied to new() - expected only one"}
        return Rmpz_init_set($_[0]);
      }
    }

    if($_[0] ne "Math::GMPz") {die "Invalid argument supplied to new()"} 

    if(@_ == 1) {return Rmpz_init()}

    my $type = _itsa($_[1]);

    if(!$type) {die "Inappropriate argument supplied to new()"}

    if($type == 1 || $type == 2) { # UOK or IOK
      if(@_ > 2) {die "Too many arguments supplied to new() - expected only two"}
      return Rmpz_init_set_str($_[1], 10);
    }
    if($type == 3) { # NOK
      if(@_ > 2) {die "Too many arguments supplied to new() - expected only two"}
      return Rmpz_init_set_d($_[1]);
    }
    if($type == 4) { # POK
      if(@_ == 3) {return Rmpz_init_set_str($_[1], $_[2])}
      else {return Rmpz_init_set_str($_[1], 0)}
    }
    if($type == 5) { # Math::GMPz object
      if(@_ > 2) {die "Too many arguments supplied to new() - expected only two"}
      return Rmpz_init_set($_[1]);
    }
}

sub Rpi_x {
  Rmpz_set_ui($_[0], 1);
  Rmpz_mul_2exp($_[0], $_[0], $_[1]);
  Rmpz_tdiv_q_ui($_[0], $_[0], int(0.693147180559945 * $_[1]));
  }

sub prime_ratio {
    return int($_[0] * 0.3465735902799726);
    }

sub Rprovable_small {
     my $lim = 341550071728321;
     my $last = 0;
     if(Rmpz_cmp_ui($_[0], 2) < 0 || Rmpz_cmp_d($_[0], $lim) >= 0)
       {die "Argument to provable_small (= ", Rmpz_get_str($_[0], 10), " must be in range [2..341550071728321]"}
     if(Rmpz_cmp_ui($_[0], 18) < 0) {
       if(Rmpz_cmp_ui($_[0], 2) <= 0) {Rmpz_set_ui($_[0], 2)}
       if(!Rmpz_cmp_ui($_[0], 3)) {Rmpz_set_ui($_[0], 3)}
       if(Rmpz_cmp_ui($_[0], 5) <= 0) {Rmpz_set_ui($_[0], 5)}
       if(Rmpz_cmp_ui($_[0], 7) <= 0) {Rmpz_set_ui($_[0], 7)}
       if(Rmpz_cmp_ui($_[0], 11) <= 0) {Rmpz_set_ui($_[0], 11)}
       if(Rmpz_cmp_ui($_[0], 13) <= 0) {Rmpz_set_ui($_[0], 13)}
       Rmpz_set_ui($_[0], 17);
       }

     else {
       if(!Rmpz_tstbit($_[0], 0)) {Rmpz_add_ui($_[0], $_[0], 1)};
       while(Rmpz_cmp_d($_[0], $lim) < 0) {
            if(Rrm_gmp($_[0], 2) && Rrm_gmp($_[0], 3) && Rrm_gmp($_[0], 5) && Rrm_gmp($_[0], 7)
               && Rrm_gmp($_[0], 11) && Rrm_gmp($_[0], 13) && Rrm_gmp($_[0], 17))
               {$last = 1;
                last;
               }
            Rmpz_add_ui($_[0], $_[0], 2);
            }
       if(!$last) {Rmpz_set_ui($_[0], 0)}
       }

     }

sub Rprime_test {
    my $ul = $_[1] + 1;
    for(2..$ul) {
       if(!Rrm_gmp($_[0], $_)) {return 0}
       }
    return 1;
    }

sub Rnext_germaine_prime {
    my $last = 0;
    my @range = Rsieve_gmp($_[4], $_[5], $_[2]);
    Rmpz_set($_[0], $_[2]);
    my $sub = 0;
    my $mod;
    for(@range) {
        Rmpz_add_ui($_[0], $_[0], $_ - $sub);
        $sub = $_;
        $mod = Rmpz_tdiv_ui($_[0], 3);
        if($mod == 2) { 
           if(Rprime_test($_[0], $_[3])) {
              Rmpz_mul_2exp($_[1], $_[0], 1);
              Rmpz_add_ui($_[1], $_[1], 1);
              if(Rprime_test($_[1], $_[3])) {
                 $last = 1;
                 last;
                 }
              } 
           }
         }
    if(!$last) {
       Rmpz_set_ui($_[0], 0);
       Rmpz_set_ui($_[1], 0);
       }
    }

sub merten {
    my $gamma = 0.57721566490153286; # Euler's constant 
    return 1 / exp($gamma) / log($_[0]);
    }

sub Rgenerator_zp {
    my $s = Rmpz_sizeinbase($_[1], 2);
    my $order = Rmpz_init2($s);
    my $temp = Rmpz_init2($s);
    my $check = Rmpz_init2($s);
    Rmpz_set($order, $_[1]);
    Rmpz_sub_ui($order, $order, 1);
    Rmpz_set($check, $order);

    my $nok = (1,0);
    for(@{$_[2]}) {
       if(!Rmpz_divisible_ui_p($order, $_)) {$nok = 1}
       Rmpz_set_ui($temp, $_);
       Rmpz_remove($check, $check, $temp);
       }

    if($nok) {die "Incorrect factors supplied to 3rd argument to Rgenerator_zp() function"}

    if(defined($_[3])) {
       $nok = 0;
       for(@{$_[3]}) {
          if(!Rmpz_divisible_p($order, $_)) {$nok = 1} 
          Rmpz_remove($check, $check, $_);         
          }
     if($nok) {die "Incorrect factors supplied to 4th argument to Rgenerator_zp function"}
       }

     if(Rmpz_cmp_ui($check, 1)) {die "Incomplete factorisation supplied to Rgenerator_zp function"};

    while(1) {
         my $flag = 1;
         if(Rmpz_cmp($_[0], $order) > 0){warn "Generator greater than order. Re-setting generator %= order and continuing....";
            Rmpz_tdiv_r($_[0], $_[0], $order);
            }
         for(@{$_[2]}) {
            Rmpz_divexact_ui($temp, $order, $_);
            Rmpz_powm($check, $_[0], $temp, $_[1]);
            if(!Rmpz_cmp_ui($check, 1)) {
              $flag = 0;
              last;
              }
            }

          if($flag && defined($_[3])) {
            for(@{$_[3]}) {
               Rmpz_divexact($temp, $order, $_);
               Rmpz_powm($check, $_[0], $temp, $_[1]);
               if(!Rmpz_cmp_ui($check, 1)) {
                 $flag = 0;
                 last;
                 }
               }
            }

         if($flag) {last}
         Rmpz_add_ui($_[0], $_[0], 1);
         }

}

sub Rnext_proven {
    my $s = Rmpz_sizeinbase($_[1], 2);
    my $r = Rmpz_init2($s);
    my $c = Rmpz_init2($s);
    my $two = Rmpz_init_set_ui(2);

    if(!defined($_[5])) {
       Rmpz_set($r, $_[1]);
       Rmpz_sub_ui($r, $r, 1);
       }
    else {Rmpz_set($r, $_[5])}

    while(1) {
         if($_[2]) {print STDERR "."}
         if(Rmpz_cmp_si($r, 1) < 0) {die "Failed to find next prime in Rnext_proven function"}
         Rmpz_mul_2exp($_[0], $r, 1);
         Rmpz_mul($_[0], $_[1], $_[0]);
         Rmpz_add_ui($_[0], $_[0], 1);
         if(Math::GMPz::trial_div_ul($_[0], $_[4]) == 1) {
           Rmpz_set($c, $_[0]);
           Rmpz_sub_ui($c, $c, 1);
           Rmpz_powm($c, $two, $c, $_[0]);
           if(!Rmpz_cmp_ui($c, 1)) {
             if($_[2]) {print STDERR "*"}
             Rmpz_mul_2exp($c, $r, 1);
             Rmpz_powm($c, $two, $c, $_[0]);
             Rmpz_sub_ui($c, $c, 1);
             Rmpz_gcd($c, $c, $_[0]);
             if(!Rmpz_cmp_ui($c, 1)) {last} 
             }
           }
         Rmpz_sub_ui($r, $r, 1);
         }

    if($_[3]) {
      if(!Rmpz_probab_prime_p($_[0], 10)) {die "Rnext_proven returned a composite"}
      }


    if($_[2]) {print STDERR Rmpz_sizeinbase($_[0], 2), "\n"}

}

sub _rewrite {
    my $len = length($_[0]);
    my @split = ();
    my @ret = ();
    for(my $i = 0; $i < $len - 1; $i++) {
       if(substr($_[0], $i, 1) eq '%') {
         if(substr($_[0], $i + 1, 1) eq '%') { $i++ }
         else { push(@split, $i) }
         }
       }

    push(@split, $len);
    shift(@split);

    my $start = 0;
    
    for(@split) {
       push(@ret, substr($_[0], $start, $_ - $start));
       $start = $_;
       }

    return @ret;
}

sub Rmpz_printf {
    local($| = 1); # Make sure the output gets presented in the correct sequence.
    if(@_ == 1) {printf(shift)}

    else {
      my @fmt = _rewrite(shift);
      my @args = @_;

     # It's expected that @fmt and @args are of equal size (though in the case
     # of both perl's and C's printf function that's not always the case).
     # Each member of @fmt is paired with one and only one member of @args, each
     # pair of arguments being passed on to either perl's printf function or
     # the gmp_printf function. Any excess (leftover) arguments are simply ignored.
      if(@fmt != @args) {warn "Mismatch in number of args provided to Rmpz_printf.",
                         " Perhaps the function has not parsed the format string as expected"};
      my $len = @fmt;


     # If $fmt[$i] contains a 'Z' or a 'Q' or an 'F', hand over $fmt[$i] and
     # $args[$i] to the gmp_printf function.
     # Else let perl's printf function take care of the formatting - though
     # the gmp_printf function is also probably capable of handling the task.
      for(my $i = 0; $i < $len; $i++) { 
         if($fmt[$i] =~ /Z|Q|F/) {wrap_gmp_printf($fmt[$i], $args[$i])}
         else {printf($fmt[$i], $args[$i])}
         }
      }
}

sub query_eratosthenes_string {
    my $x = $_[0] - 1;
    if($x == 1) {return 1}
    if($x & 1) {return 0}

    if(ord(substr($_[1], $x / 16, 1)) & 1 << ($x / 2) % 8) {return 1}
    return 0;
}

1;

__END__

=head1 DESCRIPTION

   A bignum module utilising the Gnu MP (GMP) library.
   Basically this module simply wraps nearly all of
   the integer functions provided by that library.
   The documentation below extensively plagiarises
   the documentation at http://swox.com/gmp/manual.
   See the Math::GMPz test suite for examples of
   usage.

=head1 SYNOPSIS

   use Math::GMPz qw(:mpz :primes :supp);

   my $string = 'fa9eeeeeeeeeeeeea1234dcbaef1';
   my $base = 16;

   # Create the Math::GMPz object
   my $bn1 = Rmpz_init_set_str($string, $base);

   # Create another Math::GMPz object that holds
   # an initial value of zero, but has enough 
   # memory allocated to store a 131-bit number.
   # If 131 bits turns out to be insufficient, it
   # doesn't matter - additional memory is allocated
   # automatically to Math::GMPz objects as needed
   # by the GMP library.
   my $bn2 = Rmpz_init2(131);

   # Create another Math::GMPz object initialised to 0.
   my $bn3 = Rmpz_init();

   # or use the new() function:
   my $bn4 = Math::GMPz->new(12345);

   # Perform some operations ... see 'FUNCTIONS' below.

   .
   .

   # print out the value held by $bn1 (in octal):
   print Rmpz_get_str($bn1, 8), "\n";

   # print out the value held by $bn1 (in decimal):
   print Rmpz_get_str($bn1, 10);

   # print out the value held by $bn1 (in base 29)
   # using the (alternative) Rmpz_out_str()
   # function. (This function doesn't print a newline.)
   Rmpz_out_str($bn1, 29);

=head1 MEMORY MANAGEMENT

   Objects created with the Rmpz_init* functions have
   been blessed into package Math::GMPz. They will
   therefore be automatically cleaned up by the DESTROY()
   function whenever they go out of scope.

   For each Rmpz_init* function there is a corresponding function
   called Rmpz_init*_nobless which returns an
   unblessed object. If you create Math::GMPz objects
   using the '_nobless' versions, it will then be up to you
   to clean up the memory associated with these objects by
   calling Rmpz_clear($op) for each object. Alternatively
   such objects will be cleaned up when the script ends.
   I don't know why you would want to create unblessed 
   objects. The point is that you can if you want to.  

=head1 FUNCTIONS

   See the GMP documentation at http://swox.com/gmp/manual

   These next 3 functions are demonstrated above:
   $rop   = Rmpz_init_set_str($str, $base); # 1 < $base < 37
   $rop   = Rmpz_init2($bits); # $bits > 0
   $str = Rmpz_get_str($r, $base); # 1 < $base < 37 

   The following functions are simply wrappers around a GMP
   function of the same name. eg. Rmpz_swap() is a wrapper around
   mpz_swap().

   "$rop", "$op1", "$op2", etc. are Math::GMPz objects - the
   return values of one of the Rmpz_init* functions.
   They are in fact references to GMP structures.
   The "$rop" argument(s) contain the result(s) of the calculation
   being done, the "$op" argument(s) being the input(s) into that 
   calculation.
   Generally, $rop, $op1, $op2, etc. can be the same perl variable,
   though usually they will be distinct perl variables
   referencing distinct GMP structures.
   Eg something like Rmpz_add($r1, $r1, $r1),
   where $r1 *is* the same reference to the same GMP structure,
   would add $r1 to itself and store the result in $r1. Think of it
   as $r1 += $r1. Otoh, Rmpz_add($r1, $r2, $r3), where each of the
   arguments is a different reference to a different GMP structure
   would add $r2 to $r3 and store the result in $r1. Think of it as
   $r1 = $r2 + $r3.
   Mostly, the first argument is the argument that 
   stores the result and subsequent arguments provide the input values.
   Exceptions to this can be found in some of the functions that
   actually return a value, and, eg., the div_qr functions (which
   yield both quotient and remainder as their first *two* arguments). 
   Like I say, see the GMP manual for details. I hope it's 
   intuitively obvious or quickly becomes so. Also see the test
   suite that comes with the distro for some examples of usage.

   "$ui" means any integer that will fit into a C 'unsigned long int'.

   "$si" means any integer that will fit into a C 'signed long int'.

   "$double" means any number (not necessarily integer) that will fit
   into a C 'double'.

   "$bool" means a value (usually a 'signed long int') in which
   the only interest is whether it evaluates as true or not.

   "$str" simply means a string of symbols that represent a number,
   eg "1234567890987654321234567" which might be a base 10 number,
   or "zsa34760sdfgq123r5" which would have to represent a base 36
   number (because "z" is a valid digit only in base 36). Valid
   bases for GMP numbers are 2 to 62 (inclusive).

   #####################

   INITIALIZING INTEGERS
   http://swox.com/gmp/manual/Initializing-Integers.html

   Normally, a variable should be initialized once only or at least be
   cleared, using `Rmpz_clear', between initializations.
   'DESTROY' (which calls 'Rmpz_clear') is automatically called on 
   blessed objects whenever they go out of scope.

   First read the section 'MEMORY MANAGEMENT' (above).

   $rop = Math::GMPz::new();
   $rop = Math::GMPz->new();
   $rop = new Math::GMPz();
   $rop = Rmpz_init();
   $rop = Rmpz_init_nobless();
    Initialize $rop, and set its value to 0.

   $rop = Rmpz_init2($bits);
   $rop = Rmpz_init2_nobless($bits);
    Initialize $rop, with space for $bits bits, and set its value
    to 0. $bits is only the initial space, $rop will grow
    automatically if necessary, for subsequent values stored.
    `Rmpz_init2' makes it possible to avoid such reallocations if a
    maximum size is known in advance.

   Rmpz_realloc2($rop, $ui);
    Change the space allocated for $rop to $ui bits.  The value in
    $rop is preserved if it fits, or is set to 0 if not.

   ##################

   ASSIGNING INTEGERS
   http://swox.com/gmp/manual/Assigning-Integers.html 

   Rmpz_set($rop, $op); 
    Assign the value in $op to $rop.

   Rmpz_set_si($rop, $si);
    Assign the 'signed int', $si, to $rop.
 
   Rmpz_set_ui($rop, $ui);
    Assign the 'unsigned int', $ui, to $rop.
 
   Rmpz_set_d($rop, $double);
    Assign $double to $rop. (Truncate to an integer if necessary.)

   Rmpz_set_q($rop, $q); # $q is a Math::GMPq or GMP::Mpq object
    Assign $q to $rop. (Truncate to an integer if necessary.)

   Rmpz_set_f($rop, $f); # $f is a Math::GMPf or GMP::Mpf object
    Assign $f to $rop. (Truncate to an integer if necessary.)

   Rmpz_set_str($rop, $str, $base); 
    Set $rop to the base $base value of $str. $base may vary from
    2 to 36.  If $base is 0, the actual base is determined from the
    leading characters: if the first two characters are "0x" or "0X",
    hexadecimal is assumed, otherwise if the first character is "0",
    octal is assumed, otherwise decimal is assumed.

   Rmpz_swap($rop1, $rop2); # swap the values

   ######################################

   COMBINED INITIALIZATION AND ASSIGNMENT

   NOTE: Do NOT use these functions if $rop has already
   been initialised. Instead use the Rmpz_set* functions 
   in 'Assigning Integers' (above)

   First read the section 'MEMORY MANAGEMENT' (above).

   $rop = Math::GMPz->new($arg);
   $rop = Math::GMPz::new($arg);
   $rop = new Math::GMPz($arg);
    Returns a Math::GMPz object with the value of $arg, with default
    precision. $arg can be either an integer (signed integer, unsigned
    integer, signed fraction or unsigned fraction) or a string that 
    represents a numeric value. If $arg is a string, an optional
    additional argument that specifies the base of the number can be
    supplied to new(). If base is 0 (or not supplied) then the leading
    characters are used: 0x or 0X for hex, 0b or 0B for binary, 0 for
    octal, or decimal otherwise. 

   $rop = Rmpz_init_set($op);
   $rop = Rmpz_init_set_nobless($op);
   $rop = Rmpz_init_set_ui($ui);
   $rop = Rmpz_init_set_ui_nobless($ui);
   $rop = Rmpz_init_set_si($si);
   $rop = Rmpz_init_set_si_nobless($si);
   $rop = Rmpz_init_set_d($double);
   $rop = Rmpz_init_set_d_nobless($double);
   $rop = Rmpz_init_set_str($str, $base);
   $rop = Rmpz_init_set_str_nobless($str, $base);

   ###################

   CONVERTING INTEGERS
   http://swox.com/gmp/manual/Converting-Integers.html 

   $ui = Rmpz_get_ui($op);
    Return the value of $op as an `unsigned long'.
    The sign of $op is ignored, only the absolute value is used.
 
   $si = Rmpz_get_si($op); 
    If $op fits into a `signed long int' return the value of $op.
    Otherwise return the least significant part of OP, with the
    same sign as $op. If $op is too big to fit in a `signed long
    int', the returned result is probably not very useful.  To
    find out if the value will fit, use the function 
    `Rmpz_fits_slong_p'.

   $double = Rmpz_get_d($op);
     Place the value of $op into a normal perl scalar.

   ($double, $si) = Rmpz_get_d_2exp($op); 
    Find $double and $si such that $double times 2 raised to 
    $si, with 0.5<=abs($double)<1, is a good approximation to $op.

   $ul = Rmpz_getlimbn($op, $ui);
    Return limb number $ui from $op.  The sign of $op is ignored,
    just the absolute value is used.  The least significant limb 
    is number 0. `Rmpz_size' can be used to find how many limbs
    make up $op. `Rmpz_getlimbn' returns zero if $ui is outside the
    range 0 to `Rmpz_size($op)-1'.

   $str = Rmpz_get_str($op, $base);
    Convert $op to a string of digits in base $base.
    The base may vary from 2 to 36. 

   ##################
 
   INTEGER ARITHMETIC
   http://swox.com/gmp/manual/Integer-Arithmetic.html

   Rmpz_add($rop, $op1, $op2); 
   Rmpz_add_ui($rop, $op, $ui); 
    $rop = 2nd arg + 3rd arg.

   Rmpz_sub($rop, $op1, $op2); 
   Rmpz_sub_ui($rop, $op, $ui); 
   Rmpz_ui_sub($rop, $ui, $op);
    $rop = 2nd arg - 3rd arg.
 
   Rmpz_mul($rop, $op1, $op2); 
   Rmpz_mul_si($rop, $op, $si); 
   Rmpz_mul_ui($rop, $op, $ui);
    $rop = 2nd arg * 3rd arg.

   Rmpz_addmul($rop, $op1, $op2);
   Rmpz_addmul_ui($rop, $op, $ui);
    $rop += 2nd arg * 3rd arg.
 
   Rmpz_submul($rop, $op1, $op2); 
   Rmpz_submul_ui($rop, $op, $ui);
    $rop -= 2nd arg * 3rd arg.

   Rmpz_mul_2exp($rop, $op, $ui);
    Set $rop to $op times 2 raised to $ui.  This operation can
    also be defined as a left shift by $ui bits.

   Rmpz_neg($rop, $op);
    $rop = -$op.
 
   Rmpz_abs($rop, $op);
    $rop = abs($op).

   ################

   INTEGER DIVISION
   http://swox.com/gmp/manual/Integer-Division.html

   `cdiv' rounds quotient up towards +infinity, and remainder
          will have the opposite sign to divisor.
         The `c' stands for "ceil".

   `fdiv' rounds quotient down towards -infinity, and remainder
          will have the same sign as divisor.
          The `f' stands for "floor".

   `tdiv' rounds quotient towards zero, and remainder
          will have the same sign as the number. 
          The `t' stands for "truncate".
 
   Rmpz_cdiv_q($rop, $op1, $op2);
   Rmpz_fdiv_q($rop, $op1, $op2);
   Rmpz_tdiv_q($rop, $op1, $op2); 
    $rop = $op1 / $op2.

   Rmpz_cdiv_r($rop, $op1, $op2);
   Rmpz_fdiv_r($rop, $op1, $op2);
   Rmpz_tdiv_r($rop, $op1, $op2);
    $rop = $op1 % $op2.
 
   Rmpz_cdiv_qr($rop1, $rop2, $op1, $op2);
   Rmpz_fdiv_qr($rop1, $rop2, $op1, $op2);
   Rmpz_tdiv_qr($rop1, $rop1, $op1, $op2);
    $rop1 = $op1 / $op2.
    $rop2 = $op1 % $op2.
 
   $ul = Rmpz_cdiv_q_ui($rop, $op, $ui);
   $ul = Rmpz_fdiv_q_ui($rop, $op, $ui);
   $ul = Rmpz_tdiv_q_ui($rop, $op, $ui);
    $rop = $op / $ui.
    $ul = $op % $ui.
     
   $ul = Rmpz_cdiv_r_ui($rop, $op, $ui);
   $ul = Rmpz_fdiv_r_ui($rop $op, $ui);
   $ul = Rmpz_tdiv_r_ui($rop, $op, $ui);
    $rop = $op % $ui.
    $ul = $op % $ui.
 
   $ul = Rmpz_cdiv_qr_ui($rop1, $rop2, $op, $ui);
   $ul = Rmpz_fdiv_qr_ui($rop1, $rop2, $op, $ui);
   $ul = Rmpz_tdiv_qr_ui($rop1, $rop2, $op, $ui);
    $rop1 = $op / $ui.
    $rop2 = $op % $ui.
    $ul = $op % $ui.

   $ul = Rmpz_cdiv_ui($op, $ui);
   $ul = Rmpz_fdiv_ui($op, $ui);
   $ul = Rmpz_tdiv_ui($op, $ui);
    $ul = $op % $ui.
 
   Rmpz_cdiv_q_2exp($rop, $op, $ui);
   Rmpz_fdiv_q_2exp($rop, $op, $ui);
   Rmpz_tdiv_q_2exp($rop, $op, $ui);
    $rop = $op / (2 ** $ui). ie $rop is $op right-shifted
    by $ui bits.
 
   Rmpz_cdiv_r_2exp($rop, $op, $ui); 
   Rmpz_fdiv_r_2exp($rop, $op, $ui);
   Rmpz_tdiv_r_2exp($rop, $op, $ui); 
    $rop = $op % (2 ** $ui).
 
   Rmpz_mod($rop, $op1, $op2);
    $rop = $op1 % $op2. The sign of the divisor is ignored.
    The result is never negative.

   $ul = Rmpz_mod_ui($rop, $op, $ui); 
    $rop = $op % $ui.
    $ul = $op % $ui.
    The sign of the divisor is ignored. The result is never negative.   

   Rmpz_divexact($rop, $op1, $op2); 
   Rmpz_divexact_ui($rop, $op, $ui); 
    $rop = 2nd arg / 3rd arg.
    These 2 functions provide correct results only when it
    is known that the 3rd arg divides the 2nd arg.

   $bool = Rmpz_divisible_p($op1, $op2); 
   $bool = Rmpz_divisible_ui_p($op, $ui);
   $bool = Rmpz_divisible_2exp_p($op, $ui);
    Return non-zero if 1st arg is exactly divisible by 2nd arg,
    or in the case of `Rmpz_divisible_2exp_p' by 2 ** 2nd arg.
 
   $bool = Rmpz_congruent_p($op1, $op2, $op3); 
   $bool = Rmpz_congruent_ui_p($op, $ui, $ui); 
   $bool = Rmpz_congruent_2exp_p($op1, $op2, $ui);
    Return non-zero if 1st arg is congruent to 2nd arg modulo 
    3rd arg, or in the case of `Rmpz_congruent_2exp_p' modulo
    2 ** 3rd arg.

   ######################

   INTEGER EXPONENTIATION
   http://swox.com/gmp/manual/Integer-Exponentiation.html

   Rmpz_powm($rop, $op1, $op2, $op3);
    $rop = ($op1 ** $op2 ) % $op3 

   Rmpz_powm_ui($rop, $op1, $ui, $op2);
    $rop = ($op1 ** $ui) % $op2 

   Rmpz_pow_ui($rop, $op, $ui);
    $rop = $op ** $ui
 
   Rmpz_ui_pow_ui($rop, $ui1, $ui2);
    $rop = $ui1 ** $ui2

   #############

   INTEGER ROOTS
   http://swox.com/gmp/manual/Integer-Roots.html
 
   Rmpz_root($rop, $op, $ui);
    $rop = $op ** (1 / $ui).
 
   Rmpz_sqrt($rop, $op);
    $rop = $op ** 0.5.

   Rmpz_sqrtrem($rop1, $rop2, $op);
    $rop1 = $op ** 0.5.
    $op = $rop2 + ($rop1 ** 2). 

   $bool = Rmpz_perfect_power_p($op);
    Return zero if $op is not a perfect power.
    Else return non-zero.
 
   $bool = Rmpz_perfect_square_p($op);
    Return zero if $op is not a perfect square.
    Else return non-zero.

   ##########################

   NUMBER THEORETIC FUNCTIONS
   http://swox.com/gmp/manual/Number-Theoretic-Functions.html
 
   $si = Rmpz_probab_prime_p($rop, $ui); 
    Determine whether $rop is prime. Return 2 if $rop is
    definitely prime, return 1 if $rop is probably prime 
    (without being certain), or return 0 if $rop is definitely
    composite. This function does some trial divisions, then
    some Miller-Rabin probabilistic primality tests.  $ui 
    controls how many such tests are done, 5 to 10 is a 
    reasonable number, more will reduce the chances of a
    composite being returned as "probably prime".
    Miller-Rabin and similar tests can be more properly called
    compositeness tests.  Numbers which fail are known to be 
    composite but those which pass might be prime or might be
    composite. Only a few composites pass, hence those which
    pass are considered probably prime.

   Rmpz_nextprime($rop, $op); 
    This function uses a probabilistic algorithm to identify
    primes. For practical purposes it's adequate, the chance
    of a composite passing will be extremely small.

   Rmpz_gcd($rop, $op1, $op2); 
    Set $rop to the greatest common divisor of $op1 and $op2. 
    The result is always positive even if one or both input
    operands are negative.

   $ui = Rmpz_gcd_ui($rop, $op, $ui); 
    Compute the greatest common divisor of $op1 and $ui.
    Store the result in $rop. If the result is small enough
    to fit in an `unsigned long int', it is returned.  If 
    the result does not fit, 0 is returned, and the result 
    is equal to the argument OP1.  Note that the result 
    will always fit if OP2 is non-zero.

   Rmpz_gcdext($rop1, $rop2, $rop3, $op1, $op2);
    Set $rop1 to the greatest common divisor of $op1 and $op2,
    and in addition set $rop2 and $rop3 to coefficients
    satisfying $op1*$rop2 + $op2*$rop3 = $rop1. $rop1 is
    always positive, even if one or both of $op1 and $op2 
    are negative.
 
   Rmpz_lcm($rop, $op1, $op2); 
   Rmpz_lcm_ui($rop, $op, $ui);
    Set $rop to the least common multiple of 2nd and 3rd args.
    $rop is always positive, irrespective of the signs of the
    2nd and 3rd args. $rop will be zero if either 
    2nd or 3rd arg is zero.
 
   $bool = Rmpz_invert($rop, $op1, $op2);
    Compute the inverse of $op1 modulo $op2 and put the result
    in $rop. If the inverse exists, the return value is 
    non-zero and $rop will satisfy 0 <= $rop < $op2.
    If an inverse doesn't exist the return value is zero and
    $rop is undefined.
 
   $si = Rmpz_jacobi($op1, $op2);
    Calculate the Jacobi symbol ($op1/$op2). This is defined
    only for $op2 odd.
 
   $si = Rmpz_legendre($op1, $op2); 
    Calculate the Legendre symbol ($op1/$op2). This is defined
    only for $op2 an odd positive prime, and for such $op2
    it's identical to the Jacobi symbol.

   $si = Rmpz_kronecker($op1, $op2); 
   $si = Rmpz_kronecker_si($op, $si); 
   $si = Rmpz_kronecker_ui($op, $ui); 
   $si = Rmpz_si_kronecker($si, $op); 
   $si = Rmpz_ui_kronecker($ui, $op);
    Calculate the Jacobi symbol (1st arg/2nd arg) with the 
    Kronecker extension (a/2)=(2/a) when a odd, or (a/2)=0
    when a even. When 2nd arg is odd the Jacobi symbol and
    Kronecker symbol are identical, so `mpz_kronecker_ui'
    etc can be used for mixed precision Jacobi symbols too.
   
   $ui = Rmpz_remove($rop, $op1, $op2); 
    Remove all occurrences of the factor $op2 from $op1 and
    store the result in $rop.  The return value is how many
    such occurrences were removed.

   Rmpz_fac_ui($rop, $ui); 
    Set $rop to the factorial of $ui.

   Rmpz_bin_ui($rop, $op, $ui); 
   Rmpz_bin_uiui($rop, $ui, $ui); 
    Compute the binomial coefficient 2nd arg over 3rd arg and
    store the result in $rop.  Negative values of 2nd arg are
    supported by `mpz_bin_ui', using the identity
    bin(-n,k) = (-1)^k * bin(n+k-1,k), see Knuth volume 1
    section 1.2.6 part G.

   Rmpz_fib_ui($rop, $ui); 
   Rmpz_fib2_ui($rop1, $rop2, $ui);
    `Rmpz_fib_ui' sets $rop to to F[$ui], the $ui'th 
    Fibonacci number. `Rmpz_fib2_ui' sets $rop1 to F[$ui],
    and $rop2 to F[$ui-1]. These functions are designed for
    calculating isolated Fibonacci numbers.  When a sequence
    of values is wanted it's best to start with `Rmpz_fib2_ui'
    and iterate the defining F[n+1]=F[n]+F[n-1] or similar.

   Rmpz_lucnum_ui($rop, $ui); 
   Rmpz_lucnum2_ui($rop1, $rop2, $ui); 
    `Rmpz_lucnum_ui' sets $rop to to L[$ui], the $ui'th 
    Lucas number. `Rmpz_lucnum2_ui' sets $rop1 to L[$ui],
    and $rop2 to L[$ui-1]. These functions are designed for
    calculating isolated Lucas numbers.  When a sequence of
    values is wanted it's best to start with `Rmpz_lucnum2_ui'
    and iterate the defining L[n+1]=L[n]+L[n-1] or similar.

   ###################

   INTEGER COMPARISONS
   http://swox.com/gmp/manual/Integer-Comparisons.html

   $si = Rmpz_cmp($op1, $op2); 
   $si = Rmpz_cmp_d($op, $double); 
   $si = Rmpz_cmp_si($op, $si); 
   $si = Rmpz_cmp_ui($op, $ui);
    Compare 1st and 2nd args.  Return a positive value if
    1st arg > 2nd arg, zero if 1st arg = 2nd arg, or a 
    negative value if 1st arg < 2nd arg.
 
   $si = Rmpz_cmpabs($op1, $op2); 
   $si = Rmpz_cmpabs_d($op, $double); 
   $si = Rmpz_cmpabs_ui($op, $ui);
    Compare the absolute values of 1st and 2nd args.  Return 
    a positive value if abs(1st arg) > abs(2nd arg), zero if
    abs(1st arg) = abs(2nd arg), or a negative value if
    abs(1st arg) < abs(2nd arg). 

   $si = Rmpz_sgn($op); 
    Return +1 if $op > 0, 0 if $opP = 0, and -1 if $op < 0.

   ##############################

   INTEGER LOGIC AND BIT FIDDLING
   http://swox.com/gmp/manual/Integer-Logic-and-Bit-Fiddling.html

   Rmpz_and($rop, $op1, $op2);
    Set $rop to $op1 logical-and $op2.
 
   Rmpz_ior($rop, $op1, $op2); 
    Set $rop to $op1 inclusive-or $op2.

   Rmpz_xor($rop, $op1, $op2);
    Set $rop to $op1 exclusive-or $op2.

   Rmpz_com($rop, $op); 
    Set $rop to the one's complement of $op.

   $ui = Rmpz_popcount($op); 
    If $op>=0, return the population count of $op, which is the 
    number of 1 bits in the binary representation.  If $op<0, the
    number of 1s is infinite, and the return value is MAX_ULONG,
    the largest possible `unsigned long'.

   $ui = Rmpz_hamdist($op1, $op2);
    If $op1 and $op2 are both >=0 or both <0, return the hamming
    distance between the two operands, which is the number of bit
    positions where $op1 and $op2 have different bit values.  If
    one operand is >=0 and the other <0 then the number of bits
    different is infinite, and the return value is MAX_ULONG, 
    the largest possible `unsigned long'.
 
   $ui = Rmpz_scan0($op, $ui); 
   $ui = Rmpz_scan1($op, $ui);
    Scan $op, starting from bit index $ui, towards more
    significant bits, until the first 0 or 1 bit (respectively)
    is found.  Return the index of the found bit. If the bit at
    index $ui is already what's sought, then $ui is returned.
    If there's no bit found, then MAX_ULONG is returned.  This
    will happen in `Rmpz_scan0' past the end of a positive 
    number, or `Rmpz_scan1' past the end of a negative. 

   Rmpz_setbit($rop, $ui);
    Set bit index $ui in $rop. 

   Rmpz_clrbit($rop, $ui); 
    Clear bit index $ui in $rop.

   $si = Rmpz_tstbit($op, $ui);
    Test bit index $ui in $op and return 0 or 1 accordingly.

   ###############

   I/O of INTEGERS
   http://swox.com/gmp/manual/I-O-of-Integers.html

   The GMP library versions of these functions have
   the capability to read/write directly from/to a 
   file (as well as to stdout). As provided here,
   the functions read/write from/to stdout only.

   $ul = Rmpz_out_str($op, $base);
    Output $op to STDOUT, as a string of digits in base $base.
    The base may vary from 2 to 36. Return the number of bytes
    written, or if an error occurred,return 0.

   $ul = Rmpz_inp_str($rop, $base);
    Input a string in base $base from STDIN, and put the read
    integer in $rop. The base may vary from 2 to 36.  If $base
    is 0, the actual base is determined from the leading
    characters: if the first two characters are `0x' or `0X',
    hexadecimal is assumed, otherwise if the first character is
   `0', octal is assumed, otherwise decimal is assumed.
    Return the number of bytes read, or if an error occurred, return 0.

   #######################

   RANDOM NUMBER FUNCTIONS

   In the random number functions, @r is an array of 
   Math::GMPz objects (one for each random number that is
   required). $how_many is the number of random numbers you 
   want and must be equal to scalar(@r). $bits is simply the
   number of random bits required. Before calling the random
   number functions, first initialise state by calling 
   rand_init(). When you've finished with the random number 
   functions, call rand_clear().

   $state = rand_init($op); # $op is the seed.
   Rmpz_urandomm(@r, $state, $op, $how_many);
    Generate $how_many uniform random integers in the range
    0 to $op-1, inclusive.

   Rmpz_urandomb(@r, $state, $bits, $how_many);
    Generate $how_many uniformly distributed random integers
    in the range 0 to 2**($bits-1), inclusive.

   Rmpz_rrandomb(@r, $state, $bits, $how_many);
    Generate $how_many random integers with long strings of 
    zeros and ones in the binary representation. Useful for 
    testing functions and algorithms, since this kind of random
    numbers have proven to be more likely to trigger corner-case bugs.
    The random number will be in the range 0 to 2**($bits-1), inclusive.

   rand_clear($state);                       

   #########################

   INTEGER IMPORT AND EXPORT
   http://swox.com/gmp/manual/Integer-Import-and-Export.html

   Rmpz_import($rop, $len, $order, $size, $endian, $nails, $bstr);

    Take a binary string ("$bstr") and convert it to a GMP
    bignum structure, treating the string as a base 256
    number. "$rop" is a Math::GMPz object holding that number.
    "$len" is the length of the string segment to be 
    converted to the GMP bignum. Normally, $len = length($bstr),
    but you can opt not to take the entire string if you like.

    Usually ($order, $size, $endian, $nails) = (1, 1, 0, 0);

    See the GMP manual for a full explanation of what these 
    variables mean.

   $bstr = Rmpz_export($order, $size, $endian, $nails, $op);

    Rmpz_export() is simply the reverse of Rmpz_import().
    It returns a base 256 string representation of the  
    number held by the Math::GMPz object, "$op".

   ###############################

   MISCELLANEOUS INTEGER FUNCTIONS
   http://swox.com/gmp/manual/Miscellaneous-Integer-Functions.html

   $bool = Rmpz_fits_ulong_p($op); 
   $bool = Rmpz_fits_slong_p($op); 
   $bool = Rmpz_fits_uint_p($op); 
   $bool = Rmpz_fits_sint_p($op);
   $bool = Rmpz_fits_ushort_p($op); 
   $bool = Rmpz_fits_sshort_p($op);
    Return non-zero iff the value of $op fits an `unsigned long int',
    `signed long int', `unsigned int', `signed int', `unsigned short
    int', or `signed short int', respectively. Otherwise, return zero.
 
   $bool = Rmpz_odd_p($op); 
   $bool = Rmpz_even_p($op);
    Determine whether $op is odd or even, respectively.
    Return non-zero if yes, zero if no.
 
   $ui = Rmpz_size($op); 
    Return the size of $op measured in number of limbs.
    If $op is zero, the returned value will be zero.

   $ui = Rmpz_sizeinbase($op, $base);
    Return the size of $op measured in number of digits in base
    $base. The base may vary from 2 to 36.  The sign of $op is 
    ignored, just the absolute value is used.  The result will be
    exact or 1 too big.  If $base is a power of 2, the result will
    always be exact. If $op is zero the return value is always 1.

   ####################

   OPERATOR OVERLOADING

   The following operators are overloaded:
    + - * / %
    += -= *= /= %=
    << >> <<= >>=
    & | ^ ~
    &= |= ^= 
    < <= > >= == != <=>
    ! not abs

    Division uses 'tdiv' (see 'Integer Division', above).
    Check that '~', '%', and '%=' are working as you expect
    (especially in relation to negative values).

    In those situations where the overload subroutine operates on 2
    perl variables, then obviously one of those perl variables is
    a Math::GMPz object. To determine the value of the other variable
    the subroutine works through the following steps (in order),
    using the first value it finds, or croaking if it gets
    to step 6:

    1. If the variable is an unsigned long then that value is used.
       The variable is considered to be an unsigned long if 
       (perl 5.8) the UOK flag is set or if (perl 5.6) SvIsUV() 
       returns true.

    2. If the variable is a signed long int, then that value is used.
       The variable is considered to be a signed long int if the
       IOK flag is set. (In the case of perls built with
       -Duse64bitint, the variable is treated as a signed long long
       int if the IOK flag is set.)

    3. If the variable is a double, then that value is used. The
       variable is considered to be a double if the NOK flag is set.

    4. If the variable is a string (ie the POK flag is set) then the
       value of that string is used. Octal strings must begin with
       '0', hex strings must begin with either '0x' or '0X' - 
       otherwise the string is assumed to be decimal. If the POK 
       flag is set, but the string is not a valid base 8, 10, or 16
       number, the subroutine croaks with an appropriate error
       message.

    5. If the variable is a Math::GMPz object then the value of that
       object is used.

    6. If none of the above is true, then the second variable is
       deemed to be of an invalid type. The subroutine croaks with
       an appropriate error message.

    If the second operand is a 'double' (ie if the other
    operand's NOK flag is set) then it is first truncated
    to an integer value before the operation is performed.

    For example:
    my $x = Rmpz_init_set_ui(112);
    $x *= 2.9;
    print "$x"; # prints 224 

    Atempting to use the overloaded operators with objects that
    have been blessed into some package other than 'Math::GMPz'
    will not work.

   #####

   OTHER

   $GMP_version = Math::GMPz::gmp_v;
    Returns the version of the GMP library. The function is
    not exportable. 

   ################

   FORMATTED OUTPUT

   Rmpz_printf($format_string, @variables);

    'Rmpz_printf' accepts format strings similar to the standard C
    'printf' (and hence also perl's printf function).  A format
     specification is of the form:

      % [flags] [width] [.[precision]] [type] conv

    GMP adds types 'Z', 'Q' and 'F' for Math::GMPz objects,
    Math::GMPq objects and Math::GMPf objects respectively.
    'Z', and 'Q' behave like integers.  'Q' will print a '/' and a
    denominator, if needed.  'F' behaves like a float.  For example:

     Rmpz_printf ("%s is a Math::GMPz object %Zd\n", "here", $z);
     Rmpz_printf ("a hex rational: %#40Qx\n", $q);
     Rmpz_printf ("fixed point mpf %.5Ff with 5 decimal places\n", $f);

    The flags accepted are as follows:

     0         pad with zeros (rather than spaces)
     #         show the base with '0x', '0X' or '0'
     +         always show a sign
     (space)   show a space or a '-' sign

    The optional width and precision can be given as a number within
    the format string, or as an interpolated perl variable - but note
    that formatting with '*' (for width and precision fields)
    WON'T currently work.ie the following is not currently supported:

     $places = 5;
     Rmpz_printf("mpf %.*Ff\n", $places, $f);

    Instead you would need to rewrite this as:

     $places = 5;
     Rmpz_printf("mpf %.${places}Ff\n", $f);

    The conversions accepted are as follows.  

     a A       hex floats, C99 style
     c         character
     d         decimal integer
     e E       scientific format float
     f         fixed point float
     i         same as d
     g G       fixed or scientific float
     o         octal integer
     s         string
     u         unsigned integer
     x X       hex integer

    'a' and 'A' are always supported for GMP objects but don't work with
    perl's printf function. Always call them prefixed with either 'Z',
    'F' or 'Q' (whichever is appropriate).

    'p' works with the GMP library and with perl (returns the address of
    the variable), but can segfault if it's used in the Rmpz_printf 
    function. For this reason I've excluded it from the list above,
    though you can certainly use it with perl's printf function - even
    if the perl variable is a gmp object.

    'o', 'x' and 'X' are unsigned for the standard C types, but for
    types 'Z', 'Q' and 'N' they are signed.  'u' is not meaningful
    for 'Z', 'Q' and 'N'.

    In the GMP C library, 'n' can be used with any type, even the GMP
    types - but that functionality does not currently extend to Perl's
    GMP objects - so 'n' has been excluded from the above list.

    The precision field has it's usual meaning for integer 'Z' and float
    'F' types, but is currently undefined for 'Q' and should not be used
    with that.

    Conversions of Math::GMPf objects only ever generate as many 
    digits as can be accurately represented by the operand, the same as
    'Rmpf_get_str' does. Zeros will be used if necessary to pad to the 
    requested precision.  This happens even for an 'f' conversion of a 
    Math::GMPf object which is an integer, for instance 2^1024 in a 
    Math::GMPq object of 128 bits precision will only produce about
    40 digits, then pad with zeros to the decimal point.  An empty 
    precision field like '%.Fe' or '%.Ff' can be used to specifically
    request just the significant digits.

    The format string is interpreted as plain ASCII - multibyte
    characters are not recognised.

    Also, in Rmpz_printf, there's no support for POSIX '$' style 
    numbered arguments.

   ###############################
   ###############################

   The following (homegrown) functions are not covered in
   the GMP manual. These should probably be removed from this
   module ... but that's more work than I can be bothered with.

   @return = Rsieve_gmp($max_p, $max_add, $op);

    "$op" is a Math::GMPz object that holds a certain
    numeric value, say 'Z'.
    $max_add and $max_p are simply variables of type "$ui".
    
    Returns an array of integers in the range [0..$max_add].
    For each integer in @return, Z+that_integer is not
    divisible by any integer less than $max_p (and > 1).
    For each integer in the range [0..$max_add] that is not
    in @return, Z+that_integer is divisible by at least
    one integer less than $max_p (and > 1).
    This is a fast and efficient method of determining which
    numbers within a range need to be subjected to
    Fermat/Miller-Rabin tests to determine whether they are prime.
    $max_p and $max_add must be even (and less than 2**32).
    Z must be odd. 
 
   $bool = Rrm_gmp($op,$ui);

    "$op" is a Math::GMPz object that holds a certain
    numeric value, say 'Z'.

    Runs a Miller Rabin test on Z for base $ui.
    Returns 1 (success) if Z is either prime, or is
    pseudoprime to base $ui.
    Else returns 0 (Z is definitely composite).

   $bool = Rfermat_gmp($op, $ui);

    "$op" is a Math::GMPz object that holds a certain
    numeric value, say 'Z' and "$ui" is an unsigned long
    with a numeric value, say U, such that U < Z.

    This is Fermat's Little Theorem.
    Returns 1 if (U ** Z ) % Z == U. (Z might be prime.)
    Else returns 0 (Z is definitely composite).

   Rprbg_ms($o, $p, $q, $seed, $bits);
   Rprbg_bbs($o, $p, $q, $seed, $bits);

    "$o", "$p", "$q", and "$seed" are all Math::GMPz objects.

    These, if they've been correctly coded, are the Micali-Schnorr
    and Blum-Blum-Shub cryptographically secure pseudorandom
    bit generators. (Blum-Blum-Shub must surely be every
    two-year-old's favorite :-)
    $p, $q hold distinct *large* prime values
    (provided by the user). Let's say these 2 primes have values
    'P' and 'Q' respectively. And let's say the value held
    by $seed is 'S'.
    The cryptographic security of these generators hinges upon
    the 2 primes (and their product) being secret. How these
    primes are generated and protected is therefore of considerable
    importance, and I'll offer no advice on that matter. You can
    obtain sound advice from the sci.crypt newsgroup.
    For the Micali-Schnorr generator, there is no guarantee that
    a suitable exponent (for a given P and Q) exists. In practise,
    such a situation will be rare, but if it happens, the
    application will die (with an appropriate error message) and
    it will be necessary to choose another P and/or Q.
    For the Blum-Blum-Shub generator the only requirement is that
    the 2 primes be congruent to 3, mod 4. (ie P%4==3 && Q%4==3.)
    If either of the 2 primes is not congruent to 3, mod 4, then
    the application will die (again with an appropriate error
    message). The primality (or otherwise) of P and Q is not
    checked internally (for either generator).
    S is a pseudorandomly derived seed. No need for that seed to
    have been generated by a cryptographically secure pseudorandom
    number generator. The only requirement is that it be different
    each time the prbg is run. (S actually seeds the GMP
    mpz_urandomb/m generator - which produces a pseudorandom seed
    of the correct size for the M-S/B-B-S generator. If S is
    bigger than 64 bits, then the 64 least significant bits are
    taken as the mpz_urandomb/m seed.)
    $bits is the bit-size of the pseudorandom bit sequence required.
    The pseudorandom bit sequence is treated as a number.
    "$o" is a Math::GMPz object that holds that number.
    If it is intended to use either of these generators for
    cryptographic purposes then you should probably verify that
    they have, in fact, been correctly coded (in addition to the
    other considerations mentioned above).
    Micali-Schnorr is very fast, producing multiple random bits at
    each internal iteration. Blum-Blum-Shub (as implemented here)
    is considerably slower, producing only one pseudorandom bit at
    each internal iteration.

   $bool = Rmonobit($op);
   $bool = Rlong_run($op);
   $bool = Rruns($op);
   $bool = Rpoker($op);

    These are the 4 standard FIPS-140 statistical tests for testing
    prbg's. They return '1' for success and '0' for failure.
    They test 20000-bit pseudorandom sequences, stored in a 
    Math::GMPz object, "$op".
    If any of the tests report failure (0), then the prbg that
    produced the bit sequence is unsuitable for cryptographic
    purposes and should not be used for such a purpose.(In fact,
    it probably shouldn't be used for *any* purpose at all.)
    The converse - namely that 'success' implies suitability for
    cryptographic purposes - is NOT necessarily true.
    Even perl's rand function passes these tests, so long as you
    make allowances for the value of $Config{randbits}.

   $bool = Rparity_ul($ui);
   $bool = Rparity_gmp($op);

    Returns the parity of the number in question - 1 for odd parity
    and 0 for even parity.


   $rotated_left = Rrotate_left_ul($num, $lsbs, $shift);

    Left rotate the $lsbs least significant bits through
    $shift shifts. $num must fit into a "signed int"
    (usually 32 bits). For larger values, use
    rotate_left_gmp. $shift must be less than $lsbs.
    It is assumed that all bits outside of the rotated
    segment are zero.

   $rotated_right = Rrotate_right_ul($num, $lsbs, $shift);

    Right rotate the $lsbs least significant bits through
    $shift shifts. $num must fit into a "signed int"
    (usually 32 bits). For larger values, use
    rotate_right_gmp. $shift must be less than $lsbs.
    It is assumed that all bits outside of the rotated
    segment are zero.

   Rrotate_left_gmp($newnum, $num, $lsbs, $shift);

    As for Rrotated_left_ul(), but there is no size limit on
    the number of bits that $num contains. $newnum is the
    value after $num has been rotated. Both $newnum and 
    $num are Math::GMPz objects.

   Rrotate_right_gmp($newnum, $num, $lsbs, $shift);

    As for rotated_right(), but there is no size limit on the
    number of bits that $num contains. $newnum is the
    value after $num has been rotated. Both $newnum and 
    $num are Math::GMPz objects.

   Rmers_div_q($q, $x, $m);

    $q = $x / $m where $m is of the form (2 ** a) - 1, where
    'a' is a positive integer. (The function does not check
    this.) $q, $x, and $m are all of Math::GMPz objects.

   Rmers_div_r($rem, $x, $m);

    $rem = $x % $m where $m is of the form (2 ** a) - 1, where
    'a' is a positive integer. (The function does not check
    this.) $rem, $x, and $m are all Math::GMPz objects.
    Check that this function behaves as you desire when $x 
    holds a negative value.

   Rmers_div_qr($q, $rem, $x, $m);

    As for the above 2 Rmers_div functions.
    $q = $x / $m and $rem = $x % $m

   Rgenerator_zp($min, $p, \@factors_ul, \@factors_gmp);

    $p and $min are Math::GMPz objects.
    $p holds a prime value,
    say P. @factors_ul is an array of all of the distinct
    prime factors of P-1 that fit into an unsigned long (ie 
    are of type "$ul"). eg if P = 53, then @factors_ul = (2,13)
    since 52 = (2 ** 2) * 13, which is the complete prime
    factorisation of 52.
    @factors_gmp is an array of Math::GMPz objects that
    hold the large (bignum) factors of P-1. If all of the 
    factors of P fit into 'unsigned longs', then @factors_gmp
    will be empty - in which case it is not provided. (ie don't
    supply a 4th argument.)
    $min is a Math::GMPz object that holds a value in the range
    [1..P-1], say M. (The initial value of M would normally be
    allocated by the user.) If M is a generator of the multiplicative
    group represented by the aforementioned 'range' it is left
    unaltered. Else M is incremented until it is a generator.
    If M > P-1, then the operation 'M %= (P - 1);' is
    performed. (A warning that this has happened will be issued.)
    No checks are performed to verify that either P, or the
    factors supplied, are in fact prime.
    Failure to supply all of the factors of P will be detected.

   Rflipbit($flipped, $orig);

    $flipped and $orig are both Math::GMP objects.
    Flips the values of all of the bits (up to and
    including the most significant bit) of $orig.
    The result is stored in $flipped. $orig is not
    altered (assuming, of course, that $orig and
    $flipped are not the same perl variable).

   @primes = eratosthenes($max);

    @primes contains all of the primes < $max.
    @primes therefore requires a significant amount
    of memory when $max gets to around 2**20.
    $max must be even.

   $prime_vector = eratosthenes_string($max);

    $prime_vector is a string whose bits encode the 
    primality of all numbers less than $max. ($max
    must be even.) To determine the primality of a $num
    (which must be less than or equal to $max) use the 
    query_eratosthenes_string() function (see next).

   $is_prime = query_eratosthenes_string($num, $prime_vector);

    $prime_vector is the return value of eratosthenes_string($max),
    where $max is an even unsigned long. $num must be less than or
    equal to $max. The function returns 1 if $num is prime, and 0
    otherwise.

   $div = trial_div_ul($b, $max);

    $b is a Math::GMPz object that holds a value, say Z.
    $max must be even, and fit into an 'unsigned long'.
    The function returns the first prime found in the range
    [2..$max] that divides Z. If no such prime is found
    the function returns '1'. Note, therefore, that
    this function always returns 'true'.

   Rnext_germaine_prime($g,$s,$b,$reps,$max_p,$max_add);

    $g, $s and $b are Math::GMPz objects. $g is the smallest
    germaine prime greater than or equal to $b. A germaine 
    prime is simply a prime, p, such that p * 2 + 1 is
    also prime. $s is this second prime (p * 2 + 1), known
    commonly as a "safe prime".
    Since the process of finding a germaine/safe prime pair
    can be slow, sieving is in order (to speed things up).
    $max_p and $max_add are sieve parameters (see the
    Rsieve_gmp() documentation above). Appropriate values
    can be determined by trial and error. Start with them equal
    to, say, 100000. They don't have to be equal to each other
    but they do both need to be even. If no germaine/safe
    primes are found in the range, $g and $s are set to zero.
    $reps is the number of Miller-Rabin primality tests that
    will be conducted to determine primality.

   $bool = Rprime_test($b, $reps);

    $b is a Math::GMPz object holding a value, say Z.
    Performs rm_gmp() on Z for bases in the range
    [2..$reps+1]. Returns 0 as soon as an rm_gmp() test
    returns 0. Returns 1 if all of the rm_gmp() tests
    return 1.

   Rprovable_small($d);

    $d is a Math::GMPz object holding a value
    in the range [2..341550071728321] say X.
    If X is prime $d is set to X. Else $d is set to
    the first prime in the range [X..341550071828320].
    If no such prime exists in that range then $d is
    to zero.

   Rnext_proven($next, $current, $progress, $check, $max_prime, $R_init);

    $next, $current, and $R_init are all Math::GMPz
    objects. $progress and $check are simple booleans.
    Given that $current holds a value, say Q, that
    is a proven prime, then the function sets the value
    held by $next to a proven prime value,
    N, of the form N = 2RQ + 1.
    If $progress is true, a progress report is given to
    STDERR. This report takes the form of a '.' printed
    whenever a new value for R is being tested for 
    primality by trial division. If the preliminary tests
    show that the current candidate is possibly prime
    a '*' is printed to STDERR while the remaining
    conclusive tests are conducted. Else, no such report.
    The trial division will be performed for all primes less
    than $max_prime (the 5th argument) which must be even.
    If $check is true, the returned prime is subjected to
    10 Miller-Rabin tests (as a bug check).
    $R_init is the initial value for R. It is decremented
    by one until the new proven prime is found. Default value
    for $R_init is Q - 1 and it is not necessary to supply
    this 6th argument unless you wish to choose a value
    other than Q - 1. (R must satisfy 0 < R < Q)
    If R reaches zero before a prime is found, then the
    function dies with an appropriate error message.

   Rpi_x($q, $bits);

    $q is a Math::GMPz object holding a value
    roughly equal to the number of primes in the
    range [2 .. 2 ** $bits], based on the primes
    distribution relation that x / ln(x) approximates pi(x).

   $conc = prime_ratio($bits);

    There is (roughly) a 1 in $conc chance that a
    randomly selected $bits-bit *odd* number is prime.
    This is also based on the primes distribution
    relation that x / ln(x) approximates pi(x).

   $probability = merten($max);

    Returns the approximate probability that any randomly
    selected large number is not divisible by any number in the
    range [2..$max]. ($max must be less than 2 ** 53).
    This is simply mertens approximation - that such probability
    equals 1 / exp(Euler's constant) / log($max).
    This function is useful for determining how deeply to
    sieve/trial-divide.
    If you're working in the field of odd-only integers, then
    you need to halve the return value.

  
=head1 BUGS

   You can get segfaults if you pass the wrong type of
   argument to the functions - so if you get a segfault, the
   first thing to do is to check that the argument types 
   you have supplied are appropriate.

=head1 TERMS AND CONDITIONS

   Use this module for whatever you like. It's free and comes
   with no guarantees - except that the purchase price is
   fully refundable if you're dissatisfied with it.

=cut