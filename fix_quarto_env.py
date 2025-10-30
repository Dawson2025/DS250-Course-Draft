#!/usr/bin/env python3
"""Ensure Canvas environment variables exist in .env file (even if empty)."""

import os
from pathlib import Path
from dotenv import load_dotenv, set_key

project_root = Path(__file__).parent
env_file = project_root / '.env'
env_example_file = project_root / '.env.example'

if not env_example_file.exists():
    print(f"Error: .env.example not found at {env_example_file}")
    exit(1)

# Load variables from .env.example
example_vars = {}
with open(env_example_file, 'r') as f:
    for line in f:
        line = line.strip()
        if line and not line.startswith('#'):
            key_value = line.split('=', 1)
            if len(key_value) == 2:
                example_vars[key_value[0]] = key_value[1]
            elif len(key_value) == 1:  # Handle cases like VAR=
                example_vars[key_value[0]] = ""

# Ensure .env exists
if not env_file.exists():
    with open(env_file, 'w') as f:
        pass  # Create empty .env file

# Load existing .env variables
load_dotenv(env_file)

# Check and add missing variables from .env.example to .env with empty values
updated = False
for key in example_vars:
    if os.getenv(key) is None:
        set_key(str(env_file), key, "")
        print(f"Added missing variable '{key}' to .env with an empty value.")
        updated = True

if updated:
    print(".env file updated to include all variables from .env.example with empty values if missing.")
else:
    print(".env file already contains all variables from .env.example.")

