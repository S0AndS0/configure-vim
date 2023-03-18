# Configure Vim
[heading__top]:
  #configure-vim 
  "&#x2B06; Vim configurations and customizations"


Vim configurations and customizations


## [![Byte size of Configure Vim][badge__main__configure_vim__source_code]][configure_vim__main__source_code] [![Open Issues][badge__issues__configure_vim]][issues__configure_vim] [![Open Pull Requests][badge__pull_requests__configure_vim]][pull_requests__configure_vim] [![Latest commits][badge__commits__configure_vim__main]][commits__configure_vim__main]


---


- [:arrow_up: Top of Document][heading__top]

- [:building_construction: Requirements][heading__requirements]

- [:zap: Quick Start][heading__quick_start]

- [&#x1F9F0; Usage][heading__usage]
  - [Vim GitGutter][heading__vim_gitgutter]

  - [Typescript Syntax for Vim][heading__typescript_syntax_for_vim]

  - [Emmet Vim][heading__emmet_vim]

  - [Gruvbox][heading__gruvbox]

  - [Spell Under][heading__spell_under]
  - [Abolish][heading__abolish]

  - [Vim Prettier][heading__vim_prittier]

  - [Expand Region][heading__expand_region]

  - [Vim Solidity (Syntax)][heading__vim_solidity_syntax]

  - [Fugitive][heading__fugitive]
  - [Commentary][heading__commentary]

  - [Balanced Backspace][heading__balanced_backspace]
  - [Balanced Braces][heading__balanced_braces]
  - [Balanced Quotes][heading__balanced_quotes]
  - [Date Time][heading__date_time]
  - [Emoji Syntax][heading__emoji_syntax]
  - [MarkDown Headings][heading__markdown_headings]
  - [MarkDown Surrounds][heading__markdown_surrounds]
  - [Nudge Lines][heading__nudge_lines]
  - [Spelling Shortcuts][heading__spelling_shortcuts]
  - [Splits Jump][heading__splits_jump]
  - [Splits Resize][heading__splits_resize]

  - [Lorem Ipsum][heading__lorem_ipsum]

  - [Syntastic][heading__syntastic]

  - [You Complete Me][heading__you_complete_me]

- [&#x1F5D2; Notes][heading__notes]

- [:chart_with_upwards_trend: Contributing][heading__contributing]
  - [:trident: Forking][heading__forking]
  - [:currency_exchange: Sponsor][heading__sponsor]

- [:card_index: Attribution][heading__attribution]

- [:balance_scale: Licensing][heading__license]


---



## Requirements
[heading__requirements]:
  #requirements
  "&#x1F3D7; Prerequisites and/or dependencies that this project needs to function properly"


Awk, GAwk, or MAwk must be installed to make use of scripts within this repository, for Debian based Linux distributions that'd be similar to...


```Bash
sudo apt-get install gawk
```


---


This repository requires the [Vim][vim_home] text editor to be installed the source code is available on [GitHub -- `vim/vim`][vim__github], and most GNU Linux package managers are able to install Vim directly, eg...


- Arch based Operating Systems


```Bash
sudo packman -Syy

sudo packman -S vim
```


- Debian derived Distributions


```Bash
sudo apt-get update

sudo apt-get install vim
```


> Note, some configurations target Vim version 8.2 (or greater) features


---


For `MakeTags` Vim command ctags must be installed, eg...


```Bash
sudo apt-get install exuberant-ctags
```


---


For the YouCompleteMe plugin you may need to install additional dependencies via distribution package manager, eg...


```Bash
sudo apt-get update

sudo apt-get install g++-8          #> Provides C
sudo apt-get install golang-go      #> Provided Go
sudo apt-get install openjdk-8-jdk  #> Provides Java
```


... as well as manually install Rust and TypeScript via other methods, eg...


```Bash
#> Download and install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#> Add and download TypeScript to project dependencies
cd <project> && npm install --save-dev typescript
```


---


For the Syntastic plugin the `shellcheck` dependency may be installed via distribution package manager...


```Bash
sudo apt-get install shellcheck
```


... as well as `checkbashisms`, which is often bunldled with `devscripts` package...


```Bash
sudo apt-get install devscripts
```


> **Warning**, the file-type recognition of Syntastic seems to be a little buggy for Bash script which by default are treated as `sh` scripts!


---


Git should be configured with GitHub for upgrade/update processes to function properly...


```bash
git config --global user.name='YourGitHubName'

git config --global user.email='Name@Domain.TLD'
```


... Because local customizations are tracked by Git during the update process to mitigate risks of unintentional and/or unrecoverable overwrites.


---


For Solidity compiler `npm` and `truffle` are required


```bash
npm install -g truffle
```


---


For Prettier `yarn` is required


```bash
npm install -g yarn
```


---


To install all known package-manager based dependencies something like the following may be useful...


```Bash
sudo apt-get install exuberant-ctags\
                     gawk\
                     g++-8\
                     golang-go\
                     openjdk-8-jdk\
                     shellcheck\
                     vim
```


______


## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; Perhaps as easy as one, 2.0,..."


Clone this project...


```Bash
mkdir -vp ~/git/hub/S0AndS0

cd ~/git/hub/S0AndS0

git clone git@github.com:S0AndS0/configure-vim.git
```


Backup your current configurations...


```Bash
[[ -f ~/.vimrc ]] && {
    mv ~/.vimrc ~/.vimrc.bak
}


[[ -d ~/.vimrc.d ]] && {
    mv ~/.vimrc.d ~/.vimrc.d.bak
}
```


Make commands may then be used to install, upgrade, or uninstall configurations...


```Bash
make install
```


> The `install` target will make symbolic links for `./vimrc` file and recursively for files within `./vimrc.d/` directory, checkout a local branch for further customization, then download and install plugins via Plug


```Bash
make uninstall
```


> The `uninstall` target will remove symbolic links and empty sub-directories within `~/.vimrc.d/`, and remove the Vim script for Plug


```Bash
make upgrade
```


>  The `upgrade` target will remove current symbolic links, fetch configuration updates, merge non-conflicting changes, rebuild symbolic links, and then attempt to upgrade Plug script and plugins
>
> Note, the merge process attempts to be nondestructive by using the _`ours`_ target; meaning that anytime a merge conflict may arise local customizations are used automatically.


______


## Usage
[heading__usage]:
  #usage
  "&#x1F9F0; How to utilize this repository"


Once installed open a new Vim session to experiment with new configurations.


The following sub-sections cover some, but not all, plugins installed and configured by this repository; as well as some, but not all, common usage examples when applicable. For plugin management the [Plug][source__junegunn__vim_plug] Vim script is utilized, check the [configurations][configuration__junegunn__vim_plug] for details and full list of plugins that are used.


---


### Vim GitGutter
[heading__vim_gitgutter]:
  #vim-gitgutter
  "A Vim plugin which shows a git diff in the sign column."


> [**Source**][source__airblade__vim_gitgutter]: A Vim plugin which shows a git diff in the sign column.


**Documentation**


```Vim
help gitgutter.txt
```


**Normal mode mappings**


- Stage the hunk under the cursor


```Help
<Leader>hs
```


- Preview the hunk under the cursor


```Help
<Leader>hp
```


- Undo the hunk under the cursor


```Help
<Leader>hu
```


Check the official documentation for more mappings and configuration guidance.


---


### Solidity Compiler
[heading__solidity_compiler]:
  #solidity-compiler
  "Plugin for compiling Solidity smart contracts"


> [**Source**][source__dmdque__solidity_vim]


Run Ex mode `:make` command within any `.sol` file


```vim
:make
```


Tip, check [`trufflesuite/truffle` issue `2217`](https://github.com/trufflesuite/truffle/issues/2217) if _"EACCESS: permission denied"_ errors pop.


---


### Typescript Syntax for Vim
[heading__typescript_syntax_for_vim]:
  #typescript-syntax-for-vim
  "Syntax file and other settings for TypeScript"


> [**Source**][source__leafgarland__typescript_vim]: Syntax file and other settings for TypeScript.


Should be enabled automatically for TypeScript file-types, and/or `.ts` file suffixes. Check the official documentation for configuration guidance.


---


### Emmet Vim
[heading__emmet_vim]:
  #emmet-vim
  "emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet"


> [**Source**][source__mattn__emmet_vim]: emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet


**Documentation**


```Vim
help emmet.txt
```


**Insert mode mappings**


Expand abbreviation or word uses the following key sequence


```Vim
<C-y>,
```


- Build a new HTML5 file from template


```
html:5
```


- Expand nested elements example


```
div>p#foo$*3>a
```


... example results...


```HTML
  <div>
      <p id="foo1">
          <a href=""></a>
      </p>
      <p id="foo2">
          <a href=""></a>
      </p>
      <p id="foo3">
          <a href=""></a>
      </p>
  </div>
```


Check the official documentation for more mappings and configuration guidance.


> Note, this plugin sets `omnifunc=emmet#completeTag`


```vim
set omnifunc=emmet#completeTag
setlocal omnifunc=emmet#completeTag
```


---


### Gruvbox
[heading__gruvbox]:
  #gruvbox
  "Designed as a bright theme with pastel 'retro groove' colors and light/dark mode switching in the way of solarized"


> [**Source**][source__morhetz__gruvbox]: Designed as a bright theme with pastel 'retro groove' colors and light/dark mode switching in the way of solarized


Check the official documentation for configuration guidance.


---


### Spell Under
[heading__spell_under]:
  #spell-under
  "plugin to change highlight scheme of spelling checker to use \"UNDERLINE\" instead of default \"REVERSE\" for color terminals when `:colorscheme` is set"


> [**Source**][source__osamuaoki__vim_spell_under]: plugin to change highlight scheme of spelling checker to use "UNDERLINE" instead of default "REVERSE" for color terminals when `:colorscheme` is set


Check the official documentation for configuration guidance.


---


### Expand Region
[heading__expand_region]:
  #expand-region
  "allows you to visually select increasingly larger regions of text"


> [**Source**][source__terryma__vim_expand_region] allows you to visually select increasingly larger regions of text


**Documentation**


```vim
help vim-expand-region.txt
```


**Visual mode**


- `+` Expand visual selection

- `_` Contract visual selection


Check the official documentation for configuration guidance.


---


### Vim Solidity (Syntax)
[heading__vim_solidity_syntax]:
  #vim-solidity-syntax
  "Syntax files for Solidity, the contract-oriented programming language for Ethereum"


> [**Source**][source__tomlion__vim_solidity]: Syntax files for Solidity, the contract-oriented programming language for Ethereum


---


### Abolish
[heading__abolish]:
  #abolish
  "easily search for, substitute, and abbreviate multiple variants of a word"


> [**Source**][source__tpope__vim_abolish]: easily search for, substitute, and abbreviate multiple variants of a word


```Vim
help abolish.txt
```


**Visual mode mappings**


- Start `Subvert` search/replace for highlighted text


<kbd>Ctrl</kbd>^<kbd>r</kbd>


---


### Vim Prettier
[heading__vim_prettier]:
  #vim-prettier
  "Vim plugin wrapper for Prettier"


> [**Source**][source__prettier__vim_prettier]: Vim plugin wrapper for Prettier

> Note [Solidity Prettier plugin][source__prettier_solidity__prettier_plugin_solidity] is included when installing this Vim plugin.


**Documentation**


```Vim
help vim-prettier.txt
```


**Ex mode commands**


```Vim
:Prettier
```


---


### Fugitive
[heading__fugitive]:
  #fugitive
  "Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim?"


> [**Source**][source__tpope__vim_fugitive]: Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim?


**Documentation**


```Vim
help fugitive.txt
```


**Ex mode commands**


This plugin encapsulates many Git features via `:Git` or `:G` prefix


- Commit staged changes


```Vim
G commit
```


- Rename current file buffer and preform `git mv`


```Vim
GMove new-name.ext
```


- Push changes


```Vim
Git push
```


Check the official documentation for more mappings and configuration guidance.


---


### Commentary
[heading__commentary]:
  #commentary
  "Comment stuff out"


> [**Source**][source__tpope__vim_commentary]: Comment stuff out


**Documentation**


```Vim
help commentary.txt
```


**Normal mode mappings**


- Comment or uncomment current line


```Vim
gcc
```


- Comment or uncomment lines that `{motion}` moves over


```Help
gc{motion}
```


**Visual mode mappings**


- Comment or uncomment the highlighted lines


```Help
{Visual}gc
```


Check the official documentation for more mappings and configuration guidance.


---


### Balanced Backspace
[heading__balanced_backspace]:
  #balanced-backspace
  "Attempts to balance removal of quotes and braces"


> [**Source**][source__vim_utilities__balanced_backspace]: Attempts to balance removal of quotes and braces


**Documentation**


```Vim
help balanced-backspace.txt
```


**Insert mode mappings**


Pressing backspace...


```Vim
<BS>
```


... within empty **and** open; curly-brace, parenthesis, square-braces, double-quotes, single-quotes, or backticks, will remove closing symbol of the same type.


Behaviour may be modified for individual, or all, file-types recognized by Vim; check the documentation for details.


[**Configuration**][configuration__vim_utilities__balanced_backspace]


---


### Balanced Braces
[heading__balanced_braces]:
  #balanced-braces
  "Balance parentheses, curly-braces, and square-brackets"


> [**Source**][source__vim_utilities__balanced_braces]: Balance parentheses, curly-braces, and square-brackets


**Documentation**


```Vim
help balanced-braces.txt
```


**Insert mode mappings**


For most files an opening; curly-brace, parenthesis, or square-bracket, will insert the closing symbol after the cursor position.


And a closing; curly-brace, parenthesis, or square-bracket, when cursor is already on one of those symbols will cause the cursor to move left once.


Behaviour may be modified for individual, or all, file-types recognized by Vim; check the documentation for details.


[**Configuration**][configuration__vim_utilities__balanced_braces]


---


### Balanced Quotes
[heading__balanced_quotes]:
  #balanced-quotes
  "Attempts to balance quotes in unobtrusive ways"


> [**Source**][source__vim_utilities__balanced_quotes]: Attempts to balance quotes in unobtrusive ways


**Documentation**


```Vim
help balanced-quotes.txt
```


**Insert mode mappings**


For most file-types an opening; single-quote, double-quote, or backtick, will insert a closing symbol after the cursor.


And a closing/repealed; single-quote, double-quote, or backtick, when the cursor is on a closing symbol will cause the cursor to move left once.


> Note, this plugin will look backwards on the same line to determine if quotes need to be balanced or if the cursor should instead be moved.
>
> Because of specific conditional logic this plugin allows for triple quotes to be inserted, this is to avoid annoying Python developers and MarkDown authors.


Behaviour may be modified for individual, or all, file-types recognized by Vim; check the documentation for details.


[**Configuration**][configuration__vim_utilities__balanced_quotes]


---


### Date time
[heading__date_time]:
  #date-time
  "Commands for injecting date and/or time into current buffer"


> [**Source**][source__vim_utilities__date_time]: Commands for injecting date and/or time into current buffer


**Documentation**


```Vim
:help date-time.txt
```


**Normal mode mappings**


- `<Leader>d` Append current date after cursor position
- `<Leader>D` Insert current date before/at cursor position

- `<Leader>t` Append current time after cursor position
- `<Leader>T` Insert current time before/at cursor position


**Visual select mode mappings**

- `<Leader>R` Replace visual selection with date/time


---


### Emoji Syntax
[heading__emoji_syntax]:
  #emoji-syntax
  "Vim syntax for emoji conceal characters"


> [**Source**][source__vim_utilities__emoji_syntax]: Vim syntax for emoji conceal characters


**Documentation**


```Vim
help emoji-syntax.txt
```


Ensure that `conceallevel` is greater than `0` and that `filetype` is recognized as `markdown`


```Vim
set conceallevel=1
```


---


### MarkDown Headings
[heading__markdown_headings]:
  #markdown-headings
  "Vim plugin that adds short-cuts/commands for MarkDown headings"


> [**Source**][source__vim_utilities__markdown_headings]: Vim plugin that adds short-cuts/commands for MarkDown headings


**Documentation**


```Vim
help markdown-heading-transform.txt

help markdown-heading-link.txt
```


**Normal mode mappings**


> Note, by default mappings are activated **only** for `markdown` file-type


- Change current line to a heading of specified level, or update current heading level


```Help
<Leader>h1 - <Leader>h4
```


- Add or update reference link to current heading line


```Help
<Leader>hl
```


---


### MarkDown Surrounds
[heading__markdown_surrounds]:
  #markdown-surrounds
  "Toggles MarkDown elements; bold, italic, and strike-through"


> [**Source**][source__vim_utilities__markdown_surrounds]: Toggles MarkDown elements; bold, italic, and strike-through


**Documentation**


```Vim
help markdown-surrounds.txt
```


**Normal mode mappings**


> Note, by default mappings are activated **only** for `markdown` file-type


- Toggle bold state of current (big) word or line


```Help
<Leader>b

<Leader>B
```


- Toggle italic state of current (big) word or line


```Help
<Leader>i

<Leader>I
```


- Toggle highlight state of current (big) word or line


```Help
<Leader>hi

<Leader>HI
```


- Toggle strike-through state of current (big) word or line


```Help
<Leader>st

<Leader>ST
```


---


### Nudge Lines
[heading__nudge_lines]:
  #nudge-lines
  "Vim plugin that nudges visually selected lines up or down"


> [**Source**][source__vim_utilities__nudge_lines]: Vim plugin that nudges visually selected lines up or down


**Documentation**


```Vim
help nudge-lines.txt
```


**Visual mode mappings**


- Move selected line(s) up, combine with <kbd>Shift</kbd> to attempt indentation reformatting


```Vim
<C-k>

<C-K>
```


- Move selected line(s) down, combine with <kbd>Shift</kbd> to attempt indentation reformatting


```Vim
<C-j>

<C-J>
```


> Note, either set of motions may be prefixed with a count, eg. `5<C-k>` will move selection five lines upwards.
>
> **Warning**, combining count with <kbd>Shift</kbd> has undefined behavior.


---


### Spelling Shortcuts
[heading__spelling_shortcuts]:
  #spelling-shortcuts
  "Replaces misspelled word with first suggested correction"


> [**Source**][source__vim_utilities__spelling_shortcuts]: Replaces misspelled word with first suggested correction


**Documentation**


```Vim
help spelling-shortcuts.txt
```


**Normal mode mappings**


- Accept first spelling correction for previous word


```Help
<Leader>sp
```


- Accept first spelling correction for current word


```Help
<Leader>sc
```


- Accept first spelling correction for next word


```Help
<Leader>sn
```


---


### Splits Jump
[heading__splits_jump]:
  #splits-jump
  "Vim plugin for jumping between splits swiftly"


> [**Source**][source__vim_utilities__splits_jump]: Vim plugin for jumping between splits swiftly


**Documentation**


```Vim
help splits-jump.txt
```


**Normal mode mappings**


- Relative jump to split above


```Vim
<C-k>
```


- Relative jump towards left split


```Vim
<C-l>
```


- Relative jump to split below


```Vim
<C-j>
```


- Relative jump towards right split


```Vim
<C-h>
```


---


### Splits Resize
[heading__splits_resize]:
  #splits-resize
  "Vim plugin for re-sizing splits swiftly"


> [**Source**][source__vim-utilities__splits-resize]: Vim plugin for re-sizing splits swiftly


**Documentation**


```Vim
help splits-jump.txt
```


**Normal mode mappings**


- Resize active vertical split by `-2`


```Vim
<A-h>
```


- Resize active horizontal split by `+2`


```Vim
<A-j>
```


- Resize active horizontal split by `-2`


```Vim
<A-k>
```


- Resize active vertical split by `+2`


```Vim
<A-l>
```


> Note, any of above motions may be prefixed with a count to override the default of `2` rows/columns, eg. `5<A-l>` will resize an active vertical split by `+5` instead of `+2`
>
> Additionally, to improve compatibility with various devices `<ESC>` or Meta-key may be used instead of <kbd>Alt</kbd>


---


### Lorem Ipsum
[heading__lorem_ipsum]:
  #lorem-ipsum
  "Insert a dummy text of a certain length"


> [**Source**][source__vim_scripts__loremipsum]: Insert a dummy text of a certain length


**Documentation**


```vim
help loremipsum.txt
```


**Ex mode commands**


```vim
:Loremipsum [WORDCOUNT] [PARAGRAPH_TEMPLATE] [PREFIX POSTFIX]

:Loreplace [REPLACEMENT] [PREFIX] [POSTFIX]
```


---


### Syntastic
[heading__syntastic]:
  #syntastic
  "Syntastic is a syntax checking plugin for Vim created by Martin Grenfell"


> [**Source**][source__vim_syntastic__syntastic]: Syntastic is a syntax checking plugin for Vim created by Martin Grenfell


**Documentation**


```Vim
help syntastic.txt
```


**Ex mode commands**


- Output information about checkers available for file-type


```Vim
SyntasticInfo
```


- Manually cause a syntax check


```Vim
SyntasticCheck
```


Check the official documentation for configuration guidance.


[**Configuration**][configuration__vim_syntastic__syntastic]


---


### You Complete Me
[heading__you_complete_me]:
  #you-complete-me
  "a code-completion engine for Vim"


> [**Source**][source__ycm_core__youcompleteme]: a code-completion engine for Vim


**Documentation**


```Vim
help youcompleteme
```


**Normal mode mappings**


Jump to definition


```Help
<Leader>jd
```


**Ex mode commands**


- Open quick-fix split


```Vim
YcmDiags
```


- Echos the type of the variable or method under the cursor, and where it differs, the derived type.


```Vim
YcmCompleter GetType
```


- Displays the preview window populated with quick info about the identifier under the cursor


```Vim
YcmCompleter GetDoc
```


- Where available, attempts to make changes to the buffer to correct diagnostics on the current line


```Vim
YcmCompleter FixIt
```


Check the official documentation for more mappings and configuration guidance.


[**Configuration**][configuration__ycm_core__youcompleteme]


______


## Notes
[heading__notes]:
  #notes
  "&#x1F5D2; Additional things to keep in mind when developing"


This repository may not be feature complete and/or fully functional, Pull Requests that add features or fix bugs are certainly welcomed.


---


Because there are many plugins utilized by this set of configurations, here are a few performance profiling tips...


- Profile time spent on syntax highlighting


```Vim
syntax off
syntime on
syntax on

" ... Scroll about for a bit...

syntime report
```


- Profile time spent executing functions and various Vim scripts


```Vim
profile start /tmp/vim-profile.log
profile func *
profile file *

" ... preform actions...

profile pause
noautocmd qall!
```


______


## Contributing
[heading__contributing]:
  #contributing
  "&#x1F4C8; Options for contributing to configure-vim and S0AndS0"


Options for contributing to configure-vim and S0AndS0


---


### Forking
[heading__forking]:
  #forking
  "&#x1F531; Tips for forking configure-vim"


Start making a [Fork][configure_vim__fork_it] of this repository to an account that you have write permissions for.


- Add remote for fork URL. The URL syntax is _`git@github.com:<NAME>/<REPO>.git`_...


```Bash
cd ~/git/hub/S0AndS0/configure-vim

git remote add fork git@github.com:<NAME>/configure-vim.git
```


- Commit your changes and push to your fork, eg. to fix an issue...


```Bash
cd ~/git/hub/S0AndS0/configure-vim


git commit -F- <<'EOF'
:bug: Fixes #42 Issue


**Edits**


- `<SCRIPT-NAME>` script, fixes some bug reported in issue
EOF


git push fork main
```


> Note, the `-u` option may be used to set `fork` as the default remote, eg. _`git push -u fork main`_ however, this will also default the `fork` remote for pulling from too! Meaning that pulling updates from `origin` must be done explicitly, eg. _`git pull origin main`_


- Then on GitHub submit a Pull Request through the Web-UI, the URL syntax is _`https://github.com/<NAME>/<REPO>/pull/new/<BRANCH>`_


> Note; to decrease the chances of your Pull Request needing modifications before being accepted, please check the [dot-github](https://github.com/S0AndS0/.github) repository for detailed contributing guidelines.


---


### Sponsor
  [heading__sponsor]:
  #sponsor
  "&#x1F4B1; Methods for financially supporting S0AndS0 that maintains configure-vim"


Thanks for even considering it!


Via Liberapay you may <sub>[![sponsor__shields_io__liberapay]][sponsor__link__liberapay]</sub> on a repeating basis.


Regardless of if you're able to financially support projects that S0AndS0 maintains, please consider sharing projects that are useful with others, because one of the goals of maintaining Open Source repositories is to provide value to the community.


______


## Attribution
[heading__attribution]:
  #attribution
  "&#x1F4C7; Resources that where helpful in building this project so far."


- [GitHub -- `github-utilities/make-readme`](https://github.com/github-utilities/make-readme)

- [GitHub -- `mcantor/no_plugins`](https://github.com/mcantor/no_plugins)

- [GitHub -- `junegunn/vim-plug`](https://github.com/junegunn/vim-plug)

- [GitHub -- `vim-syntastic/syntastic`](https://github.com/vim-syntastic/syntastic/issues/1957)

- [GitHub -- `vim-syntastic/syntastic`](https://github.com/vim-syntastic/syntastic/wiki/Syntax-Checker-Guide)

- [GitHub Gist -- `jackkinsella/.vimrc`](https://gist.github.com/jackkinsella/aa7374a6832cca8a09eadc3434a33c24#file-vimrc-L544)

- [GitHub -- `tpope/vim-markdown`](https://github.com/tpope/vim-markdown)

- [Shapeshed -- Vim: you don't need NERDtree or (maybe) netrw](https://shapeshed.com/vim-netrw/)

- [Shortcut Foo -- Top 50 Vim Configuration Options](https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/)

- [StackOverflow -- how do I make vim do normal bash like tab completion for file names](https://stackoverflow.com/questions/526858/)

- [StackOverflow -- How to get path to the current vimscript being executed](https://stackoverflow.com/questions/4976776/)

- [StackOverflow -- How to see which plugins are making Vim slow?](https://stackoverflow.com/questions/12213597/)

- [StackOverflow -- map shift tab in vim to inverse tab in vim](https://stackoverflow.com/questions/4766230/)

- [StackOverflow -- vim how to turn off search highlight after timeout x seconds](https://stackoverflow.com/questions/22798473/)

- [Reddit -- How to automatically close netrw when exiting a file?](https://www.reddit.com/r/vim/comments/b00bcq/how_to_automatically_close_netrw_when_exiting_a/)

- [YouTube -- A look through my vimrc](https://www.youtube.com/watch?v=Ad9BhAiAg7o)

- [YouTube -- Advanced Vim Workflows](https://www.youtube.com/watch?v=futay9NjOac)

- [YouTube -- Damian Conway, 'More Instantly Better Vim' - OSCON 2013](https://www.youtube.com/watch?v=aHm36-na4-4)

- [YouTube -- Using Vim's Built in Complete Menu for Autocompleting Words](https://www.youtube.com/watch?v=2f8h45YR494)

- [YouTube -- Vim as a Python IDE - Martin Brochhaus](https://www.youtube.com/watch?v=YhqsjUUHj6g)

- [YouTube -- Vim Life: VimRC update plugins and Autocmds](https://www.youtube.com/watch?v=-X6rEdZolTA)

- [VI StackExchange -- What's t_TE and t_TI added by vim8?](https://vi.stackexchange.com/questions/27399/)

- [VI StackExchange Why doesn't the backspace key work in insert mode?](https://vi.stackexchange.com/questions/2162/)

- [VI StackExchange -- Cycle through autocomplete menu using tab](https://vi.stackexchange.com/questions/19675/)

- [VI StackExchange -- vim ex mode write to stdout](https://vi.stackexchange.com/questions/23198/)

- [VI StackExchange -- Vim slows down over time with syntax on](https://vi.stackexchange.com/questions/2875/)


______


## License
[heading__license]:
  #license
  "&#x2696; Legal side of Open Source"


```
Vim configurations and customizations
Copyright (C) 2023 S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```


For further details review full length version of [AGPL-3.0][branch__current__license] License.



[branch__current__license]:
  /LICENSE
  "&#x2696; Full length version of AGPL-3.0 License"


[badge__commits__configure_vim__main]:
  https://img.shields.io/github/last-commit/S0AndS0/configure-vim/main.svg

[commits__configure_vim__main]:
  https://github.com/S0AndS0/configure-vim/commits/main
  "&#x1F4DD; History of changes on this branch"


[configure_vim__community]:
  https://github.com/S0AndS0/configure-vim/community
  "&#x1F331; Dedicated to functioning code"


[issues__configure_vim]:
  https://github.com/S0AndS0/configure-vim/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."

[configure_vim__fork_it]:
  https://github.com/S0AndS0/configure-vim/
  "&#x1F531; Fork it!"

[pull_requests__configure_vim]:
  https://github.com/S0AndS0/configure-vim/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"

[configure_vim__main__source_code]:
  https://github.com/S0AndS0/configure-vim/
  "&#x2328; Project source!"

[badge__issues__configure_vim]:
  https://img.shields.io/github/issues/S0AndS0/configure-vim.svg

[badge__pull_requests__configure_vim]:
  https://img.shields.io/github/issues-pr/S0AndS0/configure-vim.svg

[badge__main__configure_vim__source_code]:
  https://img.shields.io/github/repo-size/S0AndS0/configure-vim


[vim__home]:
  https://www.vim.org
  "Home page for the Vim text editor"

[vim__github]:
  https://github.com/vim/vim
  "Source code for Vim on GitHub"


[sponsor__shields_io__liberapay]:
  https://img.shields.io/static/v1?logo=liberapay&label=Sponsor&message=S0AndS0

[sponsor__link__liberapay]:
  https://liberapay.com/S0AndS0
  "&#x1F4B1; Sponsor developments and projects that S0AndS0 maintains via Liberapay"


[source__junegunn__vim_plug]:
  https://github.com/junegunn/vim-plug
  "A minimalist Vim plugin manager."

[configuration__junegunn__vim_plug]:
  ../vimrc.d/plugged/00-init.vim
  "Configuration for Plug script"

[source__airblade__vim_gitgutter]:
  https://github.com/airblade/vim-gitgutter
  "A Vim plugin which shows a git diff in the sign column"

[source__dmdque__solidity_vim]:
  https://github.com/dmdque/solidity.vim
  "Plugin for compiling Solidity smart contracts"

[source__leafgarland__typescript_vim]:
  https://github.com/leafgarland/typescript-vim
  "Syntax file and other settings for TypeScript"

[source__mattn__emmet_vim]:
  https://github.com/mattn/emmet-vim
  "emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet"

[source__morhetz__gruvbox]:
  https://github.com/morhetz/gruvbox
  "Designed as a bright theme with pastel 'retro groove' colors and light/dark mode switching in the way of solarized"

[source__osamuaoki__vim_spell_under]:
  https://github.com/osamuaoki/vim-spell-under
  "plugin to change highlight scheme of spelling checker to use \"UNDERLINE\" instead of default \"REVERSE\" for color terminals when `:colorscheme` is set."

[source__terryma__vim_expand_region]:
  https://github.com/terryma/vim-expand-region
  "allows you to visually select increasingly larger regions of text"

[source__tomlion__vim_solidity]:
  https://github.com/tomlion/vim-solidity
  "Syntax files for Solidity, the contract-oriented programming language for Ethereum"

[source__tpope__vim_abolish]:
  https://github.com/tpope/vim-abolish
  "easily search for, substitute, and abbreviate multiple variants of a word"

[source__prettier__vim_prettier]:
  https://github.com/prettier/vim-prettier
  "Vim plugin wrapper for Prettier"

[source__prettier_solidity__prettier_plugin_solidity]:
  https://github.com/prettier-solidity/prettier-plugin-solidity
  "A Prettier plugin for automatically formatting your Solidity code"

[source__tpope__vim_fugitive]:
  https://github.com/tpope/vim-fugitive
  "Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim?"

[source__tpope__vim_commentary]:
  https://github.com/tpope/vim-commentary
  "Comment stuff out"

[source__vim_utilities__balanced_backspace]:
  https://github.com/vim-utilities/balanced-backspace
  "Attempts to balance removal of quotes and braces"

[configuration__vim_utilities__balanced_backspace]:
  ../vimrc.d/plugged/balanced-backspace.vim
  "Configuration for Balanced Backspace plugin"

[source__vim_utilities__balanced_braces]:
  https://github.com/vim-utilities/balanced-braces
  "Balance parentheses, curly-braces, and square-brackets"

[configuration__vim_utilities__balanced_braces]:
  ../vimrc.d/plugged/balanced-braces.vim
  "Configuration for Balanced Braces plugin"

[source__vim_utilities__balanced_quotes]:
  https://github.com/vim-utilities/balanced-quotes
  "Attempts to balance quotes in unobtrusive ways"

[configuration__vim_utilities__balanced_quotes]:
  ../vimrc.d/plugged/balanced-quotes.vim
  "Configuration for Balanced Quotes plugin"

[source__vim_utilities__date_time]:
  https://github.com/vim-utilities/date-time/
  "Commands for injecting date and/or time into current buffer"

[source__vim_utilities__emoji_syntax]:
  https://github.com/vim-utilities/emoji-syntax
  "Vim syntax for emoji conceal characters"

[source__vim_utilities__markdown_headings]:
  https://github.com/vim-utilities/markdown-headings
  "Vim plugin that adds short-cuts/commands for MarkDown headings"

[source__vim_utilities__markdown_surrounds]:
  https://github.com/vim-utilities/markdown-surrounds
  "Toggles MarkDown elements; bold, italic, and strike-through"

[source__vim_utilities__nudge_lines]:
  https://github.com/vim-utilities/nudge-lines
  "Vim plugin that nudges visually selected lines up or down"

[source__vim_utilities__spelling_shortcuts]:
  https://github.com/vim-utilities/spelling-shortcuts
  "Replaces misspelled word with first suggested correction"

[source__vim_utilities__splits_jump]:
  https://github.com/vim-utilities/splits-jump
  "Vim plugin for jumping between splits swiftly"

[source__vim-utilities__splits-resize]:
  https://github.com/vim-utilities/splits-resize
  "Vim plugin for re-sizing splits swiftly"

[source__vim_syntastic__syntastic]:
  https://github.com/vim-syntastic/syntastic
  "Syntastic is a syntax checking plugin for Vim created by Martin Grenfell"

[source__vim_scripts__loremipsum]:
  https://github.com/vim-scripts/loremipsum
  "Insert a dummy text of a certain length"

[configuration__vim_syntastic__syntastic]:
  ../vimrc.d/plugged/syntastic.vim
  "Configuration for Syntastic plugin"

[source__ycm_core__youcompleteme]:
  https://github.com/ycm-core/YouCompleteMe
  "a code-completion engine for Vim"

[configuration__ycm_core__youcompleteme]:
  ./vimrc.d/plugged/you-complete-me.vim
  "Configuration for You Complete Me plugin"

