#! /bin/sh

VERSION=$(shell cat VERSION)

ruby-lua-$(VERSION).gem:
	gem build ./ruby-lua.gemspec

.PHONY: clean install

install: ruby-lua-$(VERSION).gem
	gem install ./ruby-lua-$(VERSION).gem

clean:
	rm -f ./ruby-lua-$(VERSION).gem
