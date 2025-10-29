Codex on Windows — quick helper

This folder contains helper scripts and instructions to follow the OpenAI Codex "Running Codex on Windows" guidance.

Summary
- Recommended: run Codex inside WSL2 (Ubuntu or another distro).
- This README and scripts automate the common steps in the official guide: install WSL, install Node.js (via nvm) inside WSL, install Codex package, and provide notes for VS Code and troubleshooting.

Files
- `setup_wsl.ps1` — PowerShell script to enable WSL and open a WSL shell. Run in an elevated PowerShell.
- `install_codex_in_wsl.sh` — script to run inside WSL to install nvm, Node.js 22, and `@openai/codex` globally.

Usage
1. Open PowerShell as Administrator and run:

    .\0_context\0_context\1_trickle_down\trickle-down-0.5-environment\setup-scripts\setup_wsl.ps1

   This script will enable the WSL optional feature and prompt you to restart if needed. It will then launch a WSL shell (you may need to re-run to continue after a restart).

2. In WSL (or after running the WSL shell), run the installer script:

    bash ~/install_codex_in_wsl.sh

   Or, from inside WSL after cloning this repo, run:

    . ./0_context/0_context/1_trickle_down/trickle-down-0.5-environment/setup-scripts/install_codex_in_wsl.sh

3. After installation, in WSL verify the `codex` binary is available:

    which codex || echo "codex not found"

4. Recommended workflow notes:
- Keep repositories in your WSL home directory (e.g., `~/code`) for better performance than `/mnt/c/...`.
- If using VS Code, open the project in the WSL remote (`code .` from the WSL shell) so the extension runs inside WSL.

Troubleshooting & links
- If native builds fail, install Visual Studio Build Tools or Visual C++ redistributable in Windows.
- Links:
  - Official guide: https://developers.openai.com/codex/windows
  - WSL install: https://learn.microsoft.com/en-us/windows/wsl/install
  - Node & nvm: https://github.com/nvm-sh/nvm

License: MIT (you can modify these helper scripts for your environment)
