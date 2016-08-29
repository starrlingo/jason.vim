# Install my VIM settings from Vundle (Vim Package Manager)

    $ cd ~/.vim && git clone https://github.com/VundleVim/Vundle.vim.git
    $ vim ~/.vimrc
		" =============== Vundle Initialization ===============
		" This loads all the plugins specified in ~/.vim/vundles.vim
		" Use Vundle plugin to manage all other plugins
		if filereadable(expand("~/.vim/vundles.vim"))
		  source ~/.vim/vundles.vim
		endif
    $ git clone https://github.com/starrlingo/starrlingo.vim ~/.vim/bundle/starrlingo.vim
    $ ln -s ~/.vim/bundle/starrlingo.vim/vimrc ~/.vimrc
    $ vim
    :PluginInstall