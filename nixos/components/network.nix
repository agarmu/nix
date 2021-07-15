{ ... }:

{
	services.openssh.enable = true;
	networking = {
		firewall = {
			enable = true;
			allowedTCPPorts = [ 22 88 443 3000 8000 8080 ];
			allowedUDPPorts = [ 5353 53791 ];
		};
		wireless = {
			enable = true;
			userControlled.enable = true;
			interfaces = [ "wlp2s0" ];
			networks = {
				"MOTO1EA2" = {
					priority = 2;
				};
				"MOTO1EA2-5G" = {
					priority = 3;
				};
			};
		};
		useDHCP = false;
		interfaces.enp1s0.useDHCP = true;
		interfaces.wlp2s0.useDHCP = true;
		# proxy.default = "http://user:password@proxy:port/";
		proxy.noProxy = "127.0.0.1,localhost,internal.domain";
		hostName = "nixos-lenovo";
	};
}