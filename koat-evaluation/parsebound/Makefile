LIBS=-libs unix,nums,str
OPTS=-cflags -warn-error,+a

default: parsebound

parsebound: 
	ocamlbuild ${OPTS} ${LIBPATH} ${LIBS} parsebound.native

clean:
	ocamlbuild -clean
