{ ... }:
{
	programs.git = {
		enable = true;
		userEmail = "agarmukul23@gmail.com";
		userName = "Mukul Agarwal";
		signing = {
			signByDefault = true;
			key = null;
		};
		extraConfig = {
			core = {
				editor = "code --wait --new-window";
			};
			init = {
				defaultBranch = "main";
			};
			tag = {
				forceSignAnnotated = true;
			};
		};
	};
}