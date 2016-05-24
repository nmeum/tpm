# Copyright (C) 2013-2016 Sören Tempel
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

VERSION = 1.3.1
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

all: tpm.1
tpm.1: README.pod
	pod2man --section=1 --center="tpm Manual" --name="tpm" \
		--release="tpm $(VERSION)" $< $@

install: tpm.1
	install -Dm755 tpm "$(DESTDIR)$(BINDIR)/tpm"
	install -Dm644 tpm.1 "$(DESTDIR)$(MANDIR)/man1/tpm.1"

uninstall:
	$(RM) "$(DESTDIR)$(BINDIR)/tpm" \
		"$(DESTDIR)$(MANDIR)/man1/tpm.1"

clean:
	$(RM) tpm.1

.PHONY: all install uninstall clean
