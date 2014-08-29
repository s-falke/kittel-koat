HAVE_APRON=true

ifeq (${HAVE_APRON},true)
  #LIBPATH=-cflags -I,+ocamlgraph -cflags -I,+apron -lflags -I,+ocamlgraph -lflags -I,+apron
  LIBPATH=-cflags -I,+ocamlgraph -cflags -I,+apron -cflags -I,+mlgmpidl -lflags -I,+ocamlgraph -lflags -I,+apron -lflags -I,+mlgmpidl
  LIBS=-libs graph,unix,nums,str,bigarray,gmp,apron,boxMPQ,octD
  PP_OPTS=-pp "camlp4o pa_macro.cmo -DHAVE_APRON"
else
  LIBPATH=-cflags -I,+ocamlgraph -lflags -I,+ocamlgraph
  LIBS=-libs graph,unix,nums,str
  PP_OPTS=-pp "camlp4o pa_macro.cmo"
endif
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
