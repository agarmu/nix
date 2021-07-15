# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-lenovo"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.userControlled.enable = true;
  networking.wireless.interfaces = [ "wlp2s0" ];
  networking.wireless.networks = {
    "MOTO1EA2" = {
      psk = "mw5k07m5c6";
      priority = 2;
    };
    "MOTO1EA2-5G" = {
      psk = "mw5k07m5c6";
      priority = 3;
    };
  };
  # Set your time zone.
  time.timeZone = "America/Chicago";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
   };

  # Setup graphical user interface
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    displayManager = {
	lightdm.enable = true;
	defaultSession = "none+awesome";
    };
    windowManager.awesome = {
    	enable = true;
	luaModules = with pkgs.luaPackages; [
          luarocks # is the package manager for Lua modules
          luadbi-mysql # Database abstraction layer
        ];

    };
    layout = "us";
    #xkbdOptions = "eurosign:e"
    libinput.enable = true;
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    nssmdns = true;
    enable = true;
    ipv4 = true;
    ipv6 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users = {
      mukul = {
          isNormalUser = true;
          extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      };
      jai = {
      	  isNormalUser = true;
      };
   };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # command line + terminal
    alacritty
    # text editors + ides
    vim neovim emacs notepadqq vscode
    # misc. gui
    firefox vscode google-chrome
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 88 443 3000 8000 8080 ];
  networking.firewall.allowedUDPPorts = [ 5353 53791 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

