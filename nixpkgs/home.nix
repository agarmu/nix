{ config, lib, pkgs, ... }:

let
	unstable = import
		(builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixos-unstable)
		{ config = config.nixpkgs.config; };
in
{
	programs.home-manager.enable = true;
	home.username = "mukul";
	home.homeDirectory = "/home/mukul";

	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"authy"
		"discord"
		"firefox-devedition-bin" "firefox-devedition-bin-unwrapped"
		"google-chrome"
		"idea-ultimate"
		"ngrok"
		"obsidian"
		"slack"
		"spotify" "spotify-unwrapped"
		"teamviewer"
		"vscode"
		"zoom"
	];


	imports = [
		##################
		#    PROGRAMS    #
		##################
		./programs/aria2.nix			# Download/Torrent Utility
		./programs/bat.nix				# File contents viewer
		./programs/chromium.nix			# Web browser
		./programs/exa.nix				# File lister
		./programs/feh.nix				# Image viewer
		./programs/firefox.nix			# Web browser
		./programs/fish.nix				# Shell
		./programs/fzf.nix				# Fuzzy Finder
		./programs/gh.nix				# Github CLI
		./programs/git.nix				# Version 
		./programs/go.nix				# Go Programming Language
		./programs/htop.nix				# Colorized, nicer, top
		./programs/kitty.nix			# Terminal emulator
		./programs/neovim.nix			# Terminal text editor
		./programs/obs-studio.nix		# Advanced screen recorder
		./programs/rofi.nix				# Application launcher
		./programs/ssh.nix				# SSH
		./programs/starship.nix			# Shell prompt
		./programs/texlive.nix			# LaTeX distribution
		./programs/tmux.nix				# Terminal Multiplexer
		./programs/vscode.nix			# Code editor

		##################
		#    SERVICES    #
		##################
		./services/dunst.nix			# Notifications daemon
		./services/flameshot.nix		# Screenshot tool
		./services/picom.nix			# Display compositor
		./services/polkit.nix			# Policy kit graphical agent
		./services/polybar.nix			# Desktop Bar

		##################
		#     OTHERS     #
		##################
		./other/cachix.nix				# Declarative nix cache
		./other/fonts.nix				# Fonts
		./other/gtk.nix					# GTK Configuration
		./other/x.nix					# Display protocol
		./other/xdg.nix					# Cross-desktop group (freedesktop) - controls XDG config such as nautilus sidebar dirs
	];
	# TODO
	# - Fix: chromium-widevine
	# - Add: android-sdk-platform-tools, bootstrap-studio, docker,
	#   docker-compose, howdy, prisma-studio, run-js, notion
	# - Make: grub-silent, possibly with plymouth (?)
	home.packages = with pkgs; [
		# Two-factor authentication app
		(authy.overrideAttrs (oa: { meta = oa.meta // { priority = 6; }; }))
		acpi								# Battery Tool
		b3sum                   			# BLAKE3 hashing tool 
		bitwarden               			# Password manager
		bottom								# Terminal-based task viewer
		calibre								# Ebook library
		cargo-edit							# Cargo utility
		discord                 			# Communications app
		dmg2img                 			# Disk image converter
		du-dust                 			# Terminal-based storage space viewer
		efibootmgr              			# EFI boot entry manager
		element-desktop         			# Matrix Chat Client
		etcher                  			# Disk image flasher
		fd                      			# File finder
		file								# Determines type of file
		fritzing                			# Hardware design tool
		gcc                     			# Compiler
		gimp                    			# Image editor
		gnome.gnome-font-viewer 			# Font viewer
		gnome.nautilus          			# File system explorer
		gnome.seahorse          			# Keychain viewer
		google-chrome           			# Browser
		gparted                 			# Partition manager
		grex                    			# Regex maker
		handbrake               			# Audio-video encoder
		hsetroot                			# Wallpaper setter
		hyperfine               			# Benchmarking tool
		imagemagick             			# Terminal-based photo modifier
		insomnia                			# REST client
		lm_sensors              			# Hardware sensors. Required for i3status-rust
		mailspring							# Email Client
		neofetch                			# Terminal-based system-info viewer
		ngrok                   			# Localhost proxy-tunnel
		obsidian                			# Document organiser
		polkit_gnome            			# Policy Kit Agent
		procs                   			# Terminal job viewer
		ripgrep                 			# File-content searcher
		rustup                  			# Rust toolchain manager
		sd                      			# stdin filterer
		signal-desktop          			# Communications app
		slack                   			# Communications app
		speedtest-cli           			# Network speed measurer
		spotify                 			# Music app
		tealdeer                			# Manual summarizer
		unstable.tor-browser-bundle-bin		# Tor Browser
		teamviewer              			# Remote desktop app
		unzip                   			# File unzipper
		vim                     			# Advanced text editor
		vlc                     			# Audio/video player
		wget                    			# File downloader
		youtube-dl              			# Multimedia scraper
		zoom-us                 			# Video call app
	];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
