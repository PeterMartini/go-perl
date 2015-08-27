#!perl -w

use Test::More tests => 1;

use gotest;

is(3, gotest::add(1,2));
