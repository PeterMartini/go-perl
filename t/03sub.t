#!perl -w

use Test::More tests => 1;

use gotest;

is(1, gotest::sub(3,2));
