{ pkgs, ... }:
{
	services.polybar = {
		enable = true;
		package = pkgs.polybar.override {
			i3GapsSupport = true;
			alsaSupport = true;
			iwSupport = true;
			githubSupport = true;
		};
		settings = {
			"bar/top" = {
				monitor = "eDP-1";
				width = "100%";
				height = "3%";
				radius = 3;
				modules-left = "i3";
				modules-right = "date";
			};
			"module/date" = {
				type = "internal/date";
				internal = 5;
				date = "%Y-%m-%d";
				time = "%H:%M";
				label = "%date% %time%";
			};
			"module/i3" = {
				type = "internal/i3";
				scroll-up = "i3wm-wsnext";
				scroll-down = "i3wm-wsprev";
			};
			"module/volume" = {
				type = "internal/pulseaudio";
				format.volume = "<ramp-volume> <label-volume>";
				label.muted.text = "🔇";
				label.muted.foreground = "#666";
				ramp.volume = ["🔈" "🔉" "🔊"];
				click.right = "pavucontrol &";
			};
		};
		script = "polybar top &";
	};
}