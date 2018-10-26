```
      /##   /##        /####    /#                     /##    /## ##
     | ## / ##        \ #_ ##  | #                    | ##   | # |_/
     \  #| ##         \ # \ ## \  #  /######  /###### | ##   | # /##/######/####
      \ ###/  /#######\ ## \ ## \ # /## __ # / #____ #|  ## / ##| #| ##_  ##_  ##
      \ #__##\_______/ \ #  \ ##| #| #######| #     \ #\  ## ## | #| ## \ ## \ ##
      \ #  \ ##        \  #  \  # #| ##     | #     | # \  ###/ | #| ## | ## | ##
      \ ##  \ ##       \ #   \  ##|  ######\_ #######   \  #/  | #| ## | ## | ##
      \__/  \__/        \_/    \__/ \______/ \_______/    \_/   |__|__/ |__/ |__/        ─────Kewth
```

Welcome to use K-Neovim.  

## Preview
![Preview Neovim](/img/Neovim.png)

## Install
**First you're supposed know [what Neovim is](https://github.com/neovim/neovim) and [why you sholud use Neovim](https://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/).**  

Then Download Neovim(this is the 0.3.2 version of Neovim):  
- windows:
	[Neovim for x64](https://github.com/neovim/neovim/releases/download/nightly/nvim-win64.zip).  
	[Neovim for x32](https://github.com/neovim/neovim/releases/download/nightly/nvim-win32.zip).  
	You can use Neovim by runnig `nvim-qt.exe`.  
- Macos:
	[Neovim for Macos](https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz).  
	You can use Neovim by runnig `./nvim-osx64/bin/nvim`.  
- Linux:
	[Neovim for linux(x64)](https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage).  
	You can use Neovim by runnig `chmod u+x nvim.appimage && ./nvim.appimage`.  

After that, you should clone this source code to your configuration directory.  
For example, if the operating system you use is Linux, just run:  
```
git clone git@github.com:Kewth/K-Neovim
mv -r K-Neovim ~/.config/nvim
```
If the operating system you use isn't that, sorry, i cannot give you any help in this version because I use Linux only.  

Then run Neovim, input `:PlugInstall` and press enter, it will automatically download the plugin which you may required.  

## Usage
If you are new to vim, run :Tutor and prees enter in neovim.  

K-Neovim uses Space as its Leader by defalut.  
I suggest you not to change it, but if you really dislike it, you can edit config.vim in your configuration directory such as: `let g:k_vim_leader = ','`(it'll use ',' as leader)  

