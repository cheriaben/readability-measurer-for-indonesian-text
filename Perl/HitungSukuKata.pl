use strict;
use warnings;

my($folder) = @ARGV;

# ketentuan encoding konsonan
# "KH" => "1"
# "NG" => "2"
# "NY" => "3"
# "SY" => "4"

# decode konsonan 2 kata
my %decode_K = (
    "1" => "KH",
    "2" => "NG",
    "3" => "NY",
    "4" => "SY"
);

#### input kata dari file

my $filein = "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/FrekuensiBacaan.txt";
my $fileout = "C:/Users/Cheria/Documents/NetBeansProjects/TesKeterbacaan/ProsesBacaan/$folder/SukuKataBacaan.txt";

open FILE, $filein or die "can't open file $filein..";
open OUT, ">", $fileout or die "can't open file $fileout..";

while (<FILE>) {
    chomp(my $wordfreq = uc $_);
    (my $word,my $freq) = split /:/, $wordfreq;
    

    chomp(my $word2 = lc $_);
    print OUT "$word2:";


    ## FSA tingkat 1
    my $res = fsa_satu($word);
    decode($word, $res, \%decode_K);

    ## FSA tingkat 2
    $res = fsa_dua($res);
    decode($word, $res, \%decode_K);

    ## FSA tingkat 3
    $res = fsa_tiga($res);
    print OUT lc decode($word, $res, \%decode_K);
    
    say OUT lc decode2($word, $res, \%decode_K);
}

close FILE;
close OUT;


#####


## cek huruf vokal
sub is_vocal {
    my $word = shift;
    if ($word =~ /^(A|I|U|E|O)$/) {
        return 1;
    }
    return 0;
}
## encode huruf konsonan 2 kata
sub consonant {
    my %consonant = (
        "KH" => "1",
        "NG" => "2",
        "NY" => "3",
        "SY" => "4"
    );
    my $word = shift;
    return $consonant{$word};
}
## cek konsonan
sub is_K {
    my $word = shift;
    if ($word =~ /^(K|1|2|3|4)$/) {
        return 1;
    }
    return 0;
}
## cek konsonan + vokal
sub is_KV {
    my $word = shift;
    if ($word =~ /^(K|1|2|3|4)V$/) {
        return 1;
    }
    return 0;
}
## cek konsonan + konsonan + vokal
sub is_KKV {
    my $word = shift;
    if ($word =~ /^(K|1|2|3|4)(K|1|2|3|4)V$/) {
        return 1;
    }
    return 0;
}
## cek konsonan + konsonan + konsonan + vokal
sub is_KKKV {
    my $word = shift;
    if ($word =~ /^(K|1|2|3|4)(K|1|2|3|4)(K|1|2|3|4)V$/) {
        return 1;
    }
    return 0;
}
## cek konsonan + vokal + konsonan
sub is_KVK {
    my $word = shift;
    if ($word =~ /^(K|1|2|3|4)V(K|1|2|3|4)$/) {
        return 1;
    }
    return 0;
}
## cek konsonan + konsonan + vokal + konsonan
sub is_KKVK {
    my $word = shift;
    if ($word =~ /^(K|1|2|3|4)(K|1|2|3|4)V(K|1|2|3|4)$/) {
        return 1;
    }
    return 0;
}

sub fsa_satu {
    ## split kata dalam array 1 huruf
    my @char = split //, $_[0];
    ## hasil fsa
    my $res = '';

    for (my $i = 0; $i <= $#char; $i++) {
        if ($i > 0) { $res .= "-"; }
        if (is_vocal($char[$i])) {
            $res .= "V";
        }
        elsif ($char[$i] eq 'N') {
            if ($i < $#char) {
                if (is_vocal($char[$i+1])) {
                    $res .= "KV";
                    $i+=1;
                } elsif ($char[$i+1] eq 'G') {
                    if ($i < $#char-1) {
                        if (is_vocal($char[$i+2])) {
                            $res .= consonant("NG")."V";
                            $i+=2;
                        } else {
                            $res .= consonant("NG");
                            $i+=1;
                        }
                    } else {
                        $res .= consonant("NG");
                        $i+=1;
                    }
                } elsif ($char[$i+1] eq 'Y') {
                    if ($i < $#char-1) {
                        if (is_vocal($char[$i+2])) {
                            ## KV
                            $res .= consonant("NY")."V";
                            $i+=2;
                        } else {
                            $res .= consonant("NY");
                            $i+=1;
                        }
                    } else {
                        $res .= consonant("NY");
                        $i+=1;
                    }
                } else {
                    $res .= "K";
                }
            } else {
                $res .= "K";
            }
        }
        elsif ($char[$i] eq 'K') {
            if ($i < $#char) {
                if (is_vocal($char[$i+1])) {
                    $res .= "KV"; $i+=1;
                } elsif ($char[$i+1] eq 'H') {
                    if ($i < $#char-1) {
                        if (is_vocal($char[$i+2])) {
                            $res .= consonant("KH")."V";
                            $i+=2;
                        } else {
                            $res .= consonant("KH");
                            $i+=1;
                        }
                    } else {
                        $res .= consonant("KH");
                        $i+=1;
                    }
                } else {
                    $res .= "K";
                }
            } else {
                $res .= "K";
            }
        }
        elsif ($char[$i] eq 'S') {
            if ($i < $#char) {
                if (is_vocal($char[$i+1])) {
                    $res .= "KV"; $i+=1;
                } elsif ($char[$i+1] eq 'Y') {
                    if ($i < $#char-1) {
                        if (is_vocal($char[$i+2])) {
                            $res .= consonant("SY")."V";
                            $i+=2;
                        } else {
                            $res .= consonant("SY");
                            $i+=1;
                        }
                    } else {
                        $res .= consonant("SY");
                        $i+=1;
                    }
                } else {
                    $res .= "K";
                }
            } else {
                $res .= "K";
            }
        }
        else {
            if ($i < $#char) {
                if (is_vocal($char[$i+1])) {
                    $res .= "KV";
                    $i+=1;
                } else {
                    $res .= "K";
                }
            } else {
                $res .= "K";
            }
        }
    }
    return $res;
}


sub fsa_dua {
    my @part = split /\-/, $_[0];
    my $res = '';

    for (my $i = 0; $i <= $#part; $i++) {
        if ($i > 0) { $res .= "-"; }

        if ($part[$i] eq "V") {
            if ($i < $#part) {
                if (is_K($part[$i+1])) {
                    $res .= "V".$part[$i+1];
                    $i+=1;
                } else {
                    $res .= "V";
                }
            } else {
                $res .= "V";
            }
        } elsif (is_K($part[$i])) {
            if ($i < $#part) {
                if (is_K($part[$i+1])) {
                    if ($i < $#part-1) {
                        if (is_KV($part[$i+2])) {
                            if ($i < $#part-2) {
                                if (is_K($part[$i+3])) {
                                    $res .= $part[$i].$part[$i+1].$part[$i+2].$part[$i+3];
                                    $i+=3;
                                } else {
                                    $res .= $part[$i].$part[$i+1].$part[$i+2];
                                    $i+=2;
                                }
                            } else {
                                $res .= $part[$i].$part[$i+1].$part[$i+2];
                                $i+=2;
                            }
                        } else {
                            $res.= $part[$i];
                        }
                    } else {
                        $res.= $part[$i];
                    }
                } elsif (is_KV($part[$i+1])) {
                    if ($i < $#part-1) {
                        if (is_K($part[$i+2])) {
                            $res .= $part[$i].$part[$i+1].$part[$i+2];
                            $i+=2;
                        } else {
                            $res .= $part[$i].$part[$i+1];
                            $i+=1;
                        }
                    } else {
                        $res .= $part[$i].$part[$i+1];
                        $i+=1;
                    }
                }
            } else {
                $res .= $part[$i];
            }
        } elsif (is_KV($part[$i])) {
            if ($i < $#part) {
                if (is_K($part[$i+1])) {
                    $res .= $part[$i].$part[$i+1];
                    $i+=1;
                } else {
                    $res .= $part[$i];
                }
            } else {
                $res .= $part[$i];
            }
        } else {
            $res .= $part[$i];
        }
    }
    return $res;
}

sub fsa_tiga {
    my @part = split /\-/, $_[0];
    my $res = '';

    for (my $i = 0; $i <= $#part; $i++) {
        if ($i > 0) { $res .= "-"; }

        if ($part[$i] eq "VK") {
            if ($i < $#part) {
                if (is_K($part[$i+1])) {
                    $res .= "VK".$part[$i+1];
                    $i+=1;
                } else {
                    $res .= "VK";
                }
            } else {
                $res .= "VK";
            }
        } elsif (is_KVK($part[$i])) {
            if ($i < $#part) {
                if (is_K($part[$i+1])) {
                    $res .= $part[$i].$part[$i+1];
                    $i+=1;
                } else {
                    $res .= $part[$i];
                }
            } else {
                $res .= $part[$i];
            }
        } elsif (is_KKVK($part[$i])) {
            if ($i < $#part) {
                if (is_K($part[$i+1])) {
                    $res .= $part[$i].$part[$i+1];
                    $i+=1;
                } else {
                    $res .= $part[$i];
                }
            } else {
                $res .= $part[$i];
            }
        } elsif ($part[$i] eq "V") {
            $res .= "V";
        } elsif (is_KV($part[$i])) {
            if ($i < $#part) {
                if ($part[$i+1] eq "V") {
                    $res .= $part[$i]."V"; $i+=1;
                } else {
                    $res .= $part[$i];
                }
            } else {
                $res .= $part[$i];
            }
        } elsif (is_KKV($part[$i])) {
            if ($i < $#part) {
                if ($part[$i+1] eq "V") {
                    $res .= $part[$i]."V"; $i+=1;
                } else {
                    $res .= $part[$i];
                }
            } else {
                $res .= $part[$i];
            }
        } elsif (is_KKKV($part[$i])) {
            if ($i < $#part) {
                if ($part[$i+1] eq "V") {
                    $res .= $part[$i]."V"; $i+=1;
                } else {
                    $res .= $part[$i];
                }
            } else {
                $res .= $part[$i];
            }
        } else {
            $res .= $part[$i];
        }
    }
    return $res;
}

sub decode {
    my @source = split //, $_[0];
    my $text = $_[1];
    my %cons = %{ $_[2] };
    my $result = '';
    my $count = 0;
    my $i = 0;
    foreach my $part (split /-/, $text) {
        if ($i > 0) { $result .= "-"; }
         $count++;
        foreach my $ch (split //, $part) {

            if (exists( $cons{$ch} )) {
                $result .= $cons{$ch};
                ++$i;

            } else {
                $result .= $source[$i];

            }
            ++$i;
        }
    }
    return "$result:";
}

sub decode2 {
    my @source = split //, $_[0];
    my $text = $_[1];
    my %cons = %{ $_[2] };
    my $result = '';
    my $count = 0;
    my $i = 0;
    foreach my $part (split /-/, $text) {
        if ($i > 0) { $result .= "-"; }
         $count++;
        foreach my $ch (split //, $part) {

            if (exists( $cons{$ch} )) {
                $result .= $cons{$ch};
                ++$i;

            } else {
                $result .= $source[$i];

            }
            ++$i;
        }
    }
    return $count;
}
