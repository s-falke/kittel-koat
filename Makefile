LIBPATH=-cflags -I,+ocamlgraph -lflags -I,+ocamlgraph
LIBS=-libs graph,unix,nums,str
OPTS=-cflags -warn-error,+a

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

clean: force_look
	ocamlbuild -clean
	rm git_sha1.ml

make_git_sha1: force_look
	./make_git_sha1.sh git_sha1.ml

force_look:
	@true
