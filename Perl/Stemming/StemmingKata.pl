#!/usr/local/bin/perl
use lib 'C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/Perl/Stemming';
use Stemmer qw ( prefixSuffixStem  suffixPrefixStem );

my($folder) = @ARGV;

open (TOTAL, "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/HasilPembersihanBacaan.txt") or die$!;
open (OUT, "> C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/HasilStemming.txt") or die$!;
while (my $info=<TOTAL>){
chomp($info);
$stemming = stem($info);
print OUT "$stemming "
}





sub stem {
    ## kata yang akan di-stem
    my $word = shift;
    ## pilihan metode yang digunakan (default: 0)
    my $choice = shift // 0;

    if ($choice eq 0) {
        return &prefixSuffixStem($word);
    } else {
        return &suffixPrefixStem($word);
    }
}
