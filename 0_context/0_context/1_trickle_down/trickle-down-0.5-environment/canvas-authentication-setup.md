# Canvas Authentication Setup

This guide explains how to securely store Canvas credentials so that AI assistants can access Canvas assignment pages on your behalf.

## Security Overview

Your credentials are stored locally in a `.env` file that is:
- ✅ **Never committed** to version control (in `.gitignore`)
- ✅ **Stored locally** on your machine only
- ✅ **Accessed programmatically** via scripts (not exposed in code)
- ✅ **Used only by browser automation** that logs in as you would manually

## Setup Instructions

### Step 1: Create your `.env` file

```bash
# Copy the example file
cp .env.example .env

# Edit with your credentials
nano .env  # or use your preferred editor
```

### Step 2: Fill in your credentials

Edit `.env` and replace the placeholders:

```env
CANVAS_USERNAME=your_actual_username
CANVAS_PASSWORD=your_actual_password
CANVAS_BASE_URL=https://byui.instructure.com
```

**Important**: 
- BYU-I Canvas uses LDS Church SSO (Single Sign-On) authentication
- You'll be redirected to the LDS Church login page when accessing Canvas
- Use your **LDS Church account credentials** (same as other BYU-I systems)
- Username format: Usually just your username, no domain suffix
- The base URL is already set correctly for BYU-I Canvas

### Step 3: Secure the file

The `.env` file is automatically excluded from git (via `.gitignore`). To add extra security:

```bash
# Make file readable only by you (Linux/Mac)
chmod 600 .env

# Windows users: Right-click file → Properties → Security → Advanced
# Remove all users except yourself with "Read" permission only
```

### Step 4: Install required Python package

If not already installed, the helper script needs `python-dotenv`:

```bash
# Activate your virtual environment first
source .venv/bin/activate

# Install python-dotenv
pip install python-dotenv
```

### Step 5: Test the setup

```bash
# Test that credentials load correctly
python3 tools/canvas_authenticate.py
```

You should see:
```
✓ Credentials loaded successfully
  Username: you*** (hidden)
  Base URL: https://byui.instructure.com
```

## How It Works

When an AI assistant needs to access Canvas pages:

1. **Loads credentials** from `.env` file via `canvas_authenticate.py`
2. **Uses browser automation** (MCP browser tools) to:
   - Navigate to Canvas login page
   - Handle redirect to LDS Church SSO login page
   - Fill in your LDS Church username and password
   - Submit the form (this authenticates with LDS Church)
   - Follow redirect back to Canvas
   - Access the authenticated Canvas pages
3. **Never exposes credentials** in logs, code, or output

## Usage by AI Assistants

AI assistants can use this pattern:

```python
# Load credentials (AI can call this)
from tools.canvas_authenticate import load_canvas_credentials
creds = load_canvas_credentials()

# Use with browser automation
# (AI uses MCP browser tools with these credentials)
```

The credentials are only used during the session and never stored or exposed elsewhere.

## Security Best Practices

1. ✅ **Never commit `.env`** - Already in `.gitignore`
2. ✅ **Use `.env.example`** - Track structure without secrets
3. ✅ **Restrict file permissions** - Only you should read `.env`
4. ✅ **Rotate credentials** - If compromised, change password immediately
5. ✅ **Review browser automation** - Check what pages AI accesses

## Troubleshooting

### "Error: .env file not found"
- Make sure you created `.env` from `.env.example`
- Verify you're in the project root directory

### "Error: CANVAS_USERNAME and CANVAS_PASSWORD must be set"
- Check that `.env` file has both variables set
- Make sure there are no quotes around values (unless password contains special chars)
- Ensure no trailing spaces

### "ModuleNotFoundError: No module named 'dotenv'"
```bash
pip install python-dotenv
```

### Authentication fails
- Verify username is correct (usually without @byui.edu)
- Check password is correct
- Ensure 2FA (two-factor authentication) is not enabled on your account
  - If 2FA is enabled, you may need to use an app-specific password

## Privacy Notes

- Credentials are stored **only on your local machine**
- The AI assistant acts **on your behalf** (like you logging in manually)
- Canvas session cookies are **not stored** between sessions
- Each automation session **authenticates fresh**

## What Gets Stored

**Stored locally (`~/.env`):**
- Your Canvas username (plain text - necessary for login)
- Your Canvas password (plain text - necessary for login)
- Canvas URL (configuration - not sensitive)

**NOT stored:**
- Canvas session cookies
- Authentication tokens
- Assignment content (retrieved only during session)
- Any personal data beyond what's needed for login

## For AI Assistants Reading This

When accessing Canvas pages:
1. Call `load_canvas_credentials()` from `tools/canvas_authenticate.py`
2. Use MCP browser tools to navigate to Canvas login
3. Fill form fields with `creds['username']` and `creds['password']`
4. Submit and navigate to target assignment pages
5. Extract content needed for the task
6. Do NOT log or expose credentials in any output

---

**Last Updated**: Setup created for DS250 Course Draft project
**Location**: `/home/dawson/code/DS250-Course-Draft/.env` (create from `.env.example`)

