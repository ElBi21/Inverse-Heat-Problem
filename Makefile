#
# Makefile for the NMPDE project
#

# Variables
UV_PATH  := $(shell which uv 2>/dev/null)
UV_EXEC  := $(if $(UV_PATH),$(UV_PATH),$(CURDIR)/tools/uv)
TOOLS_DIR := $(CURDIR)/tools


# Recipes
.PHONY: prepare build run

# Downloads uv if not present, and installs all packages
prepare:
	@if [ -n "$(UV_PATH)" ]; then \
		echo "Found uv in PATH: $(UV_EXEC)"; \
	else \
		echo "uv not found in PATH, downloading to $(TOOLS_DIR)..."; \
		mkdir -p "$(TOOLS_DIR)"; \
		curl -LsSf https://astral.sh/uv/install.sh | UV_INSTALL_DIR="$(TOOLS_DIR)" sh; \
	fi
	$(UV_EXEC) sync

# Trains the model for solving the inverse heat equation problem
train: prepare
	$(UV_EXEC) run ihp-train

# Makes inference on the model
infer: prepare
	$(UV_EXEC) run ihp-infer
