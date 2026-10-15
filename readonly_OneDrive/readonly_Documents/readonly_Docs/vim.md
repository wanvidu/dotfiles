# Command Reference

## Shortcuts

### LazyVim

- `Ctrl + h/j/k/l` - move around buffers
- `Ctrl + Up/Down/Left/Right` - change window size
- `<A-j>` / `<A-k>` - move line down/up
- `Ctrl + q` - visual block mode
- `Ctrl + o` - execute normal mode commands in insert mode
- `<S-h>` / `[b` - previous buffer
- `<S-l>` / `]b` - next buffer
- `<leader>bb` / `<leader>\`` - switch to other buffer
- `<leader>,` - buffers
- `<leader>bd` - delete buffer
- `<leader><leader>` - search files
- `<leader>/` - grep
- `<C-s>` - save file
- `<` / `>` in visual mode - indenting
- `gcc` - comment
- `gco` - add comment below
- `gcO` - add comment above
- `<leader>ss` - quickly jump to a function in the current buffer
- `<leader>xq` - quickfix list
- `[q` / `]q` - previous/next quickfix item
- `<leader>cf` - format
- `<leader>cd` - line diagnostics
- `[d` / `]d` - previous/next diagnostic
- `[e` / `]e` - previous/next error
- `[w` / `]w` - previous/next warning
- `<leader>qq` - quit all
- `<leader>ft` - terminal
- `<C-/>` - show/hide terminal
- `<leader>gg` - LazyGit
- `<leader>gf` - git current file history
- `<leader>sk` - view keymap list
- `<C-n>` / `<C-p>` - next/previous in context menu
- `[` / `]` - jump action
- `leap.nvim` - `s{char}`

### yazi.nvim

- `<F1>` - show the help menu
- `<C-v>` - open the selected file(s) in vertical splits
- `<C-x>` - open the selected file(s) in horizontal splits
- `<C-t>` - open the selected file(s) in new tabs
- `<C-q>` - send the selected file(s) to the quickfix list
- `<C-s>` - search in the current yazi directory using telescope's `live_grep`
- `<C-g>` - search and replace in the current yazi directory using grug-far
- `<C-y>` - copy the relative path of the selected file(s) to the clipboard
- `<Tab>` - make yazi jump to the open buffers in Neovim

### mini.surround

- `gsa` - add surrounding in Normal and Visual modes
- `gsd` - delete surrounding
- `gsf` - find surrounding to the right
- `gsF` - find surrounding to the left
- `gsh` - highlight surrounding
- `gsr` - replace surrounding
- `gsn` - update `n_lines`

### Vim / Neovim Basics

#### Insert, append, and movement

- `i` / `a` - insert mode / append before or after cursor
- `I` / `A` - insert at line start/end
- `o` / `O` - open a line below/above and enter insert mode
- `w` / `e` / `b` - jump to next word / end of word / previous word
- `2w` - move two words forward
- `3e` / `3b` - move to the end/back by three words
- `0` - move to the start of the line
- `$` - move to the end of the line
- `^` / `_` - move to the first non-whitespace character in the line
- `g_` - move to the last non-whitespace character in the line
- `A` - jump to the last character and switch to insert mode
- `i <C-o><normal-mode-command>` - run a normal mode command in insert mode
- `f<char>` / `F<char>` - jump to character forward/backward
- `t<char>` / `T<char>` - jump to one character before the found character forward/backward
- `;` / `,` - repeat search forward/backward
- `<num>gg` / `<num>G` - jump to line
- `<num>+` / `<num>j` and `<num>-` / `<num>k` - jump by relative line number
- `gg` - jump to start of the file
- `G` - jump to end of the file
- `[number]j/k` - jump to given line number
- `ctrl + g` - print current line
- `%` - jump between matching items or brackets
- `*` / `#` - search for word under cursor forward/backward
- `n` / `N` - next/previous match
- `?` - find backward
- `{` / `}` - jump to next empty line
- `ctrl + b` / `ctrl + f` - move a full page up/down
- `ctrl + u` / `ctrl + d` - move a half page up/down
- `zz` - center current line
- `zt` - move current line to the top of the screen
- `zb` - move current line to the bottom of the screen
- `z.` - current line to the middle
- `z + Enter` - current line to the top
- `Z-` - current line to the bottom
- `Ctrl + o` (insert mode) - temporarily switch to normal mode
- `ctrl + o` / `ctrl + i` - jump to previous/next cursor position
- `<C-z>` - put Vim in background
- `fg` in terminal - bring Vim to foreground

#### Text objects, selection, delete, and change

- `v i<char>` / `a<char>` - select between given character pair
- `v ib` / `ab` - select inside/around `()`
- `v iB` / `aB` - select inside/around `{}`
- `select between` - `vi[char]` / `va[char]`
- `v` - visual mode
- `V` - visual line mode
- `o` in visual mode - change selection direction
- `x` - delete character
- `dw` - delete until the start of the next word, excluding its first character
- `de` - delete to the end of the current word, including the last character
- `d$` - delete from cursor to line end
- `d2w` - delete the next two words
- `2dd` - delete two lines
- `dd` - delete the line and store it in a Neovim register
- `di<char>` / `ci<char>` - delete/change everything between a given char pair
- `dib` / `cib` - delete/change everything between `()`
- `diB` / `ciB` - delete/change everything between `{}`
- `diw` - delete current word
- `di"` - delete between quotes
- `da"` - delete everything including quotes
- `dt<char>` - delete up to next char
- `df<char>` - delete including next char
- `dgg` / `dG` - delete everything before/after through file range
- `daw` - delete the word under the cursor
- `caw` - delete the word under the cursor and enter insert mode
- `ctrl + w` in insert mode - delete word
- `c` - same as delete but enter insert mode
- `ce` - delete to the end of the word and enter insert mode
- `ciw` - change the whole word under the cursor
- `cw` - change the word from the current cursor position
- `r[x]` - replace character
- `R` - replace mode
- `.` - replay previous action
- `u` - undo previous action
- `U` - undo all changes on a line
- `ctrl + r` - redo

#### Yank, paste, case, indent, and joins

- `y` - yank
- `yy` - copy the current line
- `3yy` - copy 3 lines from cursor position
- `y$` - copy from cursor to line end
- `y^` - copy from line start to cursor
- `yiw` - copy the current word
- `p` - paste
- `P` - paste after cursor
- `<<` / `>>` - indent
- `gg=G` - re-indent the whole file
- `S` - go to correct indent in line
- `J` / `gJ` - join lines
- `J` in visual mode / `K` in visual mode - move selection down/up
- `~` - toggle case
- `g~w` - toggle case for word
- `g~it` - toggle case for inner text
- `~ / u / U` - change text case
- `<C-a>` / `<C-x>` - increase/decrease numeric values
- select and `<C-a>` / `<C-x>` - increase/decrease multiple values
- select and `g<C-a>` / `g<C-x>` - increase/decrease multiple values separately
- `:m +/-[n]` - move line
- `ZZ` / `:wqa` / `:xa` - save and quit all
- `:wq` / `:x` - save and quit
- `ZQ` / `:qa!` - quit without saving / quit all without saving
- `:q!` - quit without saving

#### Marks, windows, buffers, and file explorer

- `m[lowercase letter]` - mark position in file
- `'[lowercase letter]` - jump to that position
- use uppercase letters to jump between files
- `` ` `` - list added marks
- `ctrl + l/h/j/k` - jump between buffers and file explorer
- `ctrl + w + s` - horizontal split
- `ctrl + w + v` - vertical split
- `ctrl + w + q` - close buffers
- `ctrl + wq` / `ctrl + wc` - quit a window
- `space + f` - find files / format document (appears in different mappings)
- `space + s + t` - find text
- `space + b + n` - next buffer
- `space + b + b` - previous buffer
- `ctrl + \` - inbuilt terminal
- `:set nu` - show line numbers
- `shift + H` - previous buffer
- `shift + E` - next buffer
- `space + v` - split buffer vertical
- `space + s` - split buffer horizontal
- `space + h/j/k/l` - move between buffers
- `space + o` - quick open file

#### LSP and code navigation

- `gd` - go to definition
- `gmd` - peek definition
- `gh` - show hover
- `gi` - go to implementations
- `gmi` - peek implementations
- `gq` - quick fix / open the code action lightbulb menu
- `gr` - go to references
- `gt` - go to type definition
- `gmt` - peek type definition

### Search, Grep, Quickfix, and Replace

#### Grep

- `'` - precise search
- `^` - start with
- `$` - end with
- `!` - inverse precise match
- `^core go$ | rb$ | py$` - matches entries that start with `core` and end with `go`, `rb`, or `py`
- `*` - search under cursor
- `n` / `N` - next/previous match

#### Current buffer search

- `/` - search current buffer / find in file
- `n` / `N` - next/previous result
- `:s/thee/the/` - replace first match
- `:s/thee/the/gi` - with confirmation
- `:s/thee/the/gc` - case-insensitive
- `:s/thee/the/g` - replace all matches in line
- `:%s/thee/the/g` - replace all matches
- `\<{word}\>` - grep match whole word
- `FzfLua grep_curbuf`
- `<C-q>` - send to quickfix
- shortcut - `<leader>se`

#### Quickfix and multi-file replace

- `n <Space>xQ` - `<Cmd>Trouble qflist toggle<CR>`
- `n <Space>xq` - callback quickfix list
- `n <Space>sq` - callback quickfix list
- `n ]q` - callback next Trouble/quickfix item
- `n [q`
- `grep word`
- `<C-q>`
- `:cdo s/<word>/<replace>/gc`
- `ccl` - close quickfix
- `cfdo $s/<word>/<replace>/g | update | bd`
- `cfdo bd` - close all buffers in quickfix
- `cdo` - action will be applied to every entry in the quickfix window
- `cfdo` - action will be applied to each file in the quickfix window

#### Editing multiple lines

- `V` - select lines
- `i` then do necessary changes, then `Esc`
- `gv` - get last highlighted text
- `$` - go to end of line
- `A` - append to end, then `Esc`

References:
- https://youtu.be/RdyfT2dbt78?t=116
- https://youtu.be/vjzp_IpD61Y?t=717
- https://youtu.be/AuXZA-xCv04

### NvimTree / File Explorer

#### NvimTree

- `space + e` - open file explorer / focus file explorer
- `a` / `n` - create new file
- `f` - new folder
- `d` / `D` - delete
- `/` - search file
- `r` - rename
- `x` - cut
- `y` - copy
- `p` - paste
- `I` - toggle visibility of hidden folders/files
- `H` - toggle visibility of dotfiles

### Macros

- `q[character]` - start recording macro
- press `q` again to stop recording
- `@[character]` - replay macro
- `@@` - replay last used macro

### tmux

- `shift + scroll up` - scroll up
- `shift + mouse select` - select
- `<prefix>:new` - new session
- `<prefix>$` - rename session
- `<prefix>(` - previous session
- `<prefix>)` - next session
- `<prefix>L` - last used session
- `<prefix>s` - choose a session from a list
- `<prefix>c` - new window
- `<prefix>,` - rename window
- `<prefix>&` - kill the current window
- `<prefix>1 ... 9, 0` - switch to a numbered window
- `<prefix>p` - previous window
- `<prefix>n` - next window
- `<prefix>l` - last used window
- `<prefix>w` - choose window from a list
- `<prefix>"` - split vertically (top/bottom)
- `<prefix>%` - split horizontally (left/right)
- `<prefix>left/right/up/down` - move between panes
- `<prefix>o` - cycle through panes
- `<prefix>;` - last used pane
- `<prefix>F` - search commands
- `:list-keys` - list keys
- `<prefix>I` - install plugins
- `<prefix>r` - reload tmux config

### LazyGit

- `space` - stage or unstage file
- `a` - stage all files
- `c` - commit
- `h/l` - switch between panes
- `p` - push

### Yazi

- `q` - quit the process
- `Q` - quit without outputting `cwd-file`
- `ctrl + u/d` - up/down half
- `K` / `J` - seek up/down 5 units in preview
- `gg` / `G` - go to top/bottom
- `g` - goto
- `d` - trash selected files
- `D` - permanently delete selected files
- `a` - create a file (ends with `/` for directories)
- `r` - rename selected file(s)
- `y` - yank selected files (copy)
- `x` - yank selected files (cut)
- `p` - paste yanked files
- `P` - paste yanked files and overwrite if destination exists
- `Y` or `X` - cancel yank status
- `s` - search files by name using `fd`
- `S` - search files by content using `ripgrep`
- `Ctrl + s` - cancel ongoing search
- `c` - copy file path
- `m` - file info
- `H` - go back to previous directory
- `L` - go forward to next directory
- `t` - create a new tab with CWD
- `1`..`9` - switch to the N-th tab
- `[` / `]` - previous/next tab
- `{` / `}` - swap current tab with previous/next tab
- `Ctrl + c` - close the current tab
- `ctrl + a` - select all
- `ctrl + r` - invert selection
- `tab` - file info
- `z` - zoxide
- `Z` - fzf
- `-` - symlink the absolute path of yanked files
- `_` - symlink the relative path of yanked files
- `Ctrl + -` - hardlink yanked files
- `f` - find
- `,` - sort
- `w` - task show
- `C` - zip selection
- `R` - sudo command list
- `~` - shortcut list

### Ranger

- `Z` - zoxide
- `Alt + f` - fzf
- `g` - move to
- `a` / `A` / `F2` / `cw` - rename file
- `zh` - show hidden files
- `m + <key>` - add bookmark to current directory
- `'` - view bookmarks
- `v` / `V` / `space` - selection
- `Ctrl + n` - create new tab
- `Ctrl + w` / `q` - close current tab
- `Tab` / `shift + Tab` - switch between tabs
- `g` - navigation and tabs
- `r` - `:open_with`
- `y` - yank (copy)
- `d` - cut/delete
- `p` - paste
- `o` - sort
- `c` - rename
- `.` - `filter_stack`
- `z` - change settings
- `u` - undo
- `M` - linemode
- `+`, `-`, `=` - set access rights to files
- `?` - help

### Zoxide, fzf, Nano, and Zsh

#### Zoxide

- `z`
- `zi`
- `zoxide query -als`

#### fzf

- `CTRL-T` - search files and folders
- `ALT-C` - search folders

#### Nano

- `Alt + Shift + #` - toggle line number
- `Alt+\` - go to the first line
- `Alt+/` - go to the last line
- `ctrl + z` - suspend
- `jobs` - list jobs
- `fg` - return to last suspended process
- `bg` - send to background
- `%<num>` - bring job to foreground
- `fg %<num>` - return to given suspended job
- `bg %<num>` - send given process to background
- `kill %<num>` - kill given process

#### Zsh

- `Alt + f` - complete word
- `Ctrl + l` - clear screen
- `F2` - toggle autosuggestion view

---

## General Server Commands

### System Information and Basic Setup

```bash
lsb_release -a

echo $0

sudo apt update && sudo apt dist-upgrade -y && sudo reboot

chsh -s `which zsh`

exec bash -l

exec zsh -l

sudo apt install build-essential

sudo apt install nginx

sudo apt install -y zsh neovim ranger ripgrep fzf zoxide eza bat tmux ncdu unzip wget 7zip jq poppler-utils fd-find imagemagick

curl -fsSL https://yazi-rs.github.io/builds/yazi-keyring.gpg | sudo tee /usr/share/keyrings/yazi-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/yazi-keyring.gpg] https://yazi-rs.github.io/builds/ stable main' | sudo tee /etc/apt/sources.list.d/yazi.list >/dev/null
sudo apt update && sudo apt install yazi

```

### User Management

```bash
adduser whiz
usermod -aG sudo whiz
su - whiz
sudo ls -la /root
```

### SSH

```bash
ssh-keygen -t ed25519 -C "whizchain19@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

```
ssh-keygen -t ed25519 -a 100 -C "admin@dokploy" -f ~/.ssh/dokploy -N ""
```

nano ~/.ssh/config
```
Host myserver
    HostName 192.168.1.100
    User ubuntu
    Port 22
    IdentityFile ~/.ssh/my_ed25519_key
    IdentitiesOnly yes
```

```
ssh myserver
```

```
ssh-copy-id -i ~/.ssh/my_ed25519_key.pub ubuntu@192.168.1.100
```

Append public key to `~/.ssh/authorized_keys` file

### Swap

```bash
swapon --show
free -h

# Create a 16 GiB file
sudo fallocate -l 16G /swapfile

# Restrict access
sudo chmod 600 /swapfile

# Format it as swap
sudo mkswap /swapfile

# Enable it immediately
sudo swapon /swapfile

echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

sudo swapoff /swapfile
sudo swapon -a
swapon --show
```


### Firewall and Nginx

```bash
sudo ufw allow 'Nginx Full'
sudo ufw allow 'OpenSSH'
sudo ufw enable
sudo ufw status

sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
sudo certbot --nginx -d example.com -d <www.example.com>
```

### PHP / Laravel

```bash
composer install
/usr/bin/php8.1 /usr/bin/composer install

php artisan storage:link

mkdir -p storage/framework/cache/data
mkdir -p storage/framework/sessions
mkdir -p storage/framework/views

php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear
composer dump-autoload

sudo find . -type f -exec chmod 644 {} \;
sudo find . -type d -exec chmod 755 {} \;

sudo chmod -R 2775 storage/app storage/framework storage/logs bootstrap/cache
sudo chown -R whiz:vpsusers storage/app storage/framework storage/logs bootstrap/cache

sudo chmod -R 660 storage/oauth-public.key
sudo chmod -R 660 storage/oauth-private.key
```

### MySQL

```bash
sudo apt install mysql-server

sudo systemctl status mysql
sudo systemctl restart mysql

sudo mysql_secure_installation

sudo mysql
sudo mysql -u root
mysql -u root -p
```

```sql
SELECT user,authentication_string,plugin,host FROM mysql.user;

ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'password';

CREATE USER 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' WITH GRANT OPTION;

CREATE USER 'user'@'%' IDENTIFIED WITH caching_sha2_password BY 'password';
GRANT ALL PRIVILEGES ON _._ TO 'user'@'localhost' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON <db name>.\* TO 'user'@'localhost';
FLUSH PRIVILEGES;
SHOW PRIVILEGES;
SHOW GRANTS FOR 'user'@'%';

DROP USER 'user'@'%';
```

```sql
GRANT SELECT, INSERT, UPDATE, DELETE
ON `myapp`.*
TO 'app_user'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE,
      CREATE, ALTER, INDEX, DROP
ON `myapp`.*
TO 'app_migrator'@'%';

GRANT SELECT
ON `myapp`.*
TO 'app_report'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON appdb.* TO 'app_user'@'10.%';

```

Edit config:

```bash
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```

```bash
[mysqld]
# Basic identity
server_id=101
port=3306
bind_address=0.0.0.0

# Paths
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
pid-file=/var/run/mysqld/mysqld.pid

# Character set
character-set-server=utf8mb4
collation-server=utf8mb4_0900_ai_ci

# InnoDB
default_storage_engine=InnoDB
innodb_buffer_pool_size=12G
innodb_buffer_pool_instances=8
innodb_log_file_size=2G
innodb_flush_method=O_DIRECT
innodb_flush_log_at_trx_commit=1
innodb_file_per_table=1

# Connections
max_connections=300
max_allowed_packet=128M
thread_cache_size=100
table_open_cache=4000
table_definition_cache=4000

# Temp and sort
tmp_table_size=128M
max_heap_table_size=128M

# Binary logging / PITR / replication
log_bin=mysql-bin
binlog_format=ROW
binlog_expire_logs_seconds=604800
sync_binlog=1

# Relay log settings if replica later
relay_log_recovery=ON

# Slow query log
slow_query_log=ON
slow_query_log_file=/var/log/mysql/slow.log
long_query_time=1
min_examined_row_limit=100

# Error logging
log_error=/var/log/mysql/error.log

# Performance Schema
performance_schema=ON

# Name resolution
skip_name_resolve=ON
```

MySQL privileges apply at different scopes: some can be granted on a specific database like `myapp.*`, while many administrative and dynamic privileges are **global-only**. To see the exact privilege set your server supports, use `SHOW PRIVILEGES;`. ([MySQL Developer Zone][1])

#### Cheat sheet

* **Read/write**

  * Privileges: `SELECT`, `INSERT`, `UPDATE`, `DELETE`
  * Typical use: Normal application runtime
  * Safe for app user: Yes

* **Schema changes**

  * Privileges: `CREATE`, `ALTER`, `INDEX`, `DROP`
  * Typical use: Migrations / deploy jobs
  * Safe for app user: Usually separate user

* **Stored code**

  * Privileges: `EXECUTE`, `CREATE ROUTINE`, `ALTER ROUTINE`
  * Typical use: Procedures / functions
  * Safe for app user: Only if needed

* **Views**

  * Privileges: `CREATE VIEW`, `SHOW VIEW`
  * Typical use: Create or inspect views
  * Safe for app user: Only if needed

* **Temporary objects**

  * Privileges: `CREATE TEMPORARY TABLES`
  * Typical use: Temp table workflows
  * Safe for app user: Usually yes, if needed

* **Triggers / events**

  * Privileges: `TRIGGER`, `EVENT`
  * Typical use: DB automation
  * Safe for app user: Only if needed

* **FK / locks**

  * Privileges: `REFERENCES`, `LOCK TABLES`
  * Typical use: Foreign keys / explicit table locks
  * Safe for app user: Rarely

* **User / role admin**

  * Privileges: `CREATE USER`, `CREATE ROLE`, `DROP ROLE`, `GRANT OPTION`, `PROXY`
  * Typical use: Account management / impersonation
  * Safe for app user: No

* **Server admin**

  * Privileges: `FILE`, `PROCESS`, `RELOAD`, `SHUTDOWN`, `SUPER`, `SHOW DATABASES`, `CREATE TABLESPACE`, `FLUSH_PRIVILEGES`
  * Typical use: Server-wide administration
  * Safe for app user: No

* **Replication**

  * Privileges: `REPLICATION CLIENT`, `REPLICATION SLAVE`
  * Typical use: Replication setup / monitoring
  * Safe for app user: No

* **Dynamic privileges**

  * Privileges: e.g. `SYSTEM_VARIABLES_ADMIN`, `ROLE_ADMIN`, `BACKUP_ADMIN`, `CONNECTION_ADMIN`
  * Typical use: Modern server administration features
  * Safe for app user: No

#### SQL allow group by

```sql
set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
```

### Passwordless sudo

Log in to your server as the root user, then run:

```sh
sudo adduser whiz
sudo usermod -aG sudo whiz
sudo update-alternatives --config editor
sudo visudo
```

Add this line in `visudo`:

```sh
whiz ALL=(ALL) NOPASSWD:ALL
```

Then run:

```sh
sudo groupadd vpsusers
sudo gpasswd -a www-data vpsusers
sudo gpasswd -a whiz vpsusers
chown -R :vpsusers /var/www/html/
```


### Service Management and Logs

```bash
sudo systemctl disable --now snapd.socket snapd.service
sudo systemctl mask snapd.socket snapd.service

journalctl --list-boots
journalctl -p 3 -xb-1
journalctl -p 3 -xb-1 -n -200 --no-pager
```

---

### Package and Tool Installation Bundles

#### Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew install rbenv yazi zoxide bat eza fd fzf git tmux neovim jq lazygit
rbenv init
rbenv install -l
rbenv install 3.3.0
sudo gem install cocoapods
```

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install zsh ncdu nvim yazi fd ripgrep fzf zoxide eza bat tmux \
	zellij font-symbols-only-nerd-font ouch nushell sevenzip trash-cli
```

#### Windows package installs

```powershell
winget install CoreyButler.NVMforWindows 7zip.7zip AutoHotkey.AutoHotkey Git.Git `
				Mozilla.Firefox Notepad++.Notepad++ Parsec.ParsecVDD RustDesk.RustDesk `
				VideoLAN.VLC WinMerge.WinMerge AntibodySoftware.WizTree `
				ApacheFriends.Xampp.8.2 SoftDeluxe.FreeDownloadManager Neovim.Neovim `
				TheDocumentFoundation.LibreOffice wez.wezterm Oracle.MySQLWorkbench `
				Nushell.Nushell PuTTY.PuTTY Starship.Starship Google.Chrome.EXE `
				JetBrains.IntelliJIDEA.Community LibreWolf.LibreWolf Parsec.Parsec `
				SoftMaker.FreeOffice.2024 Mobatek.MobaXterm Microsoft.PowerToys `
				Microsoft.PowerShell Bruno.Bruno BurntSushi.ripgrep.MSVC `
				GitHub.GitHubDesktop JesseDuffield.lazygit Postman.Postman `
				Atlassian.Sourcetree Zoom.Zoom.EXE ajeetdsouza.zoxide junegunn.fzf `
				sharkdp.bat sxyazi.yazi twpayne.chezmoi Microsoft.VisualStudioCode `
				Microsoft.Teams Microsoft.WindowsTerminal `
				Devolutions.RemoteDesktopManager psmux
```

### Windows Programs

- flutter
- TrafficMonitor - https://github.com/zhongyang219/TrafficMonitor
- ouch - https://github.com/ouch-org/ouch
- AnyDesk
- TeamViewer
- Spotify
- Phone Link
- DBEngin - https://dbngin.com/
- FileZilla
- Android Studio
- Tor Browser
- RetroBat
- Rufus
- Ventoy

### Neovim / LazyVim / Related Notes

#### Commands and notes

```vim
checkhealth
```

- `LazyExtars` - install extra plugins
- Moonfly theme path (Linux): `~/.local/share/nvim/lazy/moonfly/lua/moonfly/init.lua`
  - `local black = "#000000"`
- Moonfly theme path (Windows): `~\AppData\Local\nvim-data\lazy\moonfly\lua\moonfly`
- Trash location: `~/.local/share/Trash/files`

```bash
trash-list
trash-restore
(crontab -l ; echo "@daily $(which trash-empty) 30") | crontab -
```

### tmux

```bash
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
nvim .config/tmux/tmux.conf
tmux source ~/.tmux.conf
```

### chezmoi

```bash
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
```

### Yazi

#### References

- https://github.com/sxyazi/yazi/blob/shipped/yazi-config/preset/keymap-default.toml
- https://github.com/ajeetdsouza/zoxide
- https://github.com/junegunn/fzf

#### Windows setup

```powershell
New-Item -Path $env:APPDATA\yazi\config -ItemType SymbolicLink -Value $env:OneDrive\Documents\Docs\yazi\config

[System.Environment]::SetEnvironmentVariable('YAZI_FILE_ONE',"C:\Program Files\Git\usr\bin\file.exe", 'User')
ya pack -a tkapias/moonfly
```

`theme.toml`

```toml
[flavor]
dark  = "moonfly"
light = "moonfly"
```

#### Linux install

```bash
wget -qO yazi.zip https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-musl.zip
unzip -q yazi.zip -d yazi-temp
sudo mv yazi-temp/*/yazi /usr/local/bin
yazi --version
rm -rf yazi-temp yazi.zip
```

Shell wrapper:

```bash
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
```

### Ranger

No extra install/config commands were listed beyond shortcuts.

### Zoxide

#### Setup

```powershell
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

[System.Environment]::SetEnvironmentVariable('_ZO_DATA_DIR',"$env:OneDrive\Documents\Docs\zoxide", 'User')

zoxide init powershell
```

```bash
eval "$(zoxide init zsh --cmd cd)"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
export PATH=~/.local/bin:$PATH
```

### fzf

```bash
wget -qO fzf.tar.gz https://github.com/junegunn/fzf/releases/latest/download/fzf-0.60.0-linux_amd64.tar.g
tar -xvzf fzf.tar.gz
sudo mv fzf /usr/local/bin
rm fzf.tar.gz
fzf --version
```

### Bat

```bash
sudo apt install bat
alias c="batcat"
```

### fd, eza, and utility packages

```bash
sudo apt install fd
sudo apt install 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick -y

sudo apt update
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
```

### 7-Zip

```bash
wget -qO 7z.tar.gz https://7-zip.org/a/7z2409-linux-x64.tar.xz
```

### zinit

```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
exec zsh
```

### zellij

```bash
wget -qO zellij.tar.gz https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz
tar -xvf zellij*.tar.gz
chmod +x zellij
sudo mv zellij /usr/local/bin
rm zellij.tar.gz
```

### References

- Neovim keymap: https://docs.google.com/spreadsheets/d/15k_UgeY0C3j8tVQnR2hD_kNljB1AApG3x3gYrKtUAlw/edit?gid=1082709605#gid=1082709605