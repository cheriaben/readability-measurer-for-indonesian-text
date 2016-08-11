#!/usr/local/bin/perl

open(FILE, "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/06.data") or die $!;
open(OUT, "> C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/Wiki7.wiki") or die $!;
while (my $line = <FILE>) {
    if ($line =~ /Judul : /) {
    my $judul = $';
    chomp($judul);
    print OUT "<JUDULS>$judul<JUDULE>\n";
    }
    elsif($line =~ /\bAkurasiTerperiksa\b/){ next;}
    else{
    print OUT "$line\n";
    }
    }
    close FILE;
    close OUT;
