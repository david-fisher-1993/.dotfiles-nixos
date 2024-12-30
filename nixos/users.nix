{ config, pkgs, ... }:

{
  users.users.david = {
    isNormalUser = true;
    description = "David Fisher";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.bash;
    packages = with pkgs; [];
  };
}
