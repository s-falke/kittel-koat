LIBPATH=-cflags -I,+ocamlgraph -lflags -I,+ocamlgraph
LIBS=-libs graph,unix,nums,str
OPTS=-cflags -warn-error,+a

default: kittel

all: kittel koat convert

kittel: force_look
	ocamlbuild ${OPTS} ${LIBPATH} ${LIBS} kittel.native

kittel.d.byte: force_look
	ocamlbuild ${OPTS} ${LIBPATH} ${LIBS} kittel.d.byte

koat: force_look
	ocamlbuild ${OPTS} ${LIBPATH} ${LIBS} koat.native

koat.d.byte: force_look
	ocamlbuild ${OPTS} ${LIBPATH} ${LIBS} koat.d.byte

convert: force_look
	ocamlbuild ${OPTS} ${LIBPATH} ${LIBS} convert.native

clean: force_look
	ocamlbuild -clean

force_look:
	@true
