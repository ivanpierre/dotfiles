DOTFILES_DIR := $(shell pwd)/dotfiles
links = $(wildcard ${DOTFILES_DIR}/*/)
.PHONY: $(links)
install: $(links)
$(links):
	ln -fns $@ ${HOME}/.$(shell basename $@)
uninstall:
	git clean -fdx
	for link in $(links); do \
		rm -f $${HOME}/.$$(basename $$link); \
	done
