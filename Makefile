#!/usr/bin/make -f


# Install/Uninstall make script for S0AndS0/configure-vim
# Copyright (C) 2023 S0AndS0
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


#
#    Lambda-like functions
#
path_append = $(strip $(1))$(strip $(__PATH_SEPARATOR__))$(strip $(2))


#
#    Make variables to satisfy conventions
#
NAME = configure-vim
VERSION = 0.0.1
PKG_NAME = $(NAME)-$(VERSION)


#
#    Make variables that readers &/or maintainers may wish to modify
#
GIT_REMOTE__BRANCH := main
GIT_REMOTE__NAME := origin
GIT_LOCAL__BRANCH := local

#
#    Make variables set upon run-time
#
##  Note ':=' is to avoid late binding that '=' entails
## Attempt to detect Operating System
ifeq '$(findstring :,$(PATH))' ';'
	__OS__ := Windows
else
	__OS__ := $(shell uname 2>/dev/null || echo 'Unknown')
	__OS__ := $(patsubst CYGWIN%,Cygwin,$(__OS__))
	__OS__ := $(patsubst MSYS%,MSYS,$(__OS__))
	__OS__ := $(patsubst MINGW%,MSYS,$(__OS__))
endif


ifeq '$(__OS__)' 'Windows'
	__PATH_SEPARATOR__ := \\
	BASH_PATH := $(shell where bash)
else
	__PATH_SEPARATOR__ := /
	BASH_PATH := $(shell which bash)
endif


ifeq '$(shell id -u)' '0'
	INSTALL_DIRECTORY := $(shell vim -e -s -c 'redi! > /dev/stdout | echo expand("$$VIM") | redi END | qa' | tail -n1)
	VIM_DIRECTORY := $(shell vim -e -s -c 'redi! > /dev/stdout | echo expand("$$VIMRUNTIME") | redi END | qa' | tail -n1)
	VIMRC_NAME := vimrc
else
	INSTALL_DIRECTORY := $(HOME)
	VIM_DIRECTORY := $(call path_append, $(INSTALL_DIRECTORY), .vim)
	VIMRC_NAME := .vimrc
endif


## Obtain directory path that this Makefile lives in
ROOT_DIRECTORY_PATH := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))


#
#    Override variables via optional configuration file
#
CONFIG_PATH := $(call path_append, $(ROOT_DIRECTORY_PATH), .config-make)
ifneq ("$(wildcard $(CONFIG_PATH))", "")
	include $(CONFIG_PATH)
endif


#
#    Make variables built from components
#
MAKE_PATH := $(call path_append, $(ROOT_DIRECTORY_PATH), Makefile)

GIT_MODULES_PATH := $(call path_append, $(ROOT_DIRECTORY_PATH), .gitmodules)

VIMRC__INSTALL_PATH := $(call path_append, $(INSTALL_DIRECTORY), $(VIMRC_NAME))
VIMRC__SOURCE_PATH := $(call path_append, $(ROOT_DIRECTORY_PATH), vimrc)

VIMRC_D__INSTALL_DIR := $(call path_append, $(INSTALL_DIRECTORY), .vimrc.d)
VIMRC_D__SOURCE_DIR := $(call path_append, $(ROOT_DIRECTORY_PATH), vimrc.d)

PLUG__INSTALL_DIRECTORY := $(call path_append, $(VIM_DIRECTORY), autoload)
PLUG__INSTALL_PATH := $(call path_append, $(PLUG__INSTALL_DIRECTORY), plug.vim)
PLUG__DOWNLOAD_URL := https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#
#    Make targets and settings
#
.ONESHELL: install uninstall upgrade

.PHONY: clean\
        config\
        install\
        uninstall\
        upgrade\
        git-checkout\
        git-track-changes\
        git-fetch\
        git-merge\
        git-submodule-update\
        link-all\
        unlink-all\
        link-vimrc\
        unlink-vimrc\
        link-vimrc-d\
        unlink-vimrc-d\
        plug-download\
        plug-install\
        plug-update\
        plug-upgrade\
        plug-uninstall\
        list

.SILENT: clean\
         config\
         install\
         uninstall\
         upgrade\
         git-checkout\
         git-track-changes\
         git-fetch\
         git-merge\
         git-submodule-update\
         link-all\
         unlink-all\
         link-vimrc\
         unlink-vimrc\
         link-vimrc-d\
         unlink-vimrc-d\
         plug-download\
         plug-install\
         plug-update\
         plug-upgrade\
         plug-uninstall\
         list


clean: SHELL := $(BASH_PATH)
clean: ## Removes configuration file
	[[ -f "$(CONFIG_PATH)" ]] && {
		rm -v "$(CONFIG_PATH)"
	}

config: SHELL := $(BASH_PATH)
config: ## Writes configuration file
	tee "$(CONFIG_PATH)" 1>/dev/null <<EOF
	INSTALL_DIRECTORY = $(INSTALL_DIRECTORY)
	__OS__ = $(__OS__)
	__PATH_SEPARATOR__ = $(__PATH_SEPARATOR__)
	GIT_REMOTE__BRANCH = $(GIT_REMOTE__BRANCH)
	GIT_REMOTE__NAME = $(GIT_REMOTE__NAME)
	GIT_LOCAL__BRANCH = $(GIT_LOCAL__BRANCH)
	VIM_DIRECTORY = $(VIM_DIRECTORY)
	# vim: filetype=make
	EOF


##
#
install: ## Runs targets -> link-all plug-download plug-install
install: | link-all git-checkout plug-download plug-install

uninstall: ## Runs targets -> unlink-all plug-uninstall
uninstall: unlink-all plug-clean plug-uninstall

upgrade: ## Runs targets -> unlink-all git-upgrades link-all plug-upgrade plug-update
upgrade: | unlink-all git-upgrades link-all plug-upgrade plug-update

git-upgrades: ## Runs targets -> 
git-upgrades: | git-checkout git-fetch git-track-changes git-merge git-submodule-update


##
#
git-checkout: SHELL := $(BASH_PATH)
git-checkout: ## Checkout Git branch to track local changes
	cd "$(ROOT_DIRECTORY_PATH)"
	_git_branches="$$(git branch --list)"
	_remote_branch="$(GIT_REMOTE__BRANCH)"
	_local_branch="$$(awk '$$0 ~ $(GIT_LOCAL__BRANCH) { gsub("[* ]", ""); print; }' <<<"$${_git_branches}" | head -1)"
	if (( "$${#_local_branch}" )); then
		git checkout "$${#_local_branch}"
	else
		git checkout -b "$${#_local_branch}"
	fi

git-track-changes: SHELL := $(BASH_PATH)
git-track-changes: ## Runs `git add --all && git commit -m ':robot: Tracks local customizations'`
	cd "$(ROOT_DIRECTORY_PATH)"
	if grep -qE -- '^Untracked files|^Changes to be committed|^Changes not staged' <<<"$$(git status)"; then
		git add --all && git commit -m ':robot: Tracks local customizations'
	fi

git-fetch: SHELL := $(BASH_PATH)
git-fetch: ## Fetches updates from Git remote
	cd "$(ROOT_DIRECTORY_PATH)"
	git fetch $(GIT_REMOTE__NAME) $(GIT_REMOTE__BRANCH)

git-merge: SHELL := $(BASH_PATH)
git-merge: ## Merges changes from Git remote
	cd "$(ROOT_DIRECTORY_PATH)"
	git merge --strategy-option ours --squash "$(GIT_REMOTE__BRANCH)"

git-submodule-update: SHELL := $(BASH_PATH)
git-submodule-update: ## Runs update commands for Git submodules
	cd "$(ROOT_DIRECTORY_PATH)"
	git submodule update --init --merge --recursive


##
#
link-all: ## Runs targets -> link-vimrc link-vimrc-d
link-all: link-vimrc link-vimrc-d

unlink-all: ## Runs targets -> unlink-vimrc unlink-vimrc-d
unlink-all: unlink-vimrc unlink-vimrc-d

link-vimrc: SHELL := $(BASH_PATH)
link-vimrc: ## Symbolically links project configuration file
	if [[ -L "$(VIMRC__INSTALL_PATH)" ]]; then
		printf >&2 'Link already exists -> %s\n' "$(VIMRC__INSTALL_PATH)"
	elif [[ -f "$(VIMRC__INSTALL_PATH)" ]]; then
		printf >&2 'Error link target is a file -> %s\n' "$(VIMRC__INSTALL_PATH)"
	else
		ln -sv "$(VIMRC__SOURCE_PATH)" "$(VIMRC__INSTALL_PATH)"
	fi

unlink-vimrc: SHELL := $(BASH_PATH)
unlink-vimrc: ## Removes symbolic links to project configuration file
	if [[ -L "$(VIMRC__INSTALL_PATH)" ]]; then
		rm -v "$(VIMRC__INSTALL_PATH)"
	elif [[ -f "$(VIMRC__INSTALL_PATH)" ]]; then
		printf >&2 'Error: link target is a file -> %s\n' "$(VIMRC__INSTALL_PATH)"
	else
		printf >&2 'Error: no link to remove at -> %s\n' "$(VIMRC__INSTALL_PATH)"
	fi

link-vimrc-d: SHELL := $(BASH_PATH)
link-vimrc-d: ## Symbolically links project vimrc.d directory file(s)
	linker() {
		local _source_path="$${1?No source path provided}"
		local _destination_path="$${2?No destination path provided}"
		if [[ -f "$${_source_path}" ]]; then
			if [[ -L "$${_destination_path}" ]]; then
				printf >&2 'Link already exists -> %s\n' "$${_destination_path}"
				return
			elif [[ -f "$${_destination_path}" ]]; then
				printf >&2 'File already exists -> %s\n' "$${_destination_path}"
				return
			fi
			ln -sv "$${_source_path}" "$${_destination_path}"
		elif [[ -d "$${_source_path}" ]]; then
			if ! [[ -d "$${_destination_path}" ]]; then
				mkdir -vp "$${_destination_path}"
			fi
			for _path in "$${_source_path}"/*; do
				linker "$${_path}" "$${_destination_path}/$${_path##*/}"
			done
		else
			printf 'Did not understand source path -> %s\n' "$${_source_path}"
			exit 1
		fi
	}
	linker "$(VIMRC_D__SOURCE_DIR)" "$(VIMRC_D__INSTALL_DIR)"

unlink-vimrc-d: SHELL := $(BASH_PATH)
unlink-vimrc-d: ## Removes symbolic links to project vimrc.d directory file(s)
	unlinker() {
		local _source_path="$${1?No source path provided}"
		local _destination_path="$${2?No destination path provided}"
		if [[ -f "$${_source_path}" ]]; then
			if [[ -L "$${_destination_path}" ]]; then
				rm "$${_destination_path}"
			elif [[ -f "$${_destination_path}" ]]; then
				printf >&2 'Not removing file -> %s\n' "$${_destination_path}"
			fi
		elif [[ -d "$${_source_path}" ]]; then
			if [[ -d "$${_destination_path}" ]]; then
				for _path in "$${_source_path}"/*; do
					unlinker "$${_path}" "$${_destination_path}/$${_path##*/}"
				done
				rmdir -v "$${_destination_path}" || {
					printf 'Failed to remove -> %s\n' "$${_destination_path}"
				}
			fi
		else
			printf 'Did not understand source path -> %s\n' "$${_source_path}"
			exit 1
		fi
	}
	unlinker "$(VIMRC_D__SOURCE_DIR)" "$(VIMRC_D__INSTALL_DIR)"


##
#
plug-clean: SHELL := $(BASH_PATH)
plug-clean: ## Runs `PlugClean` command within Vim Ex mode, which deletes unlisted plugins
	vim -c 'PlugClean' -c 'qa'

plug-download: SHELL := $(BASH_PATH)
plug-download: ## Downloads `plug.vim` script, if not already present, to `$(PLUG__INSTALL_PATH)`
	if [[ -f "$(PLUG__INSTALL_PATH)" ]]; then
		printf >&2 'Skipping download of -> %s\n' "$(PLUG__INSTALL_PATH)"
	else
		curl -fLo "$(PLUG__INSTALL_PATH)" --create-dirs "$(PLUG__DOWNLOAD_URL)"
	fi

plug-install: SHELL := $(BASH_PATH)
plug-install: ## Runs `PlugInstall` command within Vim Ex mode, which installs Vim plugins
	vim -c 'PlugInstall' -c 'qa'

plug-update: SHELL := $(BASH_PATH)
plug-update: ## Runs `PlugUpdate` command within Vim Ex mode, which updates Vim plugins
	vim -c 'PlugUpdate' -c 'qa'

plug-upgrade: SHELL := $(BASH_PATH)
plug-upgrade: ## Runs `PlugUpgrade` command within Vim Ex mode, which upgrades Plug script
	vim -c 'PlugUpgrade' -c 'qa'

plug-uninstall: SHELL := $(BASH_PATH)
plug-uninstall: ## 
	if [[ -f "$(PLUG__INSTALL_PATH)" ]]; then
		rm -v "$(PLUG__INSTALL_PATH)"
	else
		printf >&2 'Plug script not found -> %s\n' "$(PLUG__INSTALL_PATH)"
	fi


##
#
list: SHELL := $(BASH_PATH)
list: ## Lists available make commands
	gawk 'BEGIN {
		delete matched_lines
	}
	{
		if ($$0 ~ "^[a-z0-9A-Z-]{1,32}: [#]{1,2}[[:print:]]*$$") {
			matched_lines[length(matched_lines)] = $$0
		}
	}
	END {
		print "## Make Commands for $(NAME) ##\n"
		for (k in matched_lines) {
			split(matched_lines[k], line_components, ":")
			gsub(" ## ", "    ", line_components[2])
			print line_components[1]
			print line_components[2]
			if ((k + 1) != length(matched_lines)) {
				print
			}
		}
	}' "$(MAKE_PATH)"

