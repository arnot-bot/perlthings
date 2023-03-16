use strict;

sub readDATA {
my @labels = @_ ;
my ($months, $weekday, $lookup) = "";
	
while (<DATA>){
	if ( /^\s*\n$/ ) { # empty line are skipped....
		next;
	}
	if (   /^__$labels[0]__/ .. /^__END__$/ )  { 
		if ( /^__$labels[0]__\n/ ) {
			next;
		}
		if ( $_ =~ m/^__END__\n$/ ) {
			next;
		}
		
		$months .= $_
	}elsif ( /^__$labels[1]__/ .. /^__END__$/ ){
		if ( /^__$labels[1]__\n/ ) {
			next;
		}
		if ( $_ =~ m/^__END__\n$/ ) {
			next;
		}
		$weekday .=$_ ;
	} elsif ( /^__$labels[2]__/ .. /^__END__$/ ) {
		if ( /^__$labels[2]__\n/ ) {
			next;
		}
		if ( $_ =~ m/^__END__\n$/ ) {
			next;
		}
		$lookup .= $_;
	}

}
close DATA;

chomp $weekday;
chomp $lookup;
chomp $months;

return ( $months,$weekday,$lookup );
}

### MAIN MAIN
# read <DATA> from this file after the __DATA__ ( __DATA__ must be present )
# below this line can be more than one item.
my ($months, $weekday , $lookup ) = readDATA('MONTHS', 'WEEKDAY', 'LOOKUP' );# case sensetive
print "\n",'-' x 80 ;
print "\n\$months:\n$months";
print "\n",'-' x 80 ;
print "\n\$weekday:\n$weekday";
print "\n",'-' x 80;
print "\n\$lookup:\n$lookup";
# you can do anything with the DATA stored in the scalars after using readingDATA. 
exit;

__DATA__




__MONTHS__
januari, oktober          |A B C D E F G
februari, maart, november |D E F G A B C
april, juli               |G A B C D E F
mei                       |B C D E F G A
juni                      |E F G A B C D
augustus                  |C D E F G A B
september, december       |F G A B C D E
__END__




__WEEKDAY__
1 8 15 22 29              |zo za vr do wo di ma
2 9 16 23 30              |ma zo za vr do wo di
3 10 17 24 31             |di ma zo za vr do wo
4 11 18 25                |wo di ma zo za vr do
5 12 19 26                |do wo di ma zo za vr
6 13 20 27                |vr do wo di ma zo za
7 14 21 28                |za vr do wo di ma zo
__END__




__LOOKUP__
  |  |  |00|C   |    |E   |  |G   |BA    |
01|29|57|85|B   |C   |D   |E |F   |G     |A
02|30|58|86|A   |B   |C   |D |E   |F     |G
03|31|59|87|G   |A   |B   |C |D   |E     |F
04|32|60|88|FE  |GF  |AG  |BA|CB  |DC    |ED
05|33|61|89|D   |E   |F   |G |A   |B     |C
06|34|62|90|C   |D   |E   |F |G   |A     |B
07|35|63|91|B   |C   |D   |E |F   |G     |A
08|36|64|92|AG  |BA  |CB  |DC|ED  |FE    |GF
09|37|65|93|F   |G   |A   |B |C   |D     |E
10|38|66|94|E   |F   |G   |A |B   |C     |D
11|39|67|95|D   |E   |F   |G |A   |B     |C
12|40|68|96|CB  |DC  |ED  |FE|GF  |AG    |BA
13|41|69|97|A   |B   |C   |D |E   |F     |G
14|42|70|98|G   |A   |B   |C |D   |E     |F
15|43|71|99|F   |G   |A   |B |C   |D     |E
16|44|72|  |ED  |FE  |GF  |AG|BA  |CB    |DC
17|45|73|  |C   |D   |E   |F |G   |A     |B
18|46|74|  |B   |C   |D   |E |F   |G     |A
19|47|75|  |A   |B   |C   |D |E   |F     |G
20|48|76|  |GF  |AG  |BA  |CB|DC  |ED    |FE
21|49|77|  |E   |F   |G   |A |B   |C     |D
22|50|78|  |D   |E   |F   |G |A   |B     |C
23|51|79|  |C   |D   |E   |F |G   |A     |B
24|52|80|  |BA  |CB  |DC  |ED|FE  |GF    |AG
25|53|81|  |G   |A   |B   |C |D   |E     |F
26|54|82|  |F   |G   |A   |B |C   |D     |E
27|55|83|  |E   |F   |G   |A |B   |C     |D
28|56|84|  |DC  |ED  |FE  |GF|AG  |BA    |CB
 
  |  |  |  |    |    |    |  |1500|  1600|
  |  |  |  |1700|    |1800|  |1900|  2000|
  |  |  |  |2100|    |2200|  |2300|  2400|
  |  |  |  |2500|    |2600|  |2700|  2800|
__END__
