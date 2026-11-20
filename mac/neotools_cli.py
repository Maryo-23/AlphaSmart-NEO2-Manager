#!/usr/bin/env python3
"""Frozen-binary wrapper for the neotools CLI, bundled inside the Mac .app."""
import sys

from neotools.cli import cli

if __name__ == "__main__":
    sys.exit(cli())
