```
      ___           ___           ___           ___                       ___       ___           ___     
     /\  \         /\  \         /\  \         /\  \          ___        /\__\     /\  \         /\  \    
    /::\  \       /::\  \        \:\  \       /::\  \        /\  \      /:/  /    /::\  \       /::\  \   
   /:/\:\  \     /:/\:\  \        \:\  \     /:/\:\  \       \:\  \    /:/  /    /:/\:\  \     /:/\ \  \  
  /:/  \:\__\   /:/  \:\  \       /::\  \   /::\~\:\  \      /::\__\  /:/  /    /::\~\:\  \   _\:\~\ \  \ 
 /:/__/ \:|__| /:/__/ \:\__\     /:/\:\__\ /:/\:\ \:\__\  __/:/\/__/ /:/__/    /:/\:\ \:\__\ /\ \:\ \ \__\
 \:\  \ /:/  / \:\  \ /:/  /    /:/  \/__/ \/__\:\ \/__/ /\/:/  /    \:\  \    \:\~\:\ \/__/ \:\ \:\ \/__/
  \:\  /:/  /   \:\  /:/  /    /:/  /           \:\__\   \::/__/      \:\  \    \:\ \:\__\    \:\ \:\__\  
   \:\/:/  /     \:\/:/  /     \/__/             \/__/    \:\__\       \:\  \    \:\ \/__/     \:\/:/  /  
    \::/__/       \::/  /                                  \/__/        \:\__\    \:\__\        \::/  /   
     ~~            \/__/                                                 \/__/     \/__/         \/__/    
```

**note to self**: follow [this guide](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)


Also, your neovim actually share config with Vim. [source](from https://thoughtbot.com/blog/my-life-with-neovim)

```
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
```
