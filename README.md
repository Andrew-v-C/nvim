# Required external setup


## Setting up the terminal/shell
- Install a Nerd Font (e.g. JetBrainsMono)
- Install Git
- On Windows: install PowerShell (not the pre-installed Windows PowerShell)
- Install terminal of choice (e.g. Alacritty)
- Configure terminal settings (default shell, font, color scheme, etc.)


## Required languages
- Python
- C/C++ (libraries and default compiler)
  - Windows: install Visual Studio Build Tools; add "Desktop development with C++" workload
  - Linux: pre-installed


## Required package managers
- Native package manager (e.g. winget, apt); should be pre-installed
  - Unless otherwise specified, use this to install
- npm
  - Windows: `winget install OpenJS.NodeJS`
  - Linux: `sudo apt install npm`
- pip (for managing Python libraries inside of virtual environments)
  - Windows: likely installed alongside Python
  - Linux: `sudo apt install pip`
- pipx (for managing Python applications to be accessed globally)
  - Windows: see [installation instructions](https://pipx.pypa.io/stable/installation)
  - Linux: `sudo apt install pipx`


## Tree-sitter
- Install tree-sitter-cli: `(sudo) npm install -g tree-sitter-cli`
- On Linux: install curl (pre-installed on Windows)


## Language tools

### Lua (for editing Neovim config)
- lua-language-server
  - Windows: `winget install LuaLS.lua-language-server`
  - Linux:
    - Download [latest release](https://github.com/LuaLS/lua-language-server/releases/latest)
    - Add to PATH (in .profile), e.g. `export PATH=$PATH:~/.Software/lua-language-server/bin`

### Python
- Pyright: `(sudo) npm install -g pyright`
- Black: `pipx install black`

### C/C++
- CMake
- clang
  - Windows:
    - Install LLVM: `winget install LLVM.LLVM`
    - Add `C:\Program Files\LLVM\bin` to Path environment variable
  - Linux: `sudo apt install clang`
- clangd
- clang-format
- Ninja build system
- Conan: `pipx install conan`

### Arduino
- Arduino CLI
  - Windows: `winget install ArduinoSA.CLI`
  - Linux: install from [releases](https://github.com/arduino/arduino-cli/releases/latest)
- Create config file: `arduino-cli config init`
- arduino-language-server
  - Download executable from [latest release](https://github.com/arduino/arduino-language-server/releases/latest)
  - Place in a folder in Path
#### When creating a new sketch
- Create a file named `sketch.yaml` with the following lines:
  - `default_fqbn: <FQBN>`
  - `default_port: <Port>`

