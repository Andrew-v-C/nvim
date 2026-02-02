# Required external setup
- Note: unless otherwise specified, use native package manager (e.g. winget, apt) to install


## Setting up the terminal/shell
- Install a Nerd Font (e.g. JetBrainsMono)
- Install Git
- On Windows: install PowerShell (not the pre-installed Windows PowerShell)
- Ensure terminal of choice (e.g. Alacritty) is installed
- Configure terminal settings (default shell, font, color scheme, etc.)


## Prerequisites for Neovim
- Install npm (needed for some packages):
  - Windows: `winget install OpenJS.NodeJS`
  - Linux: `sudo apt install npm`
- Install tree-sitter-cli: `(sudo) npm install -g tree-sitter-cli`


## Toolchain setup

### Lua (for editing Neovim config)
- Install lua-language-server:
  - Windows: `winget install LuaLS.lua-language-server`
  - Linux:
    - Download [latest release](https://github.com/LuaLS/lua-language-server/releases/latest)
    - Add to PATH (in .profile), e.g. `export PATH=$PATH:~/.Software/lua-language-server/bin`

### C/C++
- On Windows: install Visual Studio Build Tools; add "Desktop development with C++" workload
- Install CMake
- Install clang compiler:
  - Windows:
    - Install LLVM: `winget install LLVM.LLVM`
    - Add `C:\Program Files\LLVM\bin` to Path environment variable
  - Linux: `sudo apt install clang`
- Install Ninja build system
- Install clangd

### Python
- Ensure Python is installed
- Ensure pip is installed
- Install Pyright: `(sudo) npm install -g pyright`
- Install Black: `pip install black`

### Arduino
- C/C++ should already be set up
- Install Arduino CLI
  - Windows: `winget install ArduinoSA.CLI`
  - Linux: install from [releases](https://github.com/arduino/arduino-cli/releases/latest)
- Create config file: `arduino-cli config init`
- Install arduino-language-server
  - Download executable from [latest release](https://github.com/arduino/arduino-language-server/releases/latest)
  - Place in a folder that's in Path
#### When creating a new sketch
- Create a file named `sketch.yaml` with the following lines:
  - `default_fqbn: <FQBN>`
  - `default_port: <Port>`

