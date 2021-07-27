{ ... }:
{
	programs.git = {
		enable = true;
		userEmail = "agarmukul23@gmail.com";
		userName = "Mukul Agarwal";
		delta = {
			enable = true;
			options = { 
				decorations = {
					commit-decoration-style = "bold yellow box ul";
					file-decoration-style = "none";
					file-style = "bold yellow ul";
				};
				features = "decorations";
				whitespace-error-style = "22 reverse";
			};
		};
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