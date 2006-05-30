#
# $Revision: 1.1 $
# $Source: /home/cvs/CGI-PathParam/lib/CGI/PathParam.pm,v $
# $Date: 2006/05/30 22:29:21 $
#
package CGI::PathParam;
use strict;
use warnings;

=head1 NAME

CGI::PathParam - Add path_info parser to CGI.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

    use CGI;
    use CGI::PathParam;
    my $q = CGI->new;
    my @paths = $q->path_param;
    # if $q->path_info() eq '/foo/bar/baz'
    # then $q->path_param() returns qw(foo bar baz)

=head1 DESCRIPTION

The param() parses query_string, and the path_param() parses path_info.

You can find documentation for this module with the perldoc command.

    perldoc CGI::PathParam

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/CGI-PathParam>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/CGI-PathParam>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=CGI-PathParam>

=item * Search CPAN

L<http://search.cpan.org/dist/CGI-PathParam>

=back

=head1 SUBROUTINES/METHODS

=head2 path_param()

returns the list of path_info parameters.

=cut

sub path_param {
    my $self = shift;

    if ( !$self->path_info ) {
        return;
    }

    return map { $self->unescape($_) }
      split m{/}msx, substr $self->path_info, 1;
}

=head2 import()

import path_param method into CGI package.

=cut

sub import {
    *CGI::path_param = \&path_param;
    return;
}

=head1 DIAGNOSTICS

=head1 CONFIGURATION AND ENVIRONMENT

=head1 DEPENDENCIES

L<CGI>

=head1 INCOMPATIBILITIES

=head1 BUGS AND LIMITATIONS

The path_param() does not provide a setter feature yet.

Please report any bugs or feature requests to
C<bug-cgi-pathparam@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=CGI-PathParam>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 AUTHOR

Hironori Yoshida, C<< <yoshida@cpan.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2006 Hironori Yoshida, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;    # End of CGI::PathParam
