#!/usr/local/bin/perl

my $filein = 'C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ListSingkatanAkronim.data';

my ($folder, $judul) = @ARGV;

open SNGK, $filein or die $!;
my %akronim;
while (my $line=<SNGK>) {
chomp($line);
(my $word1,my $word2) = split /:/, $line;
$akronim{$word1} = $word2;
}


open(OUT, "> C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/HasilEkstraksiAS.txt") or die $!;
open(FILE, "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/Bacaan/$folder/$judul.txt") or die $!;
while(<FILE>){
chomp;

s/[,]/ /g;
s/\s+/ /gi;
s/\s+$//;




@splitKorpus = split;

foreach $kata(@splitKorpus){
if(exists($akronim{$kata})){
$kata =~ s/$kata/$akronim{$kata}/g;
}

print OUT "$kata "
}
}


close FILE;
close OUT;

close SNGK;

