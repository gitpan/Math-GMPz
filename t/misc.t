use strict;
use warnings;
use Math::GMPz qw(:mpz :primes :supp);

#$| = 1;
print "1..5\n";

my
 $n2 =  '1010101010101010000000000000000000000111111110001010';

my $q = Rmpz_init_set_str( $n2, 2);

if(!Rmpz_fits_ulong_p($q)
   &&
   !Rmpz_fits_slong_p($q))
     {print "ok 1\n"}
else {print "not ok 1\n"}

if(!Rmpz_fits_uint_p($q)
   &&
   !Rmpz_fits_sint_p($q))
     {print "ok 2\n"}
else {print "not ok 2\n"}

if(!Rmpz_fits_ushort_p($q)
   &&
   !Rmpz_fits_sshort_p($q))
     {print "ok 3\n"}
else {print "not ok 3\n"}

if(Rmpz_even_p($q)
   &&
   !Rmpz_odd_p($q))
     {print "ok 4\n"}
else {print "not ok 4\n"}

if(Rmpz_size($q) == 2
   &&
   Rmpz_sizeinbase($q, 2) == 52)
     {print "ok 5\n"}
else {print "not ok 5\n"}