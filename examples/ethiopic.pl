#!/usr/bin/perl -w

use Convert::Braille qw( braille_AsciiToUnicode );
use Convert::Braille::Ethiopic;
use utf8;

# $Convert::Braille::dot_separator ="-";

if ( $] > 5.007 ) {
	binmode(STDOUT, ":utf8");
}

my $ethio = "ሰላምታ";
my $ascii = "S5LAMTA";

print "[0/6] Testing Braille-Ethiopic : \"$ascii\" & \"$ethio\"\n";

my $unicode = braille_AsciiToEthiopic ( $ascii );
print "[1/6] braille_AsciiToEthiopic:  $ascii => $unicode  (has length: ", length($unicode), ")\n";

my $asciiOut = ethiopicToBrailleAscii ( $ethio );
print "[2/6] ethiopicToBrailleAscii :  $ethio => $asciiOut\n";

my $braille = ethiopicToBrailleUnicode ( $ethio );
print "[3/6] ethiopicToBrailleUnicode :  $ethio => $braille  (has length: ", length($braille), ")\n";

$ethioOut = braille_UnicodeToEthiopic ( $braille );
print "[4/6] braille_UnicodeToEthiopic:  $braille => $ethioOut\n";

$Convert::Braille::dot_separator ="-";

my $dots = ethiopicToBrailleDotNumbers ( $ethio );
print "[5/6] ethiopicToBrailleDotNumbers   :  $ethio => $dots\n";

$ethioOut = braille_DotNumbersToEthiopic ( $dots );
print "[6/6] braille_DotNumbersToEthiopic   :  $dots => $ethioOut\n";

$Convert::Braille::dot_separator = undef;


__END__

=head1 NAME

demo.pl - Unicode, ASCII, DotNumbers, Conversion Demonstration of Braille.

=head1 SYNOPSIS

./demo.pl

=head1 DESCRIPTION

A demonstrator script to illustrate L<Convert::Braille> usage.

=head1 AUTHOR

Daniel Yacob,  L<dyacob@cpan.org|mailto:dyacob@cpan.org>

=cut
