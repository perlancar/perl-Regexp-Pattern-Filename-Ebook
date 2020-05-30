package Regexp::Pattern::Filename::Ebook;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;
#use utf8;

use Filename::Ebook ();

our %RE;

my $re = join '|', map {quotemeta} sort keys %Filename::Ebook::SUFFIXES;
$re = qr((?:$re)\z)i;

$RE{filename_ebook} = {
    summary => 'Ebook filename',
    pat => $re,
    tags => ['anchored'],
    examples => [
        {str=>'foo', matches=>0, summary=>'No extension'},
        {str=>'pdf', matches=>0, summary=>'Not an extension'},
        {str=>'foo.pdf', matches=>1},
        {str=>'foo bar.RTF', matches=>1, summary=>'Case insensitive'},
        {str=>'foo.doc is the file', matches=>0, summary=>'Regex is anchored'},
        {str=>'foo.jpg', matches=>0},
    ],
};

1;
# ABSTRACT:

=head1 DESCRIPTION

This is a L<Regexp::Pattern> wrapper for L<Filename::Ebook>.


=head1 SEE ALSO

L<Regexp::Pattern>

L<Filename::Ebook>
