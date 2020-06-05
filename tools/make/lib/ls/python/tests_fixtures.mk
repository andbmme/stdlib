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
FIND_PYTHON_TESTS_FIXTURES_FLAGS ?= \
	-type f \
	-name "$(PYTHON_TESTS_FIXTURES_PATTERN)" \
	-path "$(ROOT_DIR)/**/$(TESTS_FIXTURES_FOLDER)/**" \
	-regex "$(TESTS_FIXTURES_FILTER)" \
	$(FIND_TESTS_FIXTURES_EXCLUDE_FLAGS)

ifneq ($(OS), Darwin)
	FIND_PYTHON_TESTS_FIXTURES_FLAGS := -regextype posix-extended $(FIND_PYTHON_TESTS_FIXTURES_FLAGS)
endif

# Define a command to list files:
FIND_PYTHON_TESTS_FIXTURES_CMD ?= find $(find_kernel_prefix) $(ROOT_DIR) $(FIND_PYTHON_TESTS_FIXTURES_FLAGS)

# Define the list of files:
PYTHON_TESTS_FIXTURES ?= $(shell $(FIND_PYTHON_TESTS_FIXTURES_CMD))


# TARGETS #

# List test fixture files.
#
# This target prints a newline-delimited list of test fixture files.

list-tests-fixtures-python:
	$(QUIET) find $(find_kernel_prefix) $(ROOT_DIR) $(FIND_PYTHON_TESTS_FIXTURES_FLAGS) $(find_print_list)

.PHONY: list-tests-fixtures-python
