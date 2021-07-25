{ pkgs, ... }:
let
	background-image = builtins.fetchurl {
		url = "https://images.unsplash.com/photo-1508739773434-c26b3d09e071";
		sha256 = "aeadb55b8d9fbd1db27619caff8519e82c4e730f278270e04e4c69f476ea90d4";
	};
in
{
	hardware.opengl = {
		enable = true;
		driSupport = true;
	};
	services.xserver = {
		enable = true;
		libinput = {
			enable = true;
			mouse.naturalScrolling = true;
		};
		displayManager.lightdm = {
			enable = true;
			background = background-image;
			greeters.enso = {
				enable = true;
				blur = true;
				cursorTheme = {
					name = "Yaru";
					package = pkgs.yaru-theme;
				};
			};
		};
		desktopManager.session = [
			{
				name = "home-manager";
				start = ''
					${pkgs.runtimeShell} $HOME/.xsession &
					waitPID=$!
				'';
			}
		];
	};
}