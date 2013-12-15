PROG=	news
OFILES=	news.o
PREFIX=	/usr/local
INSTALL= install

all: ${PROG}

man: ${PROG}.txt

${PROG}.txt: ${PROG}.1
	nroff -man ${PROG}.1 | col -b >$@

${PROG}: ${OFILES}
	${CC} ${CFLAGS} -o ${PROG} ${OFILES}

install:
	install -c -m 755 ${PROG} ${PREFIX}/bin/${PROG}
	install -c -m 644 ${PROG}.1 ${PREFIX}/man/man1/${PROG}.1

uninstall:
	rm -f ${PREFIX}/bin/${PROG} ${PREFIX}/man/man1/${PROG}.1

clean:
	rm -f ${OFILES} ${PROG}
