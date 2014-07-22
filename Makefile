KITTEL_LIBPATH=-cflags -I,+ocamlgraph -cflags -I,+apron -lflags -I,+ocamlgraph -lflags -I,+apron
KITTEL_LIBS=-libs graph,unix,nums,str,bigarray,gmp,apron,boxMPQ,octD
KOAT_LIBPATH=-cflags -I,+ocamlgraph -cflags -I,+apron -lflags -I,+ocamlgraph -lflags -I,+apron
KOAT_LIBS=-libs graph,unix,nums,str,bigarray,gmp,apron,boxMPQ,octD
OPTS=-cflags -warn-error,+a

default: kittel koat

all: kittel koat convert

kittel: make_git_sha1 force_look
	ocamlbuild ${OPTS} ${KITTEL_LIBPATH} ${KITTEL_LIBS} kittel.native

kittel.d.byte: make_git_sha1 force_look
	ocamlbuild ${OPTS} ${KITTEL_LIBPATH} ${KITTEL_LIBS} kittel.d.byte

koat: make_git_sha1 force_look
	ocamlbuild ${OPTS} ${KOAT_LIBPATH} ${KOAT_LIBS} koat.native

koat.d.byte: make_git_sha1 force_look
	ocamlbuild ${OPTS} ${KOAT_LIBPATH} ${KOAT_LIBS} koat.d.byte

convert: force_look
	ocamlbuild ${OPTS} ${KITTEL_LIBPATH} ${KITTEL_LIBS} convert.native

clean: force_look
	ocamlbuild -clean
	rm -f git_sha1.ml

make_git_sha1: force_look
	./make_git_sha1.sh git_sha1.ml

force_look:
	@true
