# My Vim Configuration for Vim 9.1



This repository contains my personal Vim configuration designed to enhance productivity for general programming, PHP development, and C/C++ workflows. It is optimized for Vim 9.1 and includes plugins and settings tailored for web development, assembly, and C/C++ projects.



---



## Features



- **General Enhancements**:

  - Line numbers (relative and absolute)

  - Smart indentation and tabs

  - Mouse support

  - Truecolor and styled underline support



- **Programming Language Support**:

  - **PHP**: Includes plugins for Laravel and PHP-specific enhancements

  - **C/C++**: Autocompletion and linting using `coc-clangd` and `YouCompleteMe`

  - **Assembly**: Syntax highlighting for ARM assembly (GNU Assembler)



- **Plugins for Productivity**:

  - **File Navigation**: FZF and NERDTree

  - **Version Control**: Fugitive and GitGutter

  - **Code Formatting**: ALE and Prettier

  - **Debugger**: Vimspector for debugging C/C++ projects



- **Theme**: Ayu (mirage variant)



---



## Requirements



1. **Vim 9.1 or higher**

   - Ensure your Vim installation is compiled with Python 3 support for plugins like YouCompleteMe and Coc.nvim.

   - For Linux, install Vim with `vim-gtk3` or build from source:

     ```bash

     sudo apt install vim-gtk3

     ```



2. **Plugin Manager**: [vim-plug](https://github.com/junegunn/vim-plug)

   - If not already installed, set it up by running:

     ```bash

     curl -fLo ~/.vim/autoload/plug.vim --create-dirs \

         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

     ```



3. **Dependencies**:

   - Node.js (for Coc.nvim and Prettier):

     ```bash

     sudo apt install nodejs npm

     ```

   - Composer (for PHPactor):

     ```bash

     sudo apt install composer

     ```

   - Python 3 (for YouCompleteMe):

     ```bash

     sudo apt install python3 python3-pip

     ```

   - Yarn (for vim-prettier):

     ```bash

     npm install --global yarn

     ```



---



## Installation



1. Clone this repository into your home directory:

   ```bash

   git clone https://github.com/imaarov/my-vim-config.git ~/.vim

