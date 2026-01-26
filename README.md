## Required external setup
- Note: unless otherwise specified, use native package manager (e.g. winget, apt) to install
### Setting up the terminal/shell
- Install a Nerd Font (e.g. JetBrainsMono)
- Install Git
- On Windows: install PowerShell (not the pre-installed Windows Powershell)
- Ensure terminal of choice (e.g. Alacritty) is installed
- Configure terminal settings (default shell, font, color scheme, etc.)
### Setting up Neovim
#### General:
- Install npm (needed for some packages):
  - Windows: `winget install OpenJS.NodeJS`
  - Linux: `sudo apt install npm`
- Install tree-sitter-cli: `(sudo) npm install -g tree-sitter-cli`
#### For editing Lua files (i.e. Neovim config):
- Install lua-language-server:
  - Windows: `winget install LuaLS.lua-language-server`
  - Linux:
    - Download [latest release](https://github.com/LuaLS/lua-language-server/releases/latest)
    - Add to PATH (in .profile), e.g. `export PATH=$PATH:~/.Software/lua-language-server/bin`
#### C/C++ toolchain:
- On Windows: install Visual Studio Build Tools; add "Desktop development with C++" workload
- Install CMake
- Install clang compiler:
  - Windows:
    - Install LLVM: `winget install LLVM.LLVM`
    - Add `C:\Program Files\LLVM\bin` to Path environment variable
  - Linux: `sudo apt install clang`
- Install Ninja build system
- Install clangd
#### Python toolchain:
- Ensure Python is installed
- Ensure pip is installed
- Install Pyright: `(sudo) npm install -g pyright`
- Install Black: `pip install black`
