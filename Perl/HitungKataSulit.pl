#!/usr/local/bin/perl

my($folder, $batas) = @ARGV;

my $jumlah;
my $kata;
my $sukukata;
my $kal;
my $totalkata;
my $jeniskat;
my $taksulit = 0;
my %checked;
my $filein = "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/SukuKataBacaan.txt";

open (TOTAL, "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/InfoBacaan.txt") or die$!;
while (my $info=<TOTAL>){
chomp($info);
($kal,$totalkata,$jeniskat) = split /-/, $info;
}

open (ID, "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/IndonesianWords.data") or die$!;
chomp(my @id = <ID>);

open(OUT,"> C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/JumlahKataSulit.txt") or die $!;

open SUKU, $filein or die;
while (my $line=<SUKU>) {
foreach $ids (@id){
chomp($line);
($kata,$jumlah,$sukukata,$jumlahsukukata) = split /:/, $line;
if ($ids =~ /\b$kata\b/i && $jumlahsukukata le $batas && !exists($checked{$kata})){
$checked{$kata} = $jumlah;
$taksulit = $taksulit + $jumlah;
}
}
}

$katasulit = $totalkata - $taksulit;
print OUT $katasulit;

close SUKU;
close OUT;
close ID;
close TOTAL;
