#!perl -w

use Test::More tests => 2;

use gotest;

is(3, gotest::add(1,2));
is(1, gotest::sub(3,2));
