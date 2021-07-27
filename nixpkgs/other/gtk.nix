{ pkgs,... }: 

{
	gtk = {
		enable = true;
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
