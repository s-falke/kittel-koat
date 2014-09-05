HAVE_APRON=true
HAVE_Z3=true

LIBPATH_APRON=
LIBS_APRON=
PP_OPTS_APRON=
ifeq (${HAVE_APRON},true)
  LIBPATH_APRON=-cflags -I,+apron -cflags -I,+mlgmpidl -lflags -I,+apron -lflags -I,+mlgmpidl
  LIBS_APRON=,bigarray,gmp,apron,boxMPQ,octD
  PP_OPTS_APRON=-DHAVE_APRON
endif

LIBPATH_Z3=
LIBS_Z3=
PP_OPTS_Z3=
ifeq (${HAVE_Z3},true)
#  LIBPATH_Z3=-cflags "-I /usr/local/lib/ocaml/4.01.0/Z3/" -lflags "-I /usr/local/lib/ocaml/4.01.0/Z3/" -cflags -I,+z3 -lflags "-cclib -lz3"
  LIBPATH_Z3=-cflags "-I /usr/local/lib/ocaml/3.12.1/Z3/" -lflags "-I /usr/local/lib/ocaml/3.12.1/Z3/" -cflags -I,+z3 -lflags "-cclib -lz3"
  LIBS_Z3=,z3
  PP_OPTS_Z3=-DHAVE_Z3
endif

LIBPATH=-cflags -I,+ocamlgraph -lflags -I,+ocamlgraph $(LIBPATH_APRON) $(LIBPATH_Z3)
LIBS=-libs graph,unix,nums,str$(LIBS_APRON)$(LIBS_Z3)
PP_OPTS=-pp "camlp4o pa_macro.cmo $(PP_OPTS_APRON) $(PP_OPTS_Z3)"

OPTS=${PP_OPTS} -cflags -warn-error,+a

default: kittel koat

all: kittel koat convert

kittel: make_git_sha1 force_look
	ocamlbuild ${OPTS} ${LIBPATH} ${LIBS} kittel.native

kittel.d.byte: make_git_sha1 force_look
	ocamlbuild ${OPTS} ${LIBPATH} ${LIBS} kittel.d.byte

koat: make_git_sha1 force_look
	ocamlbuild ${OPTS} ${LIBPATH} ${LIBS} koat.native

koat.d.byte: make_git_sha1 force_look
	ocamlbuild ${OPTS} ${LIBPATH} ${LIBS} koat.d.byte

convert: force_look
	ocamlbuild ${OPTS} ${LIBPATH} ${LIBS} convert.native

koatCConv: force_look
	ocamlbuild ${OPTS} ${LIBPATH} ${LIBS} koatCConv.native

clean: force_look
	ocamlbuild -clean
	rm -f git_sha1.ml

make_git_sha1: force_look
	./make_git_sha1.sh git_sha1.ml

force_look:
	@true
