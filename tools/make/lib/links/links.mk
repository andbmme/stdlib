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

# Define the command for inserting a link into the database:
LINKS_INSERT ?= $(NODE) $(TOOLS_PKGS_DIR)/links/create/bin/cli

# Define the command-line options to be used when executing the command:
LINKS_INSERT_FLAGS ?= \
	--database $(ROOT_DIR)/docs/links/database.json

# Define the command for resolving an id from a URI:
LINKS_URI2ID ?= $(NODE) $(TOOLS_PKGS_DIR)/links/uri2id/bin/cli

# Define the command-line options to be used when executing the command:
LINKS_URI2ID_FLAGS ?= \
	--database $(ROOT_DIR)/docs/links/database.json

# Define the command for resolving a URI from an id:
LINKS_ID2URI ?= $(NODE) $(TOOLS_PKGS_DIR)/links/id2uri/bin/cli

# Define the command-line options to be used when executing the command:
LINKS_ID2URI_FLAGS ?= \
	--database $(ROOT_DIR)/docs/links/database.json


# RULES #

#/
# Launches an interactive prompt for creating a link entry in the project's link database.
#
# @example
# make links-insert
#/
links-insert: $(NODE_MODULES)
	$(QUIET) NODE_PATH="$(NODE_PATH)" $(LINKS_INSERT) $(LINKS_INSERT_FLAGS)

.PHONY: links-insert

#/
# Launches an interactive prompt for resolving a link identifier in the project's link database from a URI.
#
# @example
# make links-uri2id
#/
links-uri2id: $(NODE_MODULES)
	$(QUIET) NODE_PATH="$(NODE_PATH)" $(LINKS_URI2ID) $(LINKS_URI2ID_FLAGS)

.PHONY: links-uri2id

#/
# Launches an interactive prompt for resolving a URI in the project's link database from a link identifier.
#
# @example
# make links-id2uri
#/
links-id2uri: $(NODE_MODULES)
	$(QUIET) NODE_PATH="$(NODE_PATH)" $(LINKS_ID2URI) $(LINKS_ID2URI_FLAGS)

.PHONY: links-id2uri
