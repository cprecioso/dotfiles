#!/usr/bin/env zsh
# shellcheck shell=bash

# XDG Overrides
export ANDROID_HOME="${XDG_DATA_HOME}"/android
export ASDF_DATA_DIR="${XDG_DATA_HOME}"/asdf
export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}"/aws/config
export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}"/aws/credentials
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export CARGO_HOME="${XDG_DATA_HOME}"/cargo
export COMPOSER_CACHE_DIR=$XDG_CACHE_HOME/composer
export COMPOSER_HOME=$XDG_CONFIG_HOME/composer
export DOCKER_CONFIG="${XDG_CONFIG_HOME}"/docker
export FLY_CONFIG_DIR="$XDG_STATE_HOME"/fly
export GEM_HOME="${XDG_DATA_HOME}"/gem
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}"/gem
export GNUPGHOME="${XDG_DATA_HOME}"/gnupg
export GOPATH="${XDG_DATA_HOME}"/go
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export JJ_CONFIG="${XDG_CONFIG_HOME}/jj/config.toml"
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export MINIKUBE_HOME="${XDG_DATA_HOME}"/minikube
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export PKGX_DIR="${XDG_STATE_HOME}/pkgx-dir"
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export RUSTUP_HOME="${XDG_DATA_HOME}"/rustup
export STACK_ROOT="$XDG_DATA_HOME"/stack
export STACK_XDG=1
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant

# shellcheck disable=SC2139
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
