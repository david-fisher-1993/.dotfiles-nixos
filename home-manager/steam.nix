{ config, pkgs, ... }:

{
    programs.steam.enable = true;
    #programs.steam.gamescopeSession.enable = true;

    programs.gamemode.enable = true;
 
    #USAGE
    #gamemoderun %command%
    #mangohud %command%
    #gamescope %command%

    protonup -d "~/.steam/root/compatibilitytools.d/"
}