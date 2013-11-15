VERSION  = 1.0
MANPAGES = tpm.1

PREFIX    ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man

all: doc

doc: $(MANPAGES)
tpm.1: README.pod
	pod2man --section=1 --center="tpm Manual" --name="tpm" --release="tpm $(VERSION)" $< $@

install: all
	install -D -m755 tpm $(DESTDIR)$(PREFIX)/bin/tpm
	install -D -m644 tpm.1 $(DESTDIR)$(MANPREFIX)/man1/tpm.1

uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/tpm \
		$(DESTDIR)$(MANPREFIX)/man1/tpm.1 \

clean:
	$(RM) $(MANPAGES)

.PHONY: clean doc install uninstall
