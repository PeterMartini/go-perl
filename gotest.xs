#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "libadd.h"

MODULE = gotest               PACKAGE = gotest

int
add(int a, int b)
    OUTPUT:
        RETVAL
