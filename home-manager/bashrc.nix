{ config, pkgs, ... }:

{
    programs.bash = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
    };
}