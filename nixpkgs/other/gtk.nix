{ pkgs,... }: 

{
	gtk = {
		enable = true;
		font = {
			name = " FiraCode Nerd Font Mono";
			size = 11;
		};
		iconTheme = {
			name = "gruvbox-dark-icons";
			package = pkgs.gruvbox-dark-icons-gtk;
		};
		theme = {
			name = "gruvbox-dark";
			package = pkgs.gruvbox-dark-gtk;
		};
		gtk3 = {
			extraCss = ''
				.background decoration {
					padding: 0px;
					border: 0px;
				}
			'';
		};
	};
}
