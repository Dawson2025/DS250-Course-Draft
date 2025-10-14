Codex on Windows — recommended workflow (repo-level notes)

This project includes helper scripts to set up OpenAI Codex on Windows using WSL2.

Short guide

1. Enable WSL and install a Linux distribution (Ubuntu recommended):

   - Run `docs/setup_wsl.ps1` from an elevated PowerShell (Admin). The script can call `wsl --install` and will launch a WSL shell.

2. Inside WSL, install Node and Codex:

   - Run `bash ./docs/install_codex_in_wsl.sh` inside WSL. This installs nvm, Node 22, and `@openai/codex` globally.

3. Developer workflow recommendations:

   - Keep code inside WSL home (e.g., `~/code`) — working under `/mnt/c/...` is slower.
   - Open the project from the WSL shell in VS Code (`code .`) so extensions run inside WSL and can find the `codex` binary.

Troubleshooting

- If `codex` isn't found in VS Code's WSL terminal, verify with `which codex` in WSL.
- If npm native builds fail, the PowerShell script can optionally install Visual Studio Build Tools via winget.

See `docs/CODACE_WINDOWS_README.md` for the detailed helper files.
