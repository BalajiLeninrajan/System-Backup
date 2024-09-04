# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

crun() {
	echo "-> Compiling $1.c to ./$1"
	gcc -o $1 $1.c
	if [ $? -ne 0 ]; then
		echo "-> Compilation Failed"
	else
		echo "-> Compilation Complete"
		echo "-> Executing ./$1"
		echo "========Output========"
		./$1
		if [ $? -ne 0 ]; then
			echo ""
			echo "======================"
			echo "-> Execution Failed"
		else
			echo ""
			echo "======================"
			echo "-> Execution Complete"
		fi
	fi
}

cgrind() {
	echo "-> Compiling $1.c to ./$1"
	gcc -o $1 $1.c
	if [ $? -ne 0 ]; then
		echo "-> Compilation Failed"
	else
		echo "-> Compilation Successful"
		echo "-> Executing ./$1"
		echo ""
		valgrind ./$1
	fi
}

drun() {
	echo "-> Compiling $1.c to ./$1"
	gcc -o $1 $1.c -g
	if [ $? -ne 0 ]; then
		echo "-> Compilation Failed"
	else
		echo "-> Compilation Complete"
		echo "-> Debugging ./$1"
		gdb ./$1
	fi
}

cpprun() {
	echo "-> Compiling $1.cpp to ./$1"
	g++ -o $1 $1.cpp
	if [ $? -ne 0 ]; then
		echo "-> Compilation Failed"
	else
		echo "-> Compilation Complete"
		echo "-> Executing ./$1"
		echo "========Output========"
		./$1
		if [ $? -ne 0 ]; then
			echo ""
			echo "======================"
			echo "-> Execution Failed"
		else
			echo ""
			echo "======================"
			echo "-> Execution Complete"
		fi
	fi
}

cppgrind() {
	echo "-> Compiling $1.cpp to ./$1"
	g++ -o $1 $1.cpp
	if [ $? -ne 0 ]; then
		echo "-> Compilation Failed"
	else
		echo "-> Compilation Successful"
		echo "-> Executing ./$1"
		echo ""
		valgrind ./$1
	fi
}

cppdrun() {
	echo "-> Compiling $1.cpp to ./$1"
	g++ -o $1 $1.cpp
	if [ $? -ne 0 ]; then
		echo "-> Compilation Failed"
	else
		echo "-> Compilation Successful"
		echo "-> Debugging ./$1"
		echo ""
		gdb ./$1
	fi
}
alias la="eza -l -a -h --git"
alias ll="eza -l -h --git"
alias ls="eza -l -h --git"
alias cdc="cd ~/Documents/code"
alias py="python"
alias rust="rustc"
alias speedtest="speedtest-cli"
alias spotx-update="bash <(curl -sSL https://spotx-official.github.io/run.sh)"
alias venv_activate="source ./venv/bin/activate"
alias top="btop"
alias cat="bat"
alias rmdir="rm -rf"
alias neofetch="fastfetch --logo ~/Documents/System-Backup/ProfilePicture.png --logo-height 25"
alias zed="flatpak run dev.zed.Zed"

unset rc

export PATH="$PATH:$HOME/.local/share/flutter_sdk/flutter/bin"

export ANDROID_HOME=$HOME/.local/share/android_sdk
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH
# export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH

source "/home/balaji/.sdkman/bin/sdkman-init.sh"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

eval "$(thefuck --alias)"
