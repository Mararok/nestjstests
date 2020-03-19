export BIN_SCRIPTS_ROOT_PATH = ./bin
export DOCKERUTIL_PATH = $(BIN_SCRIPTS_ROOT_PATH)/util/dockerutil
export MAKEHELP_PATH = $(BIN_SCRIPTS_ROOT_PATH)/util/MakeHelp
export PROJECT = nestjstests
export DEFAULT_SUBPROJECT = none
export SUBPROJECT ?= $(DEFAULT_SUBPROJECT)
export ENV ?= dev
export BIN_SCRIPTS_PATH = bin/$(ENV)

ifeq "$(ENV)" "dev"
export VERSION = dev
endif

INFO = Showing targets for all of ENV(default: dev) and SUBPROJECT(default: $(DEFAULT_SUBPROJECT))
EXTRA_MAKE_ARGS = ENV=test|prod SUBPROJECT=$(SUBPROJECTS)
HELP_TARGET_MAX_CHAR_NUM = 30
HAS_DEPS = yes
.DEFAULT_GOAL := help
include $(MAKEHELP_PATH)

ifneq ($(MAKECMDGOALS),)
ifneq ($(MAKECMDGOALS),help)
ifndef VERSION
$(error VERSION is not set)
endif
endif
endif

## Installs yarn and Link local packages together and install remaining package dependencies
bootstrap: 
	@lerna bootstrap --concurrency 4

## shorthand for "yarn workspaces info"
show_subprojects:
	@yarn workspaces info

## Runs build command in selected subproject
subproject_lint: 
	@yarn workspace ${SUBPROJECT} run lint

## Runs build command in selected subproject
subproject_build: 
	@yarn workspace ${SUBPROJECT} run build

## Runs test command in selected subproject
subproject_test: 
	@yarn workspace ${SUBPROJECT} run test

ifeq "$(ENV)" "prod"
# prod targets
endif

ifeq "$(ENV)" "dev"
## Runs dev command in selected subproject
subproject_dev: 
	@yarn workspace ${SUBPROJECT} run dev

endif