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

# Define the command flags:
FIND_R_EXAMPLES_FLAGS ?= \
	-type f \
	-name "$(R_EXAMPLES_PATTERN)" \
	-path "$(ROOT_DIR)/**/$(EXAMPLES_FOLDER)/**" \
	-regex "$(EXAMPLES_FILTER)" \
	$(FIND_EXAMPLES_EXCLUDE_FLAGS)


ifneq ($(OS), Darwin)
	FIND_R_EXAMPLES_FLAGS := -regextype posix-extended $(FIND_R_EXAMPLES_FLAGS)
endif

# Define a command to list example files:
FIND_R_EXAMPLES_CMD ?= find $(find_kernel_prefix) $(ROOT_DIR) $(FIND_R_EXAMPLES_FLAGS)

# Define the list of example files:
R_EXAMPLES ?= $(shell $(FIND_R_EXAMPLES_CMD))

# TODO: does not include top-level examples?


# TARGETS #

# List example files.
#
# This target prints a newline-delimited list of example files.

list-examples-r:
	$(QUIET) find $(find_kernel_prefix) $(ROOT_DIR) $(FIND_R_EXAMPLES_FLAGS) $(find_print_list)

.PHONY: list-examples-r
