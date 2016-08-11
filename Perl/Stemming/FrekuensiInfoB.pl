use Lingua::EN::Sentence qw( get_sentences add_acronyms get_acronyms set_acronyms);

my $countkalimat=0;
my $countkata=0;
my $countjenis=0;

my($folder) = @ARGV;

open(INDEX,"> C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/FrekuensiBacaan.txt") or die $!;

open(INFO,"> C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/InfoBacaan.txt") or die $!;

open(FILE, "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/HasilEkstraksiAS.txt") or die $!;


undef $/;
$data = <FILE>;

open(FILEE, "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/HasilStemming.txt") or die $!;
while(<FILEE>){
chomp;

@splitKorpus = split;

foreach $kata(@splitKorpus){

if (exists ($hashKata{$kata})){
$hashKata{$kata}+=1;
}
else{
$hashKata{$kata}=1;
}
$countkata++;
}
}
$countjenis = keys %hashKata;


@urut=(sort {$a cmp $b} keys %hashKata);
foreach my $hasil(@urut){
print INDEX "$hasil:$hashKata{$hasil}\n";
}

open(SNKT,"C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/DataLingua.data") or die "can't open ";
@akronim=();
while(<SNKT>){
chomp;
push (@akronim, $_);
}




set_acronyms(@akronim);
$bacaan=get_sentences($data);
foreach (@$bacaan) {
$countkalimat++;
}





print INFO "$countkalimat-$countkata-$countjenis\n";

close INDEX;
close SNKT;
close FILE;
close FILEE;
closedir BACAAN;
close INFO;

