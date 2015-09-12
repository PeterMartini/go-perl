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

# This isn't covered by H_FILES, because H_FILES is a list
# of present .h files at perl Makefile.PL time, and this
# won't be there yet
$(C_FILES): libadd.h

libadd.h: add.go $(INST_ARCHAUTODIR)/libadd.so
	touch libadd.h

$(INST_ARCHAUTODIR)/libadd.so: add.go
	# This has to be built locally because it does generate libadd.h
	go build -buildmode=c-shared -o libadd.so add.go
	mv libadd.so $(INST_ARCHAUTODIR)/libadd.so

$(C_FILES): libsub.h

libsub.h: sub.go $(INST_ARCHAUTODIR)/libsub.so
	touch libsub.h

$(INST_ARCHAUTODIR)/libsub.so: sub.go
	# This has to be built locally because it does generate libsub.h
	go build -buildmode=c-shared -o libsub.so sub.go
	mv libsub.so $(INST_ARCHAUTODIR)/libsub.so

MAKE_FRAG
}
