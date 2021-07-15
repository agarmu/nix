{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "mukul";
  home.homeDirectory = "/home/mukul";
  home.packages = [
  	pkgs.rustup pkgs.acpi pkgs.neovide
];
  programs.git = {
  	enable = true;
	userName = "Mukul Agarwal";
	userEmail = "agarmukul23@gmail.com";
  };

  programs.alacritty = {
  	enable = true;
	settings = {
	    env.TERM = "alacritty-direct";
	    window = {
	    	    decorations = "Full";
		    padding = { x = 2; y = 15; };
		    dynamic_padding = true;
		    dynamic_title = true;
		    startup_mode = "windowed";
	    };
	    tabspaces = 4;
	    draw_bold_text_with_bright_colors = true;
	    debug = {
	    	persistent_logging = false;
		log_level = "Warn";
	    };
	    key_bindings = [
		{
			key = "N";
			mods = "Super";
			action = "SpawnNewInstance";
		}
	    ];
	};
  };
  programs.htop = {
	enable = true;
	settings = {
		color_scheme = 6;
		cpu_count_from_one = 0;
		delay = 15;
		fields = with config.lib.htop.fields; [
			PID
			USER
			PRIORITY
			NICE
			M_SIZE
			M_RESIDENT
			M_SHARE
			STATE
			PERCENT_CPU
			PERCENT_MEM
			TIME
			COMM
		];
		highlight_base_name = 1;
		highlight_megabytes = 1;
		highlight_threads = 1;
	} 
	// (with config.lib.htop; leftMeters [
	  (bar "AllCPUs2")
	  (bar "Memory")
	  (bar "Swap")
	  (text "Zram")
	]) // (with config.lib.htop; rightMeters [
	  (text "Tasks")
	  (text "LoadAverage")
	  (text "Uptime")
	  (text "Systemd")
	]);

};

programs.bat = {
	enable = true;
	config.theme = "Dracula";
	themes = {
		dracula = builtins.readFile( pkgs.fetchFromGitHub {
			owner = "dracula";
			repo = "sublime";
			rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
			sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
		} + "/Dracula.tmTheme");
	};
};
programs.exa = {
	enable = true;
};
programs.feh = {
	enable = true;
};

programs.fish = {
	enable = true;
	shellAliases = {
		la = "exa -alh";
		ll = "exa -lh";
		tree = "exa --tree";
		tral = "exa --tree -lah";
	};
};
programs.fzf.enable = true;
programs.gh.enable = true;
programs.go.enable = true;
programs.aria2.enable = true;
programs.ssh = {
	enable = true;
	compression = true;
};
programs.starship.enable = true;
programs.texlive.enable = true;
programs.tmux.enable = true;
programs.vscode.enable = true;

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
