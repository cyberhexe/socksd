# if you want to change/override some variables, do so in a file called
# config.mak, which is gets included automatically if it exists.

prefix = /usr/local
bindir = $(prefix)/bin

version = $(cat deb/DEBIAN/control |grep Version |cut -d" " -f2)

PROG = socksd
SRCS = src/sockssrv.c src/server.c src/sblist.c src/sblist_delete.c
OBJS = $(SRCS:.c=.o)

LIBS = -lpthread

CFLAGS += -Wall -std=c99

-include config.mak

all: $(PROG)

install: $(PROG)
	install -d $(DESTDIR)/$(bindir)
	install -D -m 755 $(PROG) $(DESTDIR)/$(bindir)/$(PROG)

clean:
	rm -f $(PROG)
	rm -f $(OBJS)

uninstall: $(PROG)
	rm -rf $(bindir)/$(PROG)

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(INC) $(PIC) -c -o $@ $<

$(PROG): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) $(LIBS) -o $@

.PHONY: all clean install

