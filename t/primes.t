use strict;
use warnings;
use Math::GMPz qw(:mpz :primes :supp);

#$| = 1;
print "1..15\n";

my($ok, $n1, $n2, $bitstring);

my
 $p = Rmpz_init_set_str('123456789098765432123456789', 10);

my
 @rem = Rsieve_gmp(1000000, 1000, $p);

my
 @check = qw(84 138 182 198 222 264 278 308 312 314 318 392 444 464 474 482 494 524 528 570 588 632 650 672 678 692 702 720 768 788 828 830 854 860 900 908 914 924 930 950 968 978 980);
$ok = 1;
my $i;
for($i = 0; $i < scalar(@rem); $i++) {
    if($rem[$i] != $check[$i]) {$ok = 0}
    }

if($ok
   &&
   scalar(@rem) == scalar(@check))
     {print "ok 1\n"}
else {print "not ok 1\n"}

Rmpz_add_ui($p, $p, 198);
my
 $ok1 =  Rfermat_gmp($p, 3);

Rmpz_add_ui($p, $p, 2);
my 
$ok2 = Rfermat_gmp($p, 3);

if($ok1 && !$ok2)
     {print "ok 2\n"}
else {print "not ok 2\n"}

Rmpz_set_str($p, '969898428848251800182244098242207574140529611159597754095247067412415634136549', 10);
my $next = Rmpz_init2(Rmpz_sizeinbase($p, 2) + 5);
my $r_init = Rmpz_init_set_ui(100000);

Rnext_proven($next, $p, 0, 0, 1000, $r_init);

if(Rmpz_get_str($next, 10) eq "193960287801073395000445174766476670676623111639696358863967508541134878514627069021")
  {print "ok 3\n"}
else {print "not ok 3\n"}

my @nums = qw(
104444315541574816181123887068353407292392928101925192436760810605627902634083
91601766553944735988877077457024522298656297934403219910121433187170545939419
94734748821938318067666246680143111516988711547390363945585895554355763397299
104586930617956414752740913648406155106206464950173419982511280821259123691107
107128139687617433065724622410708557773489297683722385184625982688812921304917
105993245222071382948738016645777820152121099804958507681950838400453557195663
90536176103391820243809600530286941805427312278701724570690275418555301837157
107102840709367983052398701130650920435195236727054671807939002592848210404109
96236988049011134337914549425108767726300405189743367976570101550355743461023
103774870091038302073052304333408548095889888450393304174220923713491418228003
103266334501196178990989208450416107732595851605126917126837025367456591255037
91887175486974615745999696201777289791039357322296822124170128646091734600457
92380963443172849485329354852043535042276441461359490476972447624721311031629
105989457358900030277018828731100965976971141334836326494086943256975773253533
107604399328300832946644954101009316576448806915831191021141575269727922978163
108639313075981291241306251665829632746238364152376900367422244824630932599489
98553323513756171386228582359786297046672819187312886209178122702720937856433
87647109072624750379919031315369119590969887226705191559241003584699753416503
96989842884825180018224409824220757414052961115959775409524706741241563413619

1044443155415748161811238870683534072923929281019251924367608106056279026340813
916017665539447359888770774570245222986562979344032199101214331871705459394191
947347488219383180676662466801431115169887115473903639455858955543557633972991
1045869306179564147527409136484061551062064649501734199825112808212591236911071
1071281396876174330657246224107085577734892976837223851846259826888129213049171
1059932452220713829487380166457778201521210998049585076819508384004535571956631
905361761033918202438096005302869418054273122787017245706902754185553018371571
1071028407093679830523987011306509204351952367270546718079390025928482104041091
962369880490111343379145494251087677263004051897433679765701015503557434610231
1037748700910383020730523043334085480958898884503933041742209237134914182280031
1032663345011961789909892084504161077325958516051269171268370253674565912550371
918871754869746157459996962017772897910393573222968221241701286460917346004571
923809634431728494853293548520435350422764414613594904769724476247213110316291
1059894573589000302770188287311009659769711413348363264940869432569757732535331
1076043993283008329466449541010093165764488069158311910211415752697279229781631
1086393130759812912413062516658296327462383641523769003674222448246309325994891
985533235137561713862285823597862970466728191873128862091781227027209378564331
8764710907262475037991903131536911959096988722670519155924100358469975341650311
969898428848251800182244098242207574140529611159597754095247067412415634136191
);

my 
$string = '';

for(@nums) {
    Rmpz_set_str($p, $_, 10);
    $string .=  Rrm_gmp($p, int(rand(50) + 2))}
if($string eq "11111111111111111110000000000000000000")
     {print "ok 4\n"}
else {print "not ok 4\n"} 

# $n1 and $n2 are primes suitable for both Micali-Scnorr and Blum-Blum-Shub csprbg's.
$n1 = Rmpz_init_set_str("10667667141454142844595695576168005443417128557223745930297655093262663875470486513491855140358506161688618002973876541127680854019772177617043897679062391833527488526217676201473980806123371258725016544420078371064863709117900569135151145415353654995604733323803777800543662299277004165686776314527811", 10);
$n2 = Rmpz_init_set_str("6268504907431991873593892361077309961316909200833190624251613904878175321867609381118377991138556363795966740446214566521144634079487169394651232692778100515079134858595876703143498046105216943595996137446594111954068032059514530879682782767118210310120412792076413474969722657768491849443313062966643", 10);

my
 $seedstring = '';
for(1..16) {$seedstring .= ('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f')[int(rand(16))]}

my
 $seed = Rmpz_init_set_str($seedstring, 16);
my
 $bits = 20000;

my
 $check1 = Rmpz_init2(20000);
my 
$check2 = Rmpz_init();

 Rprbg_ms($check1, $n1, $n2, $seed, $bits);
 Rprbg_bbs($check2, $n1, $n2, $seed, $bits);

$ok1 = Rmonobit($check1) +
       Rlong_run($check1) +
       Rpoker($check1) +
       Rruns($check1);

$ok2 = Rmonobit($check2) +
       Rlong_run($check2) +
       Rpoker($check2) +
       Rruns($check2);

if($ok1 == 4)
     {
      print "ok 5\n";
      }
else {print "not ok 5\n"}

if($ok2 == 4)
     {
      print "ok 6\n";
      }
else {print "not ok 6\n"}

my @p = eratosthenes(111110);
if(scalar(@p) == 10544)
     {print "ok 7\n"}
else {print "not ok 7\n"}

my $n = Rmpz_init_set_str('9439062681294561264265964833740517885319', 10);

if(trial_div_ul($n, 68) == 67)
     {print "ok 8\n"}
else {print "not ok 8\n"}

Rmpz_set_str($n, '1234567890987654321234567890987654321', 10);

my $s = Rmpz_init2(250);

Rnext_germaine_prime($p, $s, $n, 40, 100000, 1000);

if(Rmpz_get_str($p, 10) eq '1234567890987654321234567890987655059'
   &&
   Rmpz_get_str($s, 10) eq '2469135781975308642469135781975310119')
     {print "ok 9\n"}
else {print "not ok 9\n"}

Rnext_germaine_prime($p, $s, $n, 40, 100000, 500);

if(!Rmpz_get_str($p, 10)
   &&
   !Rmpz_get_str($s, 10))
     {print "ok 10\n"}
else {print "not ok 10\n"}

Rmpz_set_ui($p, 65534);
Rmpz_set_d($s, 341550071728320);
Rmpz_set_ui($n, 17);

Rprovable_small($p);
Rprovable_small($s);
Rprovable_small($n);
if(!Rmpz_get_str($s, 16)
   &&
   !Rmpz_cmp_ui($p, 65537)
   &&
   !Rmpz_cmp_ui($n, 17))
     {print "ok 11\n"}
else {print "not ok 11\n"}

my $conc = prime_ratio(100000);
if($conc == 34657)
     {print "ok 12\n"}
else {print "not ok 12\n"}

my $amount = Rpi_x($s, 200);
if(Rmpz_get_str($s, 10) eq "11644478581586886054651899219863497119726108650599948081894")
     {print "ok 13\n"}
else {print "not ok 13\n"}

if(merten(1000000000) > 0.027093195058 && merten(1000000000) < 0.027093195059)
{print "ok 14\n"}
else {print "not ok 14\n"}

$ok = 1;

$bitstring = eratosthenes_string(111110);

for(@p) {
   if(!query_eratosthenes_string($_, $bitstring)) {$ok = 2}
   }

for(2 .. 111110){
   if(!query_eratosthenes_string($_, $bitstring) &&
      matches($_, \@p)) {$ok = 3}
   }

if($ok == 1) {print "ok 15\n"}
else {print "not ok 15 $ok\n"}

 sub matches {
    for(@{$_[1]}) {
       if($_[0] == $_) {return 1}
       if($_[0] > $_) {return 0}
       }
}

