#!/usr/bin/perl -w

use Convert::Braille;
use utf8;

# $Convert::Braille::dot_separator ="-";

if ( $] > 5.007 ) {
	binmode(STDOUT, ":utf8");
}

my $ascii = "HELLO";

print "[0/6] Testing Braille-English : \"$ascii\"\n";

my $unicode = braille_AsciiToEnglish ( $ascii );
print "[1/6] braille_AsciiToEnglish:  $ascii => $unicode  (has length: ", length($unicode), ")\n";

$dots = englishToBrailleAscii ( $unicode );
print "[2/6] englishToBrailleAscii :  $unicode => $dots\n";

$ascii = braille_DotNumbersToEnglih ( $dots );
print "[3/6] braille_DotNumbersToEnglih   :  $dots => $ascii\n";

$unicode = englishToBrailleUnicode ( $dots );
print "[4/6] englishToBrailleUnicode :  $dots => $unicode  (has length: ", length($unicode), ")\n";

$Convert::Braille::dot_separator ="-";

my $dots = englishToBrailleDotNumbers ( $ascii );
print "[2/6] englishToBrailleDotNumbers   :  $ascii => $dots\n";

$Convert::Braille::dot_separator = undef;

$ascii = braille_UnicodeToEnglish ( $unicode );
print "[6/6] braille_UnicodeToEnglih:  $unicode => $ascii\n";

	englishToBrailleUnicode
	englishToBrailleAscii
	englishToBrailleDotNumbers

	braille_AsciiToEnglish
	braille_DotNumbersToEnglish
	braille_UnicodeToEnglish


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
