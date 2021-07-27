{ config, pkgs, lib, ... }:
let
	background-image = builtins.fetchurl {
		url = "https://raw.githubusercontent.com/adi1090x/polybar-themes/master/wallpapers/bg_18.jpg";
		sha256 = "039013e564892c8ff26e8a53531146d092c3e4d586e47ac861d25e305c4cb0b2";
	};
in
{
	xsession = {
		enable = true;
		windowManager.i3 = {
			enable = true;
			package = pkgs.i3-gaps;
			extraConfig = ''for_window [class=".*"] border pixel 0'';
			config = {
				menu = "rofi -show drun";
				modifier = "Mod4";
				floating.modifier = "Mod4";
				focus.followMouse = true;
				gaps.inner = 10;
				terminal = "kitty";
				defaultWorkspace = "workspace number 1";
				startup = [{ command = "hsetroot -cover ${background-image}"; notification = false; }];
				bars = [
					{
						command = "i3bar --transparency";
						position = "top";
						statusCommand = "i3status-rs ~/.config/i3status-rust/config-default.toml";
						fonts = {
							names = ["pango:DejaVu Sans" "FontAwesome"];
							size = 10.0;
						};
						colors = {
							background  = "#FFFFFF80";
							statusline = "#000000FF";
							inactiveWorkspace = {
								background = "#FFFFFF80";
								border = "#FFFFFF80";
								text = "#000000FF";
							};
							focusedWorkspace = {
								background = "#006EF5FF";
								border = "#FFFFFF80";
								text = "#FFFFFFFF";
							};
						};
					}
				];
				keybindings = 
				  let
					mod = config.xsession.windowManager.i3.config.modifier;
					menu = config.xsession.windowManager.i3.config.menu;
				  in lib.mkOptionDefault {
					"${mod}+space" = ''exec "${menu}"'';
					"${mod}+b" = ''exec "firefox-devedition"'';
				  	"${mod}+shift+s" = "focus mode_toggle";
					"${mod}+d" = "focus child";
					"${mod}+shift+x" = ''exec "flameshot gui"'';
					"${mod}+shift+enter" = ''exec "alacritty"'';
				};
			};
		};
	};
}
