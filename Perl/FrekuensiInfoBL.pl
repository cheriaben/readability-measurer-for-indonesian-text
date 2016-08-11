use Lingua::EN::Sentence qw( get_sentences add_acronyms get_acronyms set_acronyms);

my ($folder, $judul) = @ARGV;

open(INDEX,"> C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/FrekuensiBacaanL.txt") or die $!;

open(INFO,"> C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/InfoBacaanL.txt") or die $!;

open(FILE, "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/Bacaan/$folder/$judul.txt") or die $!;

undef $/;
$data = <FILE>;

open(FILE2, "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/Bacaan/$folder/$judul.txt") or die $!;
while(<FILE2>){
chomp ;
tr/A-Z/a-z/;
s/<.*?>/ /gi;
s/[#\%\$\&\/\\,;:!?\.\@+`'"\*()_{}^=|]/ /g;
s/\-/ /g;
s/[><\]\[]/ /g;
s/[^A-z]+/ /g;
s/\s+/ /gi;
s/\s+$//;

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





print INFO "$countkalimat-$countkata-$countjenis";


close SNKT;
close FILE;
close FILE2;
closedir BACAAN;
close INFO;
