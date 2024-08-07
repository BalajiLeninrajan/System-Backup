# Setup

- Get ssh key for github
- Sign into accounts
- Wallpaper in google drive

## .bashrc

```bash
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
alias cdc="cd ~/Documents/code"
alias py="python"
alias speedtest="speedtest-cli"
alias spotx-update="bash <(curl -sSL https://spotx-official.github.io/run.sh)"
alias vi="nvim"
alias venv_activate="source ./venv/bin/activate"
alias top="btop"
alias cat="bat"
alias rmdir="rm -rf"
alias neofetch="fastfetch --logo ~/Pictures/ProfilePicture.png --logo-height 25"
alias zed="flatpak run dev.zed.Zed"

unset rc

EDITOR=code
export PATH="$PATH:$HOME/.local/share/flutter/bin"
export CHROME_EXECUTABLE="/usr/bin/firefox"

export ANDROID_HOME=$HOME/.local/share/Android
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH
export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
```

## Flatpak Apps

- Name Application ID Version Branch Origin Installation
- Daniel Christophis com.github.d4nj1.tlpui 1.6.5 stable flathub system
- Martin Abente Lahaye com.github.tchx84.Flatseal 2.2.0 stable flathub system
- Spotify com.spotify.Client 1.2.42.290.g242057a2 stable flathub system
- Zed dev.zed.Zed v0.146.5 stable flathub system
- Amberol io.bassi.Amberol 0.10.3 stable flathub system
- Blender org.blender.Blender 4.2.0 stable flathub system
- Codecs org.blender.Blender.Codecs stable flathub system
- Fedora Platform org.fedoraproject.Platform 40 f40 fedora system
- Freedesktop Platform org.freedesktop.Platform 22.08.25 22.08 flathub system
- Freedesktop Platform org.freedesktop.Platform freedesktop-sdk-23.08.21 23.08 flathub system
- Mesa org.freedesktop.Platform.GL.default 24.0.7 22.08 flathub system
- Mesa (Extra) org.freedesktop.Platform.GL.default 24.0.7 22.08-extra flathub system
- Mesa org.freedesktop.Platform.GL.default 24.1.3 23.08 flathub system
- Mesa (Extra) org.freedesktop.Platform.GL.default 24.1.3 23.08-extra flathub system
- ffmpeg-full org.freedesktop.Platform.ffmpeg-full 23.08 flathub system
- openh264 org.freedesktop.Platform.openh264 2.1.0 2.2.0 flathub system
- openh264 org.freedesktop.Platform.openh264 2.4.1 2.4.1 flathub system
- Freedesktop SDK org.freedesktop.Sdk 22.08.25 22.08 flathub system
- Freedesktop SDK org.freedesktop.Sdk freedesktop-sdk-23.08.21 23.08 flathub system
- GNU Image Manipulation Program org.gimp.GIMP 2.10.38 stable fedora system
- Extensions org.gnome.Extensions 46.2 stable fedora system
- GNOME Application Platform version 43 org.gnome.Platform 43 flathub system
- GNOME Application Platform version 45 org.gnome.Platform 45 flathub system
- GNOME Application Platform version 46 org.gnome.Platform 46 flathub system
- The Podcasts developers org.gnome.Podcasts 0.7.0 stable flathub system
- Videos org.gnome.Totem 43.0 stable flathub system
- Codecs org.gnome.Totem.Codecs stable flathub system
- yt-dl totem-pl-parser plugin org.gnome.Totem.Videosite.YouTubeDl stable flathub system
- Disk Usage Analyzer org.gnome.baobab 46.0 stable fedora system
- Adwaita dark GTK theme org.gtk.Gtk3theme.Adwaita-dark 3.22 flathub system
- adw-gtk3-dark Gtk Theme org.gtk.Gtk3theme.adw-gtk3-dark 3.22 flathub system
- KDE Application Platform org.kde.Platform 5.15-23.08 flathub system
- QGnomePlatform org.kde.PlatformTheme.QGnomePlatform 5.15-23.08 flathub system
- QAdwaitaDecorations org.kde.WaylandDecoration.QAdwaitaDecorations 5.15-23.08 flathub system
- QGnomePlatform-decoration org.kde.WaylandDecoration.QGnomePlatform-decoration 5.15-23.08 flathub system
- Thunderbird org.mozilla.Thunderbird 128.0.1esr stable flathub system
- Parabolic org.nickvision.tubeconverter 2024.5.0 stable flathub system
- qBittorrent org.qbittorrent.qBittorrent 4.6.5 stable flathub system
- ArmCord xyz.armcord.ArmCord 3.2.7 stable flathub system

## Other Utils and Apps

- gnome tweaks
- bat
- eza
- btop
- ATUIN
- spotx
- sdkman
- fastfetch
- [adwaita for gtk3](https://github.com/lassekongo83/adw-gtk3) set as legacy theme in gnome tweaks
- [Firfox gnome theme](https://github.com/rafaelmardojai/firefox-gnome-theme)
- [Thunderbird gnome theme](https://github.com/rafaelmardojai/thunderbird-gnome-theme)
- Speedtest cli
- ADB and Android Emulator
- Flutter the non-snap way
- devel packages for installed langs
- Python3.11 if 3.12 is installed

## Gnome Extensions

- Clipboard History
- Hide Universal Access
- color picker
- Weather 'O Clock

## Vencord settings

### Theme

Midnight for BetterDiscord w/

```CSS
:root {
	/* font */
	--font-primary: 'gg sans'; /* change to 'gg sans' for default discord font */
	--font-display: 'gg sans'; /* change to 'gg sans' for default discord font */

	/* amount of spacing and padding */
	--spacing: 12px;
	/* radius of round corners */
	--roundness: 16px;

	/* color of links */
	--accent-1: hsl(213, 77%, 60%);
	/* color of unread dividers and some indicators */
	--accent-2: hsl(212, 100%, 62%);
	/* color of accented buttons */
	--accent-3: hsl(212, 100%, 62%);
	/* color of accented buttons when hovered */
	--accent-4: hsl(213, 77%, 60%);
	/* color of accented buttons when clicked */
	--accent-5: hsl(213, 63%, 44%);

	/* color of green online dot, change to #23a55a for default green */
	--online-indicator: #5ba178;

	/* color of mentions and messages that mention you */
	--mention: hsl(212, 43%, 25%);
	/* color of mentions and messages that mention you when hovered */
	--mention-hover: hsl(213, 48%, 33%);

	/* color of bright text on colored buttons */
	--text-1: hsl(0, 0%, 100%);
	/* color of headings and important text */
	--text-2: hsl(0, 0%, 100%);
	/* color of normal text */
	--text-3: hsl(0, 0%, 90%);
	/* color of icon buttons and channels */
	--text-4: hsl(0, 0%, 85%);
	/* color of muted channels/chats and timestamps */
	--text-5: hsl(0, 0%, 70%);

	/* color of dark buttons when clicked */
	--bg-1: hsl(220, 15%, 20%);
	/* color of dark buttons */
	--bg-2: hsl(220, 15%, 16%);
	/* color of spacing around panels and secondary elements */
	--bg-3: hsl(0, 0%, 12%);
	/* main background color */
	--bg-4: hsl(0, 0%, 14%);

	/* color of channels and icon buttons when hovered */
	--hover: hsl(0, 0%, 20%);
	/* color of channels and icon buttons when clicked or selected */
	--active: hsl(0, 0%, 23%);
	/* color of messages when hovered */
	--message-hover: hsl(0, 0%, 20%);

	/* top left icon */
	--moon-icon: none; /* change to 'none' to hide moon icon */
	--discord-icon: block; /* change to 'block' to show default discord icon */
}
```

- Better Settings
- CopyUserUrls
- Fake Nitro
- Image Zoom
- QuickMention
- Spotify Controls
- ViewIcons
- WebKeybinds
- WhoReacted
- CallTimer
- Crash Handler
- Fake Profile Themes
  - #440e81
  - #705173
- Mention Avatars
- QuickReply
- Summaries
- WebContextMenues
- WebScreenShare Fixes

## ZED

settings.json

```json
// Zed settings
//
// For information on how to configure Zed, see the Zed
// documentation: https://zed.dev/docs/configuring-zed
//
// To see all of Zed's default settings without changing your
// custom settings, run the `zed: Open Default Settings` command
// from the command palette
{
  "ui_font_family": "Cantarell",
  "buffer_font_family": "Source Code Pro",
  "features": {
    "inline_completion_provider": "none"
  },
  "base_keymap": "VSCode",
  "relative_line_numbers": true,
  "formatter": "auto",
  "format_on_save": "on",
  "telemetry": {
    "diagnostics": false,
    "metrics": false
  },
  "vim_mode": true,
  "vim": {
    "use_multiline_find": true,
    "use_system_clipboard": "on_yank"
  },
  "ui_font_size": 18,
  "buffer_font_size": 16,
  "theme": {
    "mode": "system",
    "light": "Adwaita Pastel Light",
    "dark": "Adwaita Pastel Dark"
  },
  "assistant": {
    "enabled": false,
    "button": false,
    "version": "2"
  },
  "terminal": {
    "copy_on_select": true
  },
  "experimental.theme_overrides": {
    "title_bar.inactive_background": "#282828"
  },
  "tabs": {
    "close_position": "right",
    "file_icons": true,
    "git_status": true
  },
  "centered_layout": {
    "left_padding": 0.15,
    "right_padding": 0.15
  }
}
'''
```

keymap.json

```json
// Zed keymap
//
// For information on binding keys, see the Zed
// documentation: https://zed.dev/docs/key-bindings
//
// To see the default key bindings run `zed: Open Default Keymap`
// from the command palette.
[
  {
    "context": "Workspace",
    "bindings": {
      // "shift shift": "file_finder::Toggle"
      "ctrl-,": "editor::ToggleCodeActions"
    }
  },
  {
    "context": "Editor",
    "bindings": {
      // "j k": ["workspace::SendKeystrokes", "escape"]
    }
  },
  {
    "context": "VimControl && !menu",
    "bindings": {
      // "j k": "vim::NormalBefore" // remap jk in insert mode to escape.
      "ctrl-,": "editor::ToggleCodeActions"
    }
  },
  {
    "context": "Terminal",
    "bindings": {
      "ctrl-w": "pane::CloseActiveItem",
      "ctrl-`": "workspace::ToggleBottomDock"
    }
  }
]
```

Extensions

- HTML
- Git Firefly
- SQL
- Emmet
- XML
- LaTex
- Dart
- Markdown Oxide
- Rainbow CSV
- Basher
- Scala
- Adwaita Pastel Themem
