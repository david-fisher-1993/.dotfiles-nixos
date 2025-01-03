{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # networking.firewall = {
  #   enable = true;
  #   allowedTCPPorts = [ 137 138 139 445 ];
  #   allowedUDPPorts = [ 137 138 ];
  # };
}