{ ... }:

{
	programs.git = {
		enable = true;
		userEmail = "agarmukul23@gmail.com";
		userName = "Mukul Agarwal";
		# TODO: Add signing
		#signing = {
		#	signByDefault = true;
		#	key = "";
		#};
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