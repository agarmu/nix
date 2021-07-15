# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"Oracle_VM_VirtualBox_Extension_Pack"
	];
	programs.dconf.enable = true;
	nix.trustedUsers = [ "mukul" ];
	nix.autoOptimiseStore = true;	
	system.stateVersion = "21.05";

	imports = [
		##################
		#   COMPONENTS   #
		##################
		./components/accounts.nix
		./components/boot.nix
		./components/network.nix
		./components/printing.nix
		./components/avahi.nix
		./components/sound.nix
		./components/time.nix
		./components/xserver.nix
		./components/file-system.nix

		##################
		#    PROGRAMS    #
		##################
		./components/programs/gnome-keyring.nix # Keychain daemon
		./components/programs/gpg.nix           # Encryption tool

		##################
		#   GENERATED    #
		##################
		./hardware-configuration.nix

		##################
		#    PRIVATE     #
		##################
		./auth.nix
	];  

	environment.systemPackages = [ pkgs.vim ];
}

