{ ... }: 

{
	programs.fish = {
		enable = true;
		shellAliases = {
			## Rust rewrites
			#cat      = "echo FATAL: Use bat";   # https://github.com/sharkdp/bat
			#ls       = "echo FATAL: Use exa";   # https://github.com/ogham/exa
			#find     = "echo FATAL: Use fd";    # https://github.com/sharkdp/fd
			#sed      = "echo FATAL: Use sd";    # https://github.com/chmln/sd
			#du       = "echo FATAL: Use dust";  # https://github.com/bootandy/dust
			#grep     = "echo FATAL: Use rg";    # https://github.com/BurntSushi/ripgrep
			#ps       = "echo FATAL: Use procs"; # https://github.com/dalance/procs
			#top      = "echo FATAL: Use btm";   # https://github.com/ClementTsang/bottom
			#regexgen = "echo FATAL: Use grex";  # https://github.com/pemistahl/grex

			# tldr       -> tealdeer, but bin is still tldr      @ https://github.com/dbrgn/tealdeer
			# Worth mentioning:
			# - cd       -> zoxide                               @ https://github.com/ajeetdsouza/zoxide
			# - hyperfine                                        @ https://github.com/sharkdp/hyperfine
			# - tokei                                            @ https://github.com/XAMPPRocky/tokei
			# - bandwhich                                        @ https://github.com/imsnif/bandwhich
			# - nushell                                          @ https://github.com/nushell/nushell
			# - starship                                         @ https://github.com/starship/starship

			## Other
			ls       = "exa --icons";
			sl       = "exa --icons";
			la		 = "exa -alh";
			ll		 = "exa -lh";
			tree	 = "exa --tree";
			tral	 = "exa --tree -lah";
			open     = "xdg-open";
		};
		
	};
}
