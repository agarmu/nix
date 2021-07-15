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
			background           = "#001e26";
			foreground           = "#708183";
			selection_background = "#002731";
			selection_foreground = "#E0DBC9";
			cursor               = "#708183";
			color0               = "#002731";
			color1               = "#d01b24";
			color2               = "#728905";
			color3               = "#a57705";
			color4               = "#2075c7";
			color5               = "#c61b6e";
			color6               = "#259185";
			color7               = "#e9e2cb";
			color8               = "#001e26";
			color9               = "#bd3612";
			color10              = "#465a61";
			color11              = "#52676f";
			color12              = "#708183";
			color13              = "#5856b9";
			color14              = "#81908f";
			color15              = "#fcf4dc";
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
