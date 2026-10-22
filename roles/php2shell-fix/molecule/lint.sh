#!/usr/bin/env bash
# Runs before Molecule creates a container. Molecule 26 has no lint action.
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
cd "${root}"

yamllint .
ansible-lint
