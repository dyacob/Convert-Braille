#!/usr/bin/perl -w

use Convert::Braille;
use utf8;

# $Convert::Braille::dot_separator ="-";

if ( $] > 5.007 ) {
	binmode(STDOUT, ":utf8");
}

my $ascii = "HELLO";

print "[0/6] Testing Braill-ASCII : \"$ascii\"\n";

my $unicode = braille_AsciiToUnicode ( $ascii );
print "[1/6] braille_AsciiToUnicode:  $ascii => $unicode  (has length: ", length($unicode), ")\n";

my $dots = braille_AsciiToDotNumbers ( $ascii );
print "[2/6] braille_AsciiToDots   :  $ascii => $dots\n";

$ascii = braille_DotNumbersToAscii ( $dots );
print "[3/6] braille_DotsToAscii   :  $dots => $ascii\n";

$unicode = braille_DotNumbersToUnicode ( $dots );
print "[4/6] braille_DotsToUnicode :  $dots => $unicode  (has length: ", length($unicode), ")\n";

$Convert::Braille::dot_separator ="-";

$dots = braille_UnicodeToDotNumbers ( $unicode );
print "[5/6] braille_UnicodeToDots :  $unicode => $dots\n";

$Convert::Braille::dot_separator = undef;

$ascii = braille_UnicodeToAscii ( $unicode );
print "[6/6] braille_UnicodeToAscii:  $unicode => $ascii\n";


__END__

=head1 NAME

demo.pl - Unicode, ASCII, Dots, Conversion Demonstration of Braille.

=head1 SYNOPSIS

./demo.pl

=head1 DESCRIPTION

A demonstrator script to illustrate L<Convert::Braille> usage.

=head1 AUTHOR

Daniel Yacob,  L<dyacob@cpan.org|mailto:dyacob@cpan.org>

=cut
