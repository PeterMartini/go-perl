# 5.16 is not at all required;
# defaulting to what my system comes with

use 5.016;
use ExtUtils::MakeMaker;
WriteMakefile(
  NAME   => 'gotest',
  VERSION_FROM => 'gotest.pm',
  MYEXTLIB => '$(INST_ARCHAUTODIR)/libadd.so',
);

sub MY::postamble {
    return <<'MAKE_FRAG';
$(INST_ARCHAUTODIR)/libadd.so: add.go
	go build -buildmode=c-shared -o libadd.so add.go
	mv libadd.so $(INST_ARCHAUTODIR)

MAKE_FRAG
}
