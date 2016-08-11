#!/usr/local/bin/perl
open(FILE, "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/Mentah.txt") or die $!;
open(OUT, "> C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/Mentah2.txt") or die $!;

while (my $string = <FILE>) {
if ($. % 2) {
chomp $string;
##$string =~ s/[.]//g;
print "$string:";
print OUT "$string:";
}
else{
chomp $string;
$string =~ s/^\s+//g;
print "$string\n";
print OUT "$string\n";
}



}

close FILE;
close OUT;
