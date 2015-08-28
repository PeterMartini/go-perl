# 5.16 is not at all required;
# defaulting to what my system comes with

use 5.016;
use ExtUtils::MakeMaker;
WriteMakefile(
  NAME   => 'gotest',
  VERSION_FROM => 'gotest.pm',
);

sub MY::postamble {
    return <<'MAKE_FRAG';
libadd.h: add.go $(INST_ARCHAUTODIR)/libadd.so
	# This has to be built locally because it does generate libadd.h
	go build -buildmode=c-shared -o libadd.so add.go
	mv libadd.so $(INST_ARCHAUTODIR)/libadd.so
	touch libadd.h

MAKE_FRAG
}
