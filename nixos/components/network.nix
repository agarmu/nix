{ ... }:

{
	services.openssh.enable = true;
	networking = {
		firewall = {
			enable = true;
			allowedTCPPorts = [ 22 88 443 3000 8000 8080 ];
			allowedUDPPorts = [ 5353 53791 ];
		};
                networkmanager.enable = true;
		useDHCP = false;
		interfaces.enp1s0.useDHCP = true;
		interfaces.wlp2s0.useDHCP = true;
		# proxy.default = "http://user:password@proxy:port/";
		proxy.noProxy = "127.0.0.1,localhost,internal.domain";
		hostName = "nixos-lenovo";
	};
}
