{ ... }:

{
	security.sudo.wheelNeedsPassword = false;
	users = {
		mutableUsers = false;
		users.mukul = {
			isNormalUser = true;
			home = "/home/mukul";
			description = "Mukul Agarwal";
			extraGroups = [ "wheel" ];
		};	
	};
}