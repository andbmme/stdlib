#/
# @license Apache-2.0
#
# Copyright (c) 2017 The Stdlib Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#/

# VARIABLES #

# Define the path of the linter executable:
FILENAME_LINTER ?= $(TOOLS_PKGS_DIR)/lint/filenames/bin/cli

# Define the command-line options to be used when invoking the executable:
FILENAME_LINTER_FLAGS ?=

# Define the path of the linter executable for header filenames:
HEADER_FILENAME_LINTER ?= $(TOOLS_PKGS_DIR)/lint/header-filenames/bin/cli

# Define the command-line options to be used when invoking the executable:
HEADER_FILENAME_LINTER_FLAGS ?=


# RULES #

#/
# Lints filenames.
#
# @example
# make lint-filenames
#/
lint-filenames:
	$(QUIET) $(MAKE_EXECUTABLE) $(FILENAME_LINTER)
	$(QUIET) NODE_PATH="$(NODE_PATH)" $(FILENAME_LINTER) $(FILENAME_LINTER_FLAGS) $(ROOT_DIR)

.PHONY: lint-filenames

#/
# Lints header filenames.
#
# @example
# make lint-header-filenames
#/
lint-header-filenames:
	$(QUIET) $(MAKE_EXECUTABLE) $(HEADER_FILENAME_LINTER)
	$(QUIET) NODE_PATH="$(NODE_PATH)" $(HEADER_FILENAME_LINTER) $(HEADER_FILENAME_LINTER_FLAGS) $(ROOT_DIR)

.PHONY: lint-header-filenames
