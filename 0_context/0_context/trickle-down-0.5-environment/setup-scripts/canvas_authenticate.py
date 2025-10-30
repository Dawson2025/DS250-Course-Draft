#!/usr/bin/env python3
"""
Canvas Authentication Helper

Loads credentials from .env file and provides authentication data
for browser automation tools. This script does NOT store credentials
in the codebase or expose them in output.

NOTE: BYU-I Canvas uses LDS Church SSO authentication. The browser
automation will be redirected to the LDS Church login page first,
then back to Canvas after successful authentication.
"""

import os
import sys
from pathlib import Path
from dotenv import load_dotenv

def load_canvas_credentials():
    """Load Canvas credentials from .env file"""
    # Load .env file from project root
    # File is in: 0_context/0_context/trickle-down-0.5-environment/setup-scripts/
    # Project root is 5 levels up
    project_root = Path(__file__).parent.parent.parent.parent.parent.parent
    env_file = project_root / '.env'
    
    if not env_file.exists():
        print(f"Error: .env file not found at {env_file}")
        print("Create one by copying .env.example and filling in your credentials")
        sys.exit(1)
    
    # Load environment variables
    load_dotenv(env_file)
    
    username = os.getenv('CANVAS_USERNAME')
    password = os.getenv('CANVAS_PASSWORD')
    base_url = os.getenv('CANVAS_BASE_URL', 'https://byui.instructure.com')
    
    if not username or not password:
        print("Error: CANVAS_USERNAME and CANVAS_PASSWORD must be set in .env file")
        sys.exit(1)
    
    return {
        'username': username,
        'password': password,
        'base_url': base_url
    }

if __name__ == '__main__':
    # For testing - just verify credentials are loaded (don't print them)
    creds = load_canvas_credentials()
    print(f"✓ Credentials loaded successfully")
    print(f"  Username: {creds['username'][:3]}*** (hidden)")
    print(f"  Base URL: {creds['base_url']}")
