#!/usr/local/bin/perl

my($folder) = @ARGV;

open(OUT, "> C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/HasilPembersihanBacaan.txt") or die $!;
open(FILE, "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/HasilEkstraksiAS$judul.txt") or die $!;
while(<FILE>){
chomp ;
tr/A-Z/a-z/;
s/\-/ /g;
s/[><\]\[]/ /g;
s/[.]//g;
s/[^A-z]+/ /g;
s/\s+/ /gi;
s/\s+$//;

@splitKorpus = split;

foreach $kata(@splitKorpus){
if(exists($akronim{$kata})){
$kata =~ s/$kata/$akronim{$kata}/g;
}

print OUT "$kata\n"
}
}


close FILE;
close OUT;
