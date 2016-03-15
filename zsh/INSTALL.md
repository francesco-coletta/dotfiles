# Installare la shell zsh

	sudo apt-get install zsh

# Installare il framework oh-my-zsh

curl
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

wget
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Copiare il file .zshrc nella home

	cp <git repo>/dotfiles/zsh/zshrc ~/.zshrc

# Copiare il file di configurazione del theme

	cp <git repo>/dotfiles/zsh/coletta.zsh-theme ~/.oh-my-zsh/themes/coletta.szh-theme

# Cambiare la shell di default 

	chsh -s /bin/zsh
