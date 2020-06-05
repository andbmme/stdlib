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

# RULES #

#/
# Runs R benchmarks consecutively.
#
# ## Notes
#
# -   The recipe assumes that benchmark files can be run via R.
# -   This rule is useful when wanting to glob for R benchmark files (e.g., run all R benchmarks for a particular package).
#
#
# @param {string} [BENCHMARKS_FILTER] - file path pattern (e.g., `.*/math/base/special/expm1/.*`)
#
# @example
# make benchmark-r
#
# @example
# make benchmark-r BENCHMARKS_FILTER=.*/math/base/special/expm1/.*
#/
benchmark-r:
	$(QUIET) $(FIND_R_BENCHMARKS_CMD) | grep '^[\/]\|^[a-zA-Z]:[/\]' | while read -r file; do \
		echo ""; \
		echo "Running benchmark: $$file"; \
		$(MAKE_EXECUTABLE) $$file && $$file || exit 1; \
	done

.PHONY: benchmark-r

#/
# Runs a specified list of R benchmarks consecutively.
#
# ## Notes
#
# -   The recipe assumes that benchmark files can be run via R.
# -   This rule is useful when wanting to run a list of R benchmark files generated by some other command (e.g., a list of changed R benchmark files obtained via `git diff`).
#
#
# @param {string} FILES - list of R benchmark file paths
#
# @example
# make benchmark-r-files FILES='/foo/benchmark.R /bar/benchmark.R'
#/
benchmark-r-files:
	$(QUIET) for file in $(FILES); do \
		echo ""; \
		echo "Running benchmark: $$file"; \
		$(MAKE_EXECUTABLE) $$file && $$file || exit 1; \
	done

.PHONY: benchmark-r-files
