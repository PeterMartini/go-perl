package gotest;
our $VERSION = '0.01';

# Preload the libadd so file
# We need to do this manually, since otherwise it'll
# follow ld's default behavior and look in either LD_LIBRARY_PATH
# (which won't have our arch/auto/gotest directory)
# or in paths hard-coded into the library
# (which is even less obvious than doing a relative search from this PM)
{
  use File::Basename;
  use DynaLoader;
  my (undef, $dir) = fileparse(__FILE__);
  my $libpath = "$dir/../arch/auto/" . __PACKAGE__ . "/libadd.so";
  # The '1' is necessary to make the symbols visible to the upcoming load
  DynaLoader::dl_load_file($libpath, 1);
}

use XSLoader;
XSLoader::load('gotest', $VERSION);

1;
