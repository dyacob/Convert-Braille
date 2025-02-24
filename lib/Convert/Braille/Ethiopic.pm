package Convert::Braille;
package Convert::Braille::Ethiopic;
use utf8;

BEGIN
{
require 5.006;
use warnings;
use base qw(Exporter);

use strict;
use vars qw( @EXPORT @EXPORT_OK $VERSION
	 %EthiopicToBrailleUnicode %BrailleUnicodeToEthiopic
	 %EthiopicNumeralsToBrailleUnicode %BrailleUnicodeToEthiopicNumerals
	 %EthiopicPunctuationToBrailleUnicode %BrailleUnicodeToEthiopicPunctuation
	 @EthiopicForms %EthiopicForms $n
);
use Convert::Braille qw(
	%Braille_AsciiToUnicode
	braille_AsciiToUnicode
	braille_DotNumbersToUnicode
	braille_UnicodeToAscii
	braille_UnicodeToDotNumbers
);

$VERSION = 0.06;

@EXPORT = qw(
	ethiopicToBrailleUnicode
	ethiopicToBrailleAscii
	ethiopicToBrailleDotNumbers

	braille_AsciiToEthiopic
	braille_DotNumbersToEthiopic
	braille_UnicodeToEthiopic
);
@EXPORT_OK = qw(
	ethiopicToBrailleUnicode
	ethiopicToBrailleAscii
	ethiopicToBrailleDotNumbers

	braille_AsciiToEthiopic
	braille_DotNumbersToEthiopic
	braille_UnicodeToEthiopic

	%EthiopicToBrailleUnicode %BrailleUnicodeToEthiopic
	%EthiopicNumeralsToBrailleUnicode %BrailleUnicodeToEthiopicNumerals
	%EthiopicPunctuationToBrailleUnicode %BrailleUnicodeToEthiopicPunctuation
	@EthiopicForms
);

%EthiopicToBrailleUnicode =(
	ህ	=> $Braille_AsciiToUnicode{H},
	ል	=> $Braille_AsciiToUnicode{L},
	ሕ	=> $Braille_AsciiToUnicode{H},
	ም	=> $Braille_AsciiToUnicode{M},
	ሥ	=> $Braille_AsciiToUnicode{S},
	ር	=> $Braille_AsciiToUnicode{R},
	ስ	=> $Braille_AsciiToUnicode{S},
	ሽ	=> $Braille_AsciiToUnicode{'%'},
	ቅ	=> $Braille_AsciiToUnicode{Q},
	ቍ	=> "$Braille_AsciiToUnicode{Q}$Braille_AsciiToUnicode{W}",
	ቕ	=> $Braille_AsciiToUnicode{Q},
	ቝ	=> "$Braille_AsciiToUnicode{Q}$Braille_AsciiToUnicode{W}",
	ብ	=> $Braille_AsciiToUnicode{B},
	ቭ	=> $Braille_AsciiToUnicode{V},
	ት	=> $Braille_AsciiToUnicode{T},
	ች	=> $Braille_AsciiToUnicode{'*'},
	ኅ	=> $Braille_AsciiToUnicode{H},
	ኍ	=> "$Braille_AsciiToUnicode{H}$Braille_AsciiToUnicode{W}",
	ን	=> $Braille_AsciiToUnicode{N},
	ኝ	=> $Braille_AsciiToUnicode{'+'},
	እ	=> $Braille_AsciiToUnicode{'('},
	ክ	=> $Braille_AsciiToUnicode{K},
	ኵ	=> "$Braille_AsciiToUnicode{K}$Braille_AsciiToUnicode{W}",
	ኽ	=> $Braille_AsciiToUnicode{8},
	ዅ	=> "$Braille_AsciiToUnicode{8}$Braille_AsciiToUnicode{W}",
	ው	=> $Braille_AsciiToUnicode{W},
	ዕ	=> $Braille_AsciiToUnicode{'('},
	ዝ	=> $Braille_AsciiToUnicode{Z},
	ዥ	=> $Braille_AsciiToUnicode{0},
	ይ	=> $Braille_AsciiToUnicode{Y},
	ድ	=> $Braille_AsciiToUnicode{D},
	ዽ	=> $Braille_AsciiToUnicode{D},
	ጅ	=> $Braille_AsciiToUnicode{J},
	ግ	=> $Braille_AsciiToUnicode{G},
	ጕ	=> "$Braille_AsciiToUnicode{G}$Braille_AsciiToUnicode{W}",
	ጝ	=> $Braille_AsciiToUnicode{G},
	ጥ	=> $Braille_AsciiToUnicode{')'},
	ጭ	=> $Braille_AsciiToUnicode{C},
	ጵ	=> $Braille_AsciiToUnicode{6},
	ጽ	=> $Braille_AsciiToUnicode{'&'},
	ፅ	=> $Braille_AsciiToUnicode{'&'},
	ፍ	=> $Braille_AsciiToUnicode{F},
	ፕ	=> $Braille_AsciiToUnicode{P},
	ፘ	=> "$Braille_AsciiToUnicode{R}$Braille_AsciiToUnicode{Y}$Braille_AsciiToUnicode{A}",
	ፙ	=> "$Braille_AsciiToUnicode{M}$Braille_AsciiToUnicode{Y}$Braille_AsciiToUnicode{A}",
	ፚ	=> "$Braille_AsciiToUnicode{F}$Braille_AsciiToUnicode{Y}$Braille_AsciiToUnicode{A}",
	ኧ	=> "$Braille_AsciiToUnicode{'\"'}$Braille_AsciiToUnicode{'('}"
);


foreach ( sort keys %EthiopicToBrailleUnicode ) {
	next if ( exists($BrailleUnicodeToEthiopic{$EthiopicToBrailleUnicode{$_}}) );
	$BrailleUnicodeToEthiopic{$EthiopicToBrailleUnicode{$_}} = $_;
}
$BrailleUnicodeToEthiopic{$Braille_AsciiToUnicode{S}} = 'ስ';


@EthiopicForms = ( 
	$Braille_AsciiToUnicode{5},
	$Braille_AsciiToUnicode{U},
	$Braille_AsciiToUnicode{I},
	$Braille_AsciiToUnicode{A},
	$Braille_AsciiToUnicode{E},
	"",
	$Braille_AsciiToUnicode{O},
	"$Braille_AsciiToUnicode{W}$Braille_AsciiToUnicode{A}"
);
%EthiopicForms = ( 
	$Braille_AsciiToUnicode{5} => -5,
	$Braille_AsciiToUnicode{U} => -4,
	$Braille_AsciiToUnicode{I} => -3,
	$Braille_AsciiToUnicode{A} => -2,
	$Braille_AsciiToUnicode{E} => -1,
	$Braille_AsciiToUnicode{O} =>  1,
	$Braille_AsciiToUnicode{W} =>  2
);

%EthiopicNumeralsToBrailleUnicode = (
	'፩'	=> $Braille_AsciiToUnicode{1},
	'፪'	=> $Braille_AsciiToUnicode{2},
	'፫'	=> $Braille_AsciiToUnicode{3},
	'፬'	=> $Braille_AsciiToUnicode{4},
	'፭'	=> $Braille_AsciiToUnicode{5},
	'፮'	=> $Braille_AsciiToUnicode{6},
	'፯'	=> $Braille_AsciiToUnicode{7},
	'፰'	=> $Braille_AsciiToUnicode{8},
	'፱'	=> $Braille_AsciiToUnicode{9},
	'፲'	=> "$Braille_AsciiToUnicode{1}$Braille_AsciiToUnicode{0}",
	'፳'	=> "$Braille_AsciiToUnicode{2}$Braille_AsciiToUnicode{0}",
	'፴'	=> "$Braille_AsciiToUnicode{3}$Braille_AsciiToUnicode{0}",
	'፵'	=> "$Braille_AsciiToUnicode{4}$Braille_AsciiToUnicode{0}",
	'፶'	=> "$Braille_AsciiToUnicode{5}$Braille_AsciiToUnicode{0}",
	'፷'	=> "$Braille_AsciiToUnicode{6}$Braille_AsciiToUnicode{0}",
	'፸'	=> "$Braille_AsciiToUnicode{7}$Braille_AsciiToUnicode{0}",
	'፹'	=> "$Braille_AsciiToUnicode{8}$Braille_AsciiToUnicode{0}",
	'፺'	=> "$Braille_AsciiToUnicode{9}$Braille_AsciiToUnicode{0}",
	'፻'	=> "$Braille_AsciiToUnicode{1}$Braille_AsciiToUnicode{0}$Braille_AsciiToUnicode{0}",
	'፼'	=> "$Braille_AsciiToUnicode{1}$Braille_AsciiToUnicode{0}$Braille_AsciiToUnicode{0}$Braille_AsciiToUnicode{0}$Braille_AsciiToUnicode{0}"
);


foreach ( keys %EthiopicNumeralsToBrailleUnicode ) {
	$BrailleUnicodeToEthiopicNumerals{$EthiopicNumeralsToBrailleUnicode{$_}} = $_;
}


%EthiopicPunctuationToBrailleUnicode = (
	'፡'	=> $Braille_AsciiToUnicode{2},
	'።'	=> $Braille_AsciiToUnicode{4},
	'፣'	=> $Braille_AsciiToUnicode{1},
	'፤'	=> $Braille_AsciiToUnicode{1},  # undefined in ethiopic
	'፥'	=> $Braille_AsciiToUnicode{1},  # undefined in ethiopic
	'፦'	=> $Braille_AsciiToUnicode{1},  # undefined in ethiopic
	'፧'	=> $Braille_AsciiToUnicode{8},  # undefined in ethiopic
	'፨'	=> " ",
);


foreach ( keys %EthiopicPunctuationToBrailleUnicode ) {
	next if ( exists($BrailleUnicodeToEthiopicPunctuation{$EthiopicPunctuationToBrailleUnicode{$_}}) );
	$BrailleUnicodeToEthiopicPunctuation{$EthiopicPunctuationToBrailleUnicode{$_}} = $_;
}


require Convert::Number::Ethiopic;

$n = new Convert::Number::Ethiopic;
	
}


sub	braille_UnicodeToEthiopic
{

	return unless ( $_[0] );
	my @chars  = split ( //, $_[0] );

	my $zemede_rabi = 0;
	my ($base,$trans);

	foreach  ( @chars ) { # the ኧ problem forces shifting

# print "\tChecking:  $_\n";

		if ( exists($BrailleUnicodeToEthiopic{$_}) ) {
# print "\tFound:  $BrailleUnicodeToEthiopic{$_}\n";
			if (
			      $base && $base !~ /[እዕውይ]/ &&
			      $BrailleUnicodeToEthiopic{$_} eq 'ው' 
			   )
			{
				$base = 'ኅ' if ( $base eq 'ህ' );
				if ( $base =~ /[ኅቅቕክኽግ]/ ) {
					$base = chr(ord($base)+8);
				}
				else {
					$zemede_rabi = 1;
					$trans .= chr(ord($base)+$EthiopicForms{$_});
				}
			}
			elsif ( $_ eq '⠷'  && $trans && $trans =~ /⠐$/ ) {
				$trans =~ s/⠐$/ኧ/;
			}
			else {
				$trans .= $base if( $base );
				$base = $BrailleUnicodeToEthiopic{$_};
			}
# print "\tBase:  $base\n";
		}
		elsif ( exists($EthiopicForms{$_}) ) {
# print "\tForm: $_ => $EthiopicForms{$_} [$trans]/[$base]\n";
# my $test = chr(ord($base)+$EthiopicForms{$_});
# print "\tNew: $test\n";
			$trans .= chr(ord($base)+$EthiopicForms{$_}) unless ( $zemede_rabi );
			$base = undef;
			$zemede_rabi = 0;
# print "\tTrans:  $trans\n";
		}
		else {
			if ( $base ) {
				$trans .= $base;
				$base = undef;
			}
			if ( exists($BrailleUnicodeToEthiopicNumerals{$_}) ) {
				$trans .= $base.$BrailleUnicodeToEthiopicNumerals{$_};
			}
			elsif ( exists($BrailleUnicodeToEthiopicPunctuation{$_}) ) {
				$trans .= $base.$BrailleUnicodeToEthiopicPunctuation{$_};
			}
			else {
				# something  rouge
				$trans .= $_;
			}
		}
	}

	$trans .= $base if ( $base );
	$trans;
}


sub	ethiopicToBrailleUnicode
{

	return unless ( $_[0] );

	my @chars  = split ( //, $_[0] );

	my $trans;

	#
    # change to for loop
	#
	while  ( $_ = shift @chars ) {

		if ( exists($EthiopicToBrailleUnicode{$_}) ) {
			$trans .= $EthiopicToBrailleUnicode{$_};
		}
		elsif ( /[ሀ-ፗ]/ ) {
			my $uni  = $_;
			if ( $uni eq 'ኧ' ) {
				$trans .= '⠐⠷';
			}
			else {
				my $addr = ord($uni);
				my $form  = ord($uni)%8;
				my $sadis = chr( ord($uni)-$form+5 );
				$trans .= $EthiopicToBrailleUnicode{$sadis}.$EthiopicForms[$form];
			}
		}
		elsif ( /[፡-፨]/ ) {
			$trans .= "$EthiopicPunctuationToBrailleUnicode{$_}";
		}
		elsif ( /[፩-፼]/ ) {
			my $number = $_;
			my $c;
			while ( @chars && (($c = shift @chars) =~ /[፩-፼]/) ) {
					$number .= $c;
			}
			unshift ( @chars, $c ) if ( $c );  # might have end of string

			my $result = braille_AsciiToUnicode ( $n->convert ( $number ) );
			$trans .= "$Braille_AsciiToUnicode{'#'}$result";
		}
		else {
			#	
			#  anything else should convert as per english rules (including
			#  guillemts => " ), do so when english module is ready	
			#	
			$trans .= $_;
		}
	}

	$trans;
}


sub	ethiopicToBrailleAscii
{
	braille_UnicodeToAscii ( ethiopicToBrailleUnicode ( @_ ) );
}


sub	ethiopicToBrailleDotNumbers
{
	braille_UnicodeToDotNumbers ( ethiopicToBrailleUnicode ( @_ ) );
}


sub	braille_AsciiToEthiopic
{
	braille_UnicodeToEthiopic ( braille_AsciiToUnicode ( @_ ) );
}


sub	braille_DotNumbersToEthiopic
{
	braille_UnicodeToEthiopic ( braille_DotNumbersToUnicode ( @_ ) );
}


#########################################################
# Do not change this, Do not put anything below this.
# File must return "true" value at termination
1;
##########################################################

__END__



=head1 NAME

 Convert::Braille::Ethiopic - Convert Between Braille Encodings.

=head1 SYNOPSIS

 use Convert::Braille::Ethiopic;

 print braille_AsciiToEthiopic ( "S5LAM" ), "\n";
 print braille_DotsToEthiopic  ( "234261231134" ), "\n";


=head1 REQUIRES

perl5.6.1 or later, L<Convert::Number::Ethiopic>

=head1 EXPORTS

=over 4

=item ethiopicToBrailleUnicode( $arg )

=item ethiopicToBrailleAscii( $arg )

=item ethiopicToBrailleDots( $arg )

=item braille_AsciiToEthiopic( $arg )

=item braille_DotsToEthiopic( $arg )

=item braille_UnicodeToEthiopic( $arg )

=back

=head1 COPYRIGHT

This module is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=head1 BUGS

None presently known.

=head1 AUTHOR

Daniel Yacob,  L<dyacob@cpan.org|mailto:dyacob@cpan.org>

=head1 SEE ALSO

L<Convert::Braille>    L<Convert::Braille::English>

Included with this package:

  examples/demo.pl    examples/makeethiopic.pl

=cut
