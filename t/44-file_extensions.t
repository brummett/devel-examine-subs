#!perl 
use warnings;
use strict;

use Data::Dumper;
use Test::More tests => 5;

use_ok( 'File::Edit::Portable' ) || print "Bail out!\n";

{
    my $rw = File::Edit::Portable->new;

    my $dir = 't';

    my @files = $rw->dir(
                    dir => $dir,
                    list => 1,
                );

    ok (@files >= 67, "with default extensions, the correct num of files is returned");

    @files = $rw->dir(
                dir => $dir,
                list => 1,
                types => [qw(*.t)],
            );

    is (@files, 48, "using *.t extension works properly");

    @files = $rw->dir(
                dir => $dir,
                list => 1,
                types => [qw(*.data)],
            );

    is (@files, 8, "using *.data extension works properly");

    @files = $rw->dir(
                dir => $dir,
                list => 1,
                types => [qw(*.data *.t)],
            );

    is (@files, 56, "using *.data and *.t extensions works properly");

}

