{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "david-fisher-1993";
        userEmail = "david.1993.fisher@gmail.com";
        aliases = {
            pu = "push";
            co = "checkout";
            cm = "commit";
        };
    };
}
