VERSION   = 1.2

PREFIX    ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man

all: tpm.1
tpm.1: README.pod
	pod2man --section=1 --center="tpm Manual" --name="tpm" \
		--release="tpm $(VERSION)" $< $@

install: tpm.1
	install -Dm755 tpm "$(DESTDIR)$(PREFIX)/bin/tpm"
	install -Dm644 tpm.1 "$(DESTDIR)$(MANPREFIX)/man1/tpm.1"

uninstall:
	$(RM) "$(DESTDIR)$(PREFIX)/bin/tpm" \
		"$(DESTDIR)$(MANPREFIX)/man1/tpm.1"

clean:
	$(RM) tpm.1

.PHONY: all install uninstall clean
