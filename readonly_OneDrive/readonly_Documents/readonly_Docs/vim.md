# NVchad

In edit mode
	Ctrl + b - move beginning of line
	Ctrl + e - move end of line
	Ctrl + h,j,k,l - move cursor around
	
In edit mode
	Ctrl + h,j,k,l - move around panes
	Ctrl + s - general save file
	Ctrl + c - general copy whole file

<leader>fm - general format file"

<tab> / <S-tab> - switch between buffers

x - close buffer

`<leader>/`- toggle comment

`<C-n>` - nvimtree toggle window
`<leader>e` - nvimtree focus window

`<leader>fz` - telescope find in current buffer
`<leader>ff` - telescope find files
`<leader>fa` - telescope find all files

`<leader>fw` - telescope live grep
`<leader>fo` - telescope find oldfiles

`<leader>h` - terminal new horizontal term

`<A-h>` - terminal toggleable horizontal term

`<A-i>` - terminal toggle floating term

<leader>th - telescope nvchad themes

! - View posiable motion list

theme - gatekeeper

---

# LazyVim

Ctrl + h,j,k,l - move around buffers

Ctrl + up,down,left,right - change window size

<A-j> / <A-k> - move line up, down

<S-h> / [b - previous buffer
<S-l> / ]b - next buffer
<leader>bb / <leader>` - Switch to Other Buffer
<leader>, - Buffers
<leader>bd - delete buffer

<leader><leader> - search files
<leader>/ - grep

<C-s> - save file

< / > - v - indenting

gcc - comment
gco - add comment below
gcO - add comment above

<leader>ss - quickly jump to a function in the current buffer

<leader>xq - quickfix list
[q / ]q - previous, next quickfix

<leader>cf - format

<leader>cd - Line Diagnostics
]d / ]d - previous, next Diagnostic
]e / ]e - previous, next Error
]w / ]w - previous, next Warning

<leader>qq - Quit All

<leader>ft - Terminal
<C-/> - show, hide terminal

<leader>gg - LazyGit
<leader>gf - Git Current File History

<leader>sk - View keymap list

<C-n> / <C-p> - Next, Previos in context menu

[ / ] - Jump action 

leap.nvim - s{char}

chechhealth

LazyExtars - install extra plugins

---

### mini.surround

add = "gsa", -- Add surrounding in Normal and Visual modes
delete = "gsd", -- Delete surrounding
find = "gsf", -- Find surrounding (to the right)
find_left = "gsF", -- Find surrounding (to the left)
highlight = "gsh", -- Highlight surrounding
replace = "gsr", -- Replace surrounding
update_n_lines = "gsn", -- Update `n_lines`

---

i / a - Insert mode / Append text before / after curser
I / A - Insert mod line start/end
o / O - Open up a line below / above and put into insert mod
w / e / b - Jump to next / previous word

0 - To move to the start of the line
$ - To move to the end of the line
^ / _ - Move to the first non-whitespace character in the line
g_ - Move to the last non-whitespace character in the line
A - Jump to the last character and switch to insert mode

i <c-w> - delete a word
i <c-u> - delete to the start of the line

i <c-o><any normal mode command> - Run any normal mode cpmmand in insert mod 

v i<char> / a<char> - select between given char
v ib / ab - select inside ()
v iB / aB - select inside {}

di<char> / ci<char> - delete everything between given char
dib / cib - delete everything between ()
diB / ciB - delete everything between {}

dgg / dG - delete everything

:m +/-[n] - move line

. - replay previous action

~  Toggle case
g~w - toggle case word
g~it - toggle case inner text

gg=G re indent the hole file

% - jump between matching item

<c-z> - put vim in background
fg in terminal - brinng vim to forground

m[lower case latter] - mark position in file
'[lower case latter] - jump to that position
use uppercase latter to jump between files

J, gJ - join lines

<c-a> / <c-x> - increase/decrease numeric values
select and <c-a> / <c-x> to increase multiple
select and g<c-a> / g<c-x> to increase multiple seperately

in visual mode press o to change direction
select between - vi[char] / va[char]

* - search under cursor
n - next match
N - previous match

:$s/<word>/<replace with>/gc

\<{word}\> - Grep match whole word

ZZ / :wqa / :xa - save and quit all
:wq / :x - save and quit
ZQ / :qa! - save and quit all
:q! - save and quit

---

## grep

' - precise search
^ - start with
$ - end with
!- inverse precise match

^core go$ | rb$ | py$ - matches entries that start with core and end with 
						either go, rb, or py

---

## Edit multiple lines - https://youtu.be/RdyfT2dbt78?t=116
V the select lines
i then do necessary changes then esc
gv get last helighted text
$ go to end of line
A to append to end then esc

---

## Find and replace		https://youtu.be/vjzp_IpD61Y?t=717	https://youtu.be/AuXZA-xCv04

n <Space>xQ                 <Cmd>Trouble qflist toggle<CR> Quickfix List (Trouble)
n <Space>xq                 callback        Quickfix List          ⋮LazyVim/lua/lazyvim/config/keymaps.lua:106
n <Space>sq                 callback        Quickfix List          ⋮LazyVim/…/editor/snacks_picker.lua:104
n ]q                        callback        Next Trouble/Quickfix Item   ⋮LazyVim/lua/lazyvim/plugins/editor.lua:229
n [q 
 
grep word
<c-q>
:cdo s/<word>/<replace>/gc
ccl - close quickfix

cfdo $s/<word>/<replace>/g | update | bd

cfdo bd - close all buffers in quickfix

cdo - action will be applied to every entry in the quickfix window.

cfdo - action will be applied to each file in the quickfix window

---

# NVim Tree

space + e - Open File Explore
a - Create new file
d - Delete file
/ - Search file
I - will toggle visibility of hidden folders/files
H - will toggle visibility of dotfiles (files/folders starting with a .)

---

# tmux

<prefix>:new - new session

<prefix>$ - rename session

C-a (          previous session
C-a )          next session
C-a L          ‘last’ (previously used) session
C-a s          choose a session from a list

<prefix>c - new window

<prefix>, - rename window

C-a &          kill the current window

C-a 1 ...      switch to window 1, ..., 9, 0
C-a 9
C-a 0
C-a p          previous window
C-a n          next window
C-a l          ‘last’ (previously used) window
C-a w          choose window from a list


C-a "          split vertically (top/bottom)
C-a %          split horizontally (left/right)

C-a left       go to the next pane on the left
C-a right      (or one of these other directions)
C-a up
C-a down
C-a o          go to the next pane (cycle through all of them)
C-a ;          go to the ‘last’ (previously used) pane

<prefix>F - search commands

:list-keys

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

nvim .config/tmux/tmux.conf

<prefix>I - install plugins
<prefix>r - reload tmux config

---


i / a - Insert mode / Append text before / after curser

I / A - Insert mod line start/end

o / O - Open up a line below / above and put into insert mod

w / e / b - Jump to next / previous word

2w - To move the cursor two words forward (Start of word)

3e / 3b - To move the cursor to the end of the third word forward (End of word)

---

0 - To move to the start of the line

$ - To move to the end of the line

^ / _ - Move to the first non-whitespace character in the line

g_ - Move to the last non-whitespace character in the line

A - Jump to the last character and switch to insert mode

---

x - Delete letter

dw - Delete until the start of the next word, EXCLUDING its first character

de - Delete to the end of the current word, INCLUDING the last character

d$ - Delete from curser to line end

d2w - To delete next two words

2dd - Delete two line

dd - Delete the line and store it in a Neovim register.

diw - Delete current word

di" - Delete between quotes

da" - Delete everything including quotes

dG - Delete everything after the cursor

ctrl + w - Delete word in insert mod

c - Same as delete but change into insert mode (Change Operator)

ce - Delete to the end of the word and change into insert mode

ciw - Change the whole word under the cursor

cw - Change the word from the current cursor position

u - Undo previous actions

U - Undo all changes on a line

ctrl + r - Redo

p - Paste

r[x] - Replace letter

R - Replace mode

---

ctrl + g - Print current line

gg - Jump to start of the file

G - Jump to end of the file

[number]j/k - Jump to given line number

---

f[character] - Find next character forward
F[character] - Find next character backward

; / , Repeat search forward / backward

t – one character before found character, forward search
T – one character before found character, backward search
f – just before found character, forward search
F – just before found character, backward search

---

/ - Find in file

n / N - Go to next / previous find

? - Find backward

% - Jump to matching bracket

:s/thee/the/ - Replace first match

:s/thee/the/gi - With Confirmation

:s/thee/the/gc - Case-Insensitive

:s/thee/the/g - Replace all matches in line

:%s/thee/the/g - Replace all matches

---

v - Visual mod

V - Visual line mod

---

y - Yank

yy - Copy the current line in vi
3yy - Copy (yank) 3 lines starting from your cursor position.
y$ - Copy everything from the cursor to the end of the line
y^ - Copy everything from the start of the line to the cursor.
yiw - Copy the current word.

p - Paste

P - Paste after cursor

---

. - Repeat last command

* / # - search for a word under the cursor forward/backward

<< / >> - Indent

gg=G - Fix indent all lines

S - Goto correct indent in line

J - Join current line to above line

~ / u / U - Change text case

Ctrl + o (insert mod) - Temporarily switch to normal mode

ctrl + o / i - Jump to previous / next curser position

~ - Toggle case

m[charater] - Mark position under cursor
` - List added marks

ctrl + b - Move a page screen back or “up”
ctrl + f - Move a page screen front or “down”
ctrl + u - Move a ½ page screen up
ctrl + d - Move a ½ page screen down

ZZ - Save and exit
ZQ - Exit without saving

zz - Move the current line to the center of the screen
zt - Move the current line to the top of the screen
zb - Move the current line to the bottom of the screen

z. - Current line of code to the middle
z + Enter - Current line of code to the top
Z- - Current line of code to the bottom

{ / } - Jump to next empty line

---

ctrl + l/h/j/k - Jump between buffers and file explore

ctrl + w + s - Horizontal split

ctrl + w + v - Vertical split

ctrl + w + q - Close buffers

space + f - Find files

space + s + t - Find text

space + b + n - Next buffer

space + b + b - Previous buffer

ctrl + \ - Inbuilt Terminal

:set nu - Show line numbers

---

gd - Go to Definition (🔥)
gmd - Peek Definition
gh - Show Hover (🔥)
gi - Go to Implementations (🔥)
gmi - Peek Implementations
gq - Quick fix (open the code action lightbulb menu)
gr - Go to References (🔥)
gt - Go to Type Definition (🔥)
gmt - Peek Type Definition

shift + H - Previous buffer
shift + E - Next buffer

space + v - Split buffer vertical
space + s - Split buffer horizontal

space + h/j/k/l - Move between buffers

space + f - Format Document

space + o - Quick open file

< / > (V) - Indent in/out

J / K (V) - Move selection down/up

## File Explorer

space + e - Focus file explore

n - New File
f - New Folder
r - Rename
x - Cut
y - Copy
p - Paste
D - Delete

---

## Macro

q[character] - Start recording macro
	Press q again to stop recording

@[character] - Replay macro
@@ - Replay last used macro


---

## Working with multiple files

ctrl + wq / ctrl + wc - quit a window

---

https://docs.google.com/spreadsheets/d/15k_UgeY0C3j8tVQnR2hD_kNljB1AApG3x3gYrKtUAlw/edit?gid=1082709605#gid=1082709605

---

## Lazygit

space - Stage or unstage file

a - Stage all files

c - Commit

h/l - Switch between panes

p - Push

---
## chezmoi

chezmoi init

chezmoi add ~/.bashrc

chezmoi diff

chezmoi re-add

chezmoi -v apply

chezmoi cd

chezmoi init https://github.com/wanvidu/dotfiles.git

chezmoi update -v

chezmoi init --apply wanvidu

winget install twpayne.chezmoi

brew install chezmoi

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply wanvidu

rsync -azp --delete ~/.zshrc ~/.nanorc ~/.config/nvim ~/.config/tmux ~/.config/yazi ~/.config/zellij  /mnt/c/Users/wanvi

---

## NVim Install

& $profile 

dir env:

echo $env:APPDATA

echo $env:LOCALAPPDATA

echo $env:OneDrive

git clone --depth 1 https://github.com/LazyVim/starter $ENV:USERPROFILE\AppData\Local\nvim-distro\lazyvim

git clone --depth 1 https://github.com/AstroNvim/template $ENV:USERPROFILE\AppData\Local\nvim-distro\astrovim

git clone --depth 1 https://github.com/NormalNvim/NormalNvim.git $ENV:USERPROFILE\AppData\Local\nvim-distro\normalnvim

git clone --depth 1 https://github.com/nvim-lua/kickstart.nvim.git $ENV:USERPROFILE\AppData\Local\nvim-distro\kickstartnvim

# Update

Lazy sync

:AstroUpdate (<Leader>pa) 

## Remove

rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data

---

# Yazi

q - Quit the process

Q - Quit the process without outputting cwd-file

g - Goto

d - Trash selected files
D - Permanently delete selected files
a - Create a file (ends with / for directories)
r - Rename selected file(s)

y	Yank selected files (copy)
x	Yank selected files (cut)
p	Paste yanked files
P	Paste yanked files (overwrite if the destination exists)
Y or X	Cancel the yank status

s	Search files by name using fd
S	Search files by content using ripgrep
Ctrl + s	Cancel the ongoing search

c - copy file path

m - file info

H - go back to previous directory
L - go back to next directory

t	Create a new tab with CWD
1, 2, ..., 9	Switch to the N-th tab
[	Switch to the previous tab
]	Switch to the next tab
{	Swap current tab with previous tab
}	Swap current tab with next tab
Ctrl + c	Close the current tab

z - zoxide
Z - fzf

~ - Shortcut List

https://github.com/sxyazi/yazi/blob/shipped/yazi-config/preset/keymap-default.toml

https://github.com/ajeetdsouza/zoxide

https://github.com/junegunn/fzf

New-Item -Path $env:APPDATA\yazi\config -ItemType SymbolicLink -Value $env:OneDrive\Documents\Docs\yazi\config

* Run as Admin
[System.Environment]::SetEnvironmentVariable('YAZI_FILE_ONE',"C:\Program Files\Git\usr\bin\file.exe", 'User')

ya pack -a tkapias/moonfly

> theme.toml

[flavor]
dark  = "moonfly"
light = "moonfly"

wget -qO yazi.zip https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-musl.zip

unzip -q yazi.zip -d yazi-temp

sudo mv yazi-temp/*/yazi /usr/local/bin

yazi --version

rm -rf yazi-temp yazi.zip

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

---
# Zoxide

z
zi

zoxide query  -als

### Setup

Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

* Run as Admin
[System.Environment]::SetEnvironmentVariable('_ZO_DATA_DIR',"$env:OneDrive\Documents\Docs\zoxide", 'User')

zoxide init powershell

eval "$(zoxide init zsh --cmd cd)"

# fzf

CTRL-T - search file and folders

ALT-C - search folders

wget -qO fzf.tar.gz https://github.com/junegunn/fzf/releases/latest/download/fzf-0.60.0-linux_amd64.tar.g

tar -xvzf fzf.tar.gz

sudo mv fzf /usr/local/bin

rm fzf.tar.gz

fzf --version

---

## Zellij



---

## Bat

sudo apt install bat

alias c="batcat"

---

## Nano

Alt+\  - to go to the first line 

Alt+/  - to go to the last line


---

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

brew install rbenv

rbenv init

rbenv install  -l

rbenv install 3.3.0

sudo gem install cocoapods

---

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install ncdu nvim yazi fd ripgrep fzf zoxide eza bat tmux zellij font-symbols-only-nerd-font

---

echo $0

sudo apt install zsh -y
sudo apt install ncdu -y

chsh -s `which zsh`

exec bash -l
exec zsh -l

wget -qO nvim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
 
tar -xvzf nvim.tar.gz
 
sudo mv nvim-linux-x86_64/bin/nvim /usr/bin/

nvim --version	# If this is not working use homebrew

rm -r nvim-linux-x86_64 nvim.tar.gz


sudo apt-get install ripgrep

rg --version

sudo apt install build-essential

gcc --version

git clone https://github.com/NvChad/starter ~/.config/nvim && nvim



wget -qO 7z.tar.gz https://7-zip.org/a/7z2409-linux-x64.tar.xz



bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

exec zsh



curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

export PATH=~/.local/bin:$PATH


wget -qO fzf.tar.gz https://github.com/junegunn/fzf/releases/latest/download/fzf-0.60.0-linux_amd64.tar.g

tar -xvzf fzf.tar.gz

sudo mv fzf /usr/local/bin

rm fzf.tar.gz

fzf --version



sudo apt install bat
sudo apt install fd


sudo apt update
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza



sudo apt install jq poppler-utils fd-find ripgrep imagemagick -y

wget -qO yazi.zip https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-musl.zip

unzip -q yazi.zip -d yazi-temp

sudo mv yazi-temp/*/yazi /usr/local/bin

yazi --version

rm -rf yazi-temp yazi.zip

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


sudo apt install tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux source ~/.tmux.conf


wget -qO zellij.tar.gz https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz

tar -xvf zellij*.tar.gz

chmod +x zellij

sudo mv zellij /usr/local/bin

rm zellij.tar.gz






---

ssh -t -t whiz@161.35.175.23 "w"

---

# Add new user
* in root
adduser whiz
usermod -aG sudo whiz
su - whiz
sudo ls -la /root

# SSH

ssh-keygen -t ed25519 -C "whizchain19@gmail.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

sudo chown -R user:user /home/whiz/.ssh

sudo chmod 700 /home/whiz/.ssh

sudo chmod 600 /home/whiz/.ssh/*

ssh-add /home/whiz/.ssh/ultimate_pos_github


nano /home/whiz/.ssh/config

IdentityFile /home/whiz/.ssh/ultimate_pos_github
IdentityFile /home/whiz/.ssh/whizchain_new_github

www.pos.whizchain.com

C:\WINDOWS\system32\wsl.exe --distribution-id {d39d9c88-9c75-40ee-80d5-b986d3186f97} --cd ~

