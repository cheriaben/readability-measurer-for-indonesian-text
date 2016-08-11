#!/usr/local/bin/perl



$dir =  'C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/Korpus';
$totalkata=0;
$totalkorpusjson =0;
$totalkorpusjsonakhir=0;
$totalkorpustxt=0;
$totalkorpuswiki=0;
open(INDEX,"> C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesKorpus/FrekuensiKorpus.txt") or die $!;
open(TOTAL,"> C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesKorpus/TotalKorpus.txt") or die $!;
opendir (KORPUS, $dir)or die $!;

while ($file = readdir(KORPUS)){
next if ($file =~ m/^\./);


open(FILE, "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/Korpus/$file") or die $!;
if($file =~ /\.json?$/){
while(<FILE>){

if(/<TEXTS>/../<TEXTE>/){
$totalkorpusjson++;

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

                 foreach $kata(@splitKorpus)
                 {
                  if (exists ($hashKata{$kata}))
                  {
                   $hashKata{$kata}+=1;
                  }
                  else
                  {
                   $hashKata{$kata}=1;
                  }
                  $totalkata++;
                 }



        }
        }

$totalkorpusjsonakhir =$totalkorpusjson/2;
}


elsif($file =~ /\.wiki?$/){
while(<FILE>){
if(/<JUDULS>/../<JUDULE>/){
$totalkorpuswiki++;
}
else{
chomp;
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
$totalkata++;
}
}
}
}


else{
$totalkorpustxt++;
while(<FILE>){

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
$totalkata++;
}
}
}


}


@urut=(sort {$a cmp $b} keys %hashKata);
foreach my $hasil(@urut){
print INDEX "$hasil:$hashKata{$hasil}\n";
}
##print $totalkata;
print TOTAL $totalkorpusjsonakhir+$totalkorpustxt+$totalkorpuswiki;
%hashKata = ();
@urut=();

close INDEX;
close FILE;
close TOTAL;
closedir KORPUS;
