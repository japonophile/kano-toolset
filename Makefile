#
# Placeholder makefile so "debuild" can be gently persuaded to work
#

.PHONY: kano-keys-pressed kano-splash

all: kano-keys-pressed kano-splash

kano-keys-pressed:
	cd kano-keys-pressed && make

kano-splash:
	cd kano-splash && make

