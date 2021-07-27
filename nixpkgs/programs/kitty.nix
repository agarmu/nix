{ ... }: 

{
	programs.kitty = {
		enable = true;
		
		font = {
			name = "FiraCode Nerd Font Mono";
		};

		settings = {
			# Shell
			shell = "fish";

			# Cursor
			cursor_shape = "beam";

			# Scrollback
			scrollback_lines = -1;
			
			# Mouse
			mouse_hide_wait = -1;
			copy_on_select = "yes";
			strip_trailing_spaces = "smart";
		 
			# Window
			window_padding_width = 5;

			# Tab bar
			tab_bar_edge = "top";
			tab_bar_style = "fade";

			# Colors
			# gruvbox-dark colorscheme for kitty
			# https://gist.github.com/lunks/0d5731693084b2831c88ca23936d20e8
			foreground				= "#ebdbb2";
			background				= "#272727";
			selection_foreground	= "#655b53";
			selection_background	= "#ebdbb2";
			url_color				= "#d65c0d";
			# black
			color0					= "#272727";
			color8					= "#928373";
			# red
			color1 					= "#cc231c";
			color9 					= "#fb4833";
			# green
			color2 					= "#989719";
			color10					= "#b8ba25";
			# yellow
			color3 					= "#d79920";
			color11					= "#fabc2e";
			# blue
			color4					= "#448488";
			color12					= "#83a597";
			# magenta
			color5 					= "#b16185";
			color13					= "#d3859a";
			# cyan
			color6 					= "#689d69";
			color14					= "#8ec07b";
			# white
			color7 					= "#a89983";
			color15					= "#ebdbb2";
		};

		keybindings = {
			# Clipboard
			"ctrl+c" = "copy_and_clear_or_interrupt";
			"ctrl+shift+v" = "paste_from_clipboard";

			# Window management
			"ctrl+n" = "new_os_window_with_cwd";
			
			# Tab management
			"ctrl+t" = "new_tab";
			"ctrl+w" = "close_tab";
		};
	};
}
