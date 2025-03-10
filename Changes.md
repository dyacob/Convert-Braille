# Revision History for the Convert::Braille Perl Distribution

## 0.06 Fri Feb 28 Fri Feb 28 21:31:11 EST 2025
	- Migration to a Build.PL & GitHub system.
	- Functions renamed for clarity.
	- The "Dots" term is renamed "DotNumbers" for clarity.
	- examples/ethiopic.pl and examples/english added.

## 0.05 Fri Jun 20 21:15:37 EDT 2003
	- updated for Convert::Number::Ethiopic.
	- documentation enhancements.
	- fixes to Convert::Braille::English.

## 0.04 Thu Aug  8 13:43:41 EDT 2002
	- added $dot_separator
	- added t/braille.t
	- added examples/makeethiopic.pl
	- real Ethiopic number conversion replaces dummy conversion.

## 0.03  Mon Aug  5 15:45:35 EDT 2002
	- hash keys are native utf-8
	- Ethiopic forward and reverse conversions tested.

## 0.02  Sun Aug  4 20:49:02 EDT 2002
	- dot 7 and 8 stripping added for Braille Unicode => Braille ASCII
	- $new clobber fixed
	- 'exist' had to hash check so it won't break on 0 value in map.
	- Convert::Braille::Ethiopic and Convert::Braille::English added
	  but don't actually use them yet :-)

## 0.01  Thu Aug  1 16:42:04 EDT 2002
	- Initial release.
