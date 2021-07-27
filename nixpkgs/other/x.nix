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
				startup = [
					{
						command = "hsetroot -cover ${background-image}";
						always = true;
						notification = false;
					}
					{
						command = "systemctl --user restart polybar.service";
						always = true;
						notification = false;
					}
				];
				assigns = {

				};
				bars = [];
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
