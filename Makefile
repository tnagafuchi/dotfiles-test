DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

# Do everything.
all: init brew link

# Set initial preference.
init:
	shell/init.sh

# Link dotfiles.
link:
	shell/link.sh

# Set macOS system preferences.
defaults:
	shell/defaults.sh

# Install macOS applications.
brew:
	shell/brew.sh

# Commint and Push repo
repo-update:
	shell/repo-push.sh