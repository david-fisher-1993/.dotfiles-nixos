{ config, pkgs, ... }:

{
    programs.mako = {
        enable = true;
    };

    programs.libnotify = {
        enable = true;
    }
}