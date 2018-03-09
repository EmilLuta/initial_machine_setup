##################
# TERMINAL SETUP #
##################

# Install general libraries for dev
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install -y libxss1 libappindicator1 libindicator7 git neovim sublime-text-installer vlc browser-plugin-vlc curl python-pip python3-pip automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev


# Setup the configuration of bash
echo 'export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Finds a Python virtual environment in the current
# directory or any of its parents and enters it, or
# exits an virtual environment if we are in one
# but the current directory does not contain a virtualenv
function find_and_enter_virtualenv {
    # See if the current directory, or any of its
    # parents have a venv/bin/activate script
    path=$(pwd)
    while [ ! -z $path ]; do
        if [ -f "$path/venv/bin/activate" ]; then
            path="$path/venv/bin/activate"
            break
        fi

        path="${path%/*}"
    done

    # No virtualenv found, try to de-activate
    # in case we are exiting one
    if [ -z $path ]; then
        deactivate &> /dev/null
        return
    fi

    # Enter the virtualenv
    source $path

    # Fix up the command prompt to make it
    # clear we are in a virtual env
    export PS1="\n$REDBOLD\u $CYAN(venv)$RESETCOLOR $PURPLE@ $GREEN\w $RESETCOLOR$GREENBOLD → $RESETCOLOR"
}

# Override cd so we can intercept directory changes
function cd {
    builtin cd "$@"
    find_and_enter_virtualenv
}

# Suppose a bash prompt is opened and that directory
# is a virtual env, we will activate it!
find_and_enter_virtualenv


# Define colors
BLACK="\[\033[0;30m\]"
BLACKBOLD="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
REDBOLD="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
GREENBOLD="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
YELLOWBOLD="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BLUEBOLD="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
PURPLEBOLD="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
CYANBOLD="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
WHITEBOLD="\[\033[1;37m\]"
RESETCOLOR="\[\e[00m\]"

# Define prompt appearance
export PS1="\n$RED\u $PURPLE@ $GREEN\w $CYAN ~> $RESETCOLOR"
export PS2=" | ~> $RESETCOLOR"' >> ~/.bashrc

echo 'export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Finds a Python virtual environment in the current
# directory or any of its parents and enters it, or
# exits an virtual environment if we are in one
# but the current directory does not contain a virtualenv
function find_and_enter_virtualenv {
    # See if the current directory, or any of its
    # parents have a venv/bin/activate script
    path=$(pwd)
    while [ ! -z $path ]; do
        if [ -f "$path/venv/bin/activate" ]; then
            path="$path/venv/bin/activate"
            break
        fi

        path="${path%/*}"
    done

    # No virtualenv found, try to de-activate
    # in case we are exiting one
    if [ -z $path ]; then
        deactivate &> /dev/null
        return
    fi

    # Enter the virtualenv
    source $path

    # Fix up the command prompt to make it
    # clear we are in a virtual env
    export PS1="\n$REDBOLD\u $CYAN(venv)$RESETCOLOR $PURPLE@ $GREEN\w $RESETCOLOR$GREENBOLD → $RESETCOLOR"
}

# Override cd so we can intercept directory changes
function cd {
    builtin cd "$@"
    find_and_enter_virtualenv
}

# Suppose a bash prompt is opened and that directory
# is a virtual env, we will activate it!
find_and_enter_virtualenv


# Define colors
BLACK="\[\033[0;30m\]"
BLACKBOLD="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
REDBOLD="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
GREENBOLD="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
YELLOWBOLD="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BLUEBOLD="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
PURPLEBOLD="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
CYANBOLD="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
WHITEBOLD="\[\033[1;37m\]"
RESETCOLOR="\[\e[00m\]"

# Define prompt appearance
export PS1="\n$RED\u $PURPLE@ $GREEN\w $CYAN ~> $RESETCOLOR"
export PS2=" | ~> $RESETCOLOR"' >> /etc/bash.bashrc

# Get solarized themes
wget -O solarized https://raw.githubusercontent.com/EmilLuta/Gogh/master/themes/solarized-dark-higher-contrast.sh && chmod a+x solarized && ./solarized && rm solarized

wget -O solarized https://raw.githubusercontent.com/EmilLuta/Gogh/master/themes/solarized-dark.sh && chmod a+x solarized && ./solarized && rm solarized

# Install chrome
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i chrome.deb
sudo rm chrome.deb

# Install fzy
wget -O fzy.deb https://github.com/jhawthorn/fzy/releases/download/0.9/fzy_0.9-1_amd64.deb
sudo dpkg -i fzy.deb
sudo rm fzy.deb

# Install ag
git clone https://github.com/ggreer/the_silver_searcher.git
cd the_silver_searcher
./build.sh
sudo make install
cd ..
sudo rm -r the_silver_searcher

# Instal crappy skype
sudo apt install apt-transport-https
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
echo "deb https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skypeforlinux.list
sudo apt update
sudo apt install skypeforlinux

# Properly set launcher left tab
gsettings set com.canonical.Unity.Launcher favorites "['nautilus-home.desktop', 'google-chrome.desktop', 'gnome-terminal.desktop', 'unity-control-center.desktop', 'gnome-system-monitor.desktop', 'skype.desktop']"

# Allow plugins and Neovim to work nicely
pip install --upgrade pip
pip3 install --upgrade pip
pip install neovim
pip install isort
sudo pip install autopep8
sudo pip install autoflake

# Install NeoVIM Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

################
# EDITOR SETUP #
################

mkdir ~/.config/nvim
echo "\" Enable 256 colors
set t_Co=256
set encoding=utf-8

\" This is required for Python plugin
\" support when running Neovim in a virtualenv
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

call plug#begin('~/.config/nvim/bundle')
\" Color scheme
Plug 'altercation/vim-colors-solarized'

\" Auto-fix tools
Plug 'fisadev/vim-isort'
Plug 'tell-k/vim-autopep8'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'tell-k/vim-autoflake'

\" Syntax Highlighting
Plug 'justinmk/vim-syntax-extra'
Plug 'octol/vim-cpp-enhanced-highlight'

\" File browsing
Plug 'cloudhead/neovim-fuzzy'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

\" Status line plugins
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'

\" Apply
call plug#end()

\" Enable spell checking for MarkDown
autocmd FileType markdown setlocal spell
autocmd FileType text setlocal spell

\" Enable syntax highlighting
syntax on

\" Set the colorscheme
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
set background=dark

\" Allow backspacing over multiple lines
set backspace=indent,eol,start

\" Highlight search matches
set hlsearch

\" Better command line completion
set wildmenu
set showcmd

\" Enable line numbers
set number

\" Enable smart indenting
set autoindent
set smartindent

\" Set tab width, 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

\" Enable use of the mouse for all modes
set mouse=a

\" Share clipboard with the system
set clipboard+=unnamedplus

\" Always display the status line
set laststatus=2

\" Hide the stupid "-- INSERT --"
set noshowmode

\" Disable backup files
set nobackup
set noswapfile

\" Enhanced C++ syntax highlighting
let g:cpp_experimental_template_highlight = 1
let g:cpp_class_scope_highlight = 1

\" NerdTree configuration
let NERDTreeIgnore = ['\.o$']
let NERDTreeShowHidden=1

\" Ctrl + f configuration
let g:ctrlf_match_window = 'top,order:btt,min:1,max:10,results:10'
let g:ctrlf_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|env|(.*)egg-info|htmlcov|node_modules|staticfiles|webpack_output)$',
  \ 'file': '\v\.(pyc|o)$',
  \ }

\" AutoPep8 configuration
let g:autopep8_disable_show_diff=1

\" ISort configuration
let g:isort_options = {
  \ 'from_first': 1,
  \ }

\" Autoflake configuration
let g:autoflake_disable_show_diff=1
let g:autoflake_remove_all_unused_imports=1
let g:autoflake_remove_unused_variables=1

\" Shortcuts
nnoremap <C-f> :FuzzyOpen<CR>
nnoremap <C-v> :StripWhitespace<CR> :Autoflake<CR><CR> :Isort<CR> :Autopep8<CR> :echo \"→ Python auto-tools ran.\"<CR>
nnoremap <CR> :noh<CR><CR> :echo \"→ Cleared search highlighing\"<CR>

\" Easier split window switching
nnoremap <leader>w :wincmd k<CR>
nnoremap <leader>s :wincmd j<CR>
nnoremap <leader>a :wincmd h<CR>
nnoremap <leader>d :wincmd l<CR>

\" Easier window splitting
nnoremap <leader>d :vnew<CR>
nnoremap <leader><S-d> :new<CR>

\" Don't autofold code
let g:pymode_folding = 0

\" LightLine config
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
" >> ~/.config/nvim/init.vim

# Install all plugs
nvim +'PlugInstall' +qa
