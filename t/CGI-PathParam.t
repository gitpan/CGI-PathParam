#!/usr/bin/env perl
#
# $Revision: 1.1 $
# $Source: /home/cvs/CGI-PathParam/t/CGI-PathParam.t,v $
# $Date: 2006/05/30 22:29:29 $
#
use strict;
use warnings;
our $VERSION = '0.01';

use blib;
use Test::More tests => 9;

use CGI;
use CGI::PathParam;

my $cgi = CGI->new;

can_ok( $cgi, qw(path_param) );

# no argument
$cgi->path_info(undef);
is( $cgi->path_info, q{}, 'checking path_info behavior' );

$cgi->path_info(q{});
is_deeply( [ $cgi->path_param ], [], 'no argument(path_info is empty)' );

$cgi->path_info(q{/});
is_deeply( [ $cgi->path_param ], [], 'no argument(path_info is / only)' );

# one argument
$cgi->path_info(q{/foo});
is_deeply( [ $cgi->path_param ], [qw(foo)], 'one argument' );

# some arguments
$cgi->path_info(q{/foo/bar});
is_deeply( [ $cgi->path_param ], [qw(foo bar)], 'some arguments' );

# percent encoding
$cgi->path_info(q{/foo%2fbar});
is_deeply( [ $cgi->path_param ],
    [qw(foo/bar)], 'contains %2f(slash which is percent encoded)' );

$cgi->path_info(q{/foo%2fbar%2fbaz});
is_deeply( [ $cgi->path_param ], [qw(foo/bar/baz)], 'contains some %2f' );

$cgi->path_info(q{/foo/bar%2fbaz});
is_deeply( [ $cgi->path_param ], [qw(foo bar/baz)], 'mix of / and %2f' );
