VERSION   = 1.2

PREFIX    ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man

tpm.1: README.pod
	pod2man --section=1 --center="tpm Manual" --name="tpm" \
		--release="tpm $(VERSION)" $< $@

install: tpm.1
	install -D -m755 tpm $(DESTDIR)$(PREFIX)/bin/tpm
	install -D -m644 tpm.1 $(DESTDIR)$(MANPREFIX)/man1/tpm.1

uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/tpm \
		$(DESTDIR)$(MANPREFIX)/man1/tpm.1

clean:
	$(RM) $(MANPAGES)

.PHONY: install uninstall clean
