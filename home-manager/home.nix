{ inputs, lib, config, pkgs, ... }: {
    # You can import other home-manager modules here
    imports = [
        # If you want to use home-manager modules from other flakes (such as nix-colors):
        # inputs.nix-colors.homeManagerModule

        # You can also split up your configuration and import pieces of it here:
        # ./nvim.nix
    ];

    nixpkgs = {
        # You can add overlays here
        overlays = [
            # If you want to use overlays exported from other flakes:
            # neovim-nightly-overlay.overlays.default

            # Or define it inline, for example:
            # (final: prev: {
            #   hi = final.hello.overrideAttrs (oldAttrs: {
            #     patches = [ ./change-hello-to-hi.patch ];
            #   });
            # })
        ];

        # Configure your nixpkgs instance
        config = {
            # Disable if you don't want unfree packages
            allowUnfree = true;
            # Workaround for https://github.com/nix-community/home-manager/issues/2942
            allowUnfreePredicate = _: true;
        };
    };

    home = {
        username = "david";
        homeDirectory = "/home/david";
    };

    # Add stuff for your user as you see fit:
    # programs.neovim.enable = true;
    home.packages = with pkgs; [ 
        steam
        thunderbird
    ];

    # Enable home-manager and git
    programs.home-manager.enable = true;
    programs.git.enable = true;

    wayland.windowManager.hyprland = {
        enable = true;

        settings = {

        };
    };
    
    
#   wayland.windowManager.hyprland.settings = {
#     "$mod" = "SUPER";
#     bind =
#       [
#         "$mod, F, exec, firefox"
#         ", Print, exec, grimblast copy area"
#       ]
#       ++ (
#         # workspaces
#         # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
#         builtins.concatLists (builtins.genList (i:
#             let ws = i + 1;
#             in [
#               "$mod, code:1${toString i}, workspace, ${toString ws}"
#               "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
#             ]
#           )
#           9)
#       );
#   };

    # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

    home.stateVersion = "24.11"; #https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion


  # gtk = {
  #   enable = "true";
  #   theme.name = "";
  #   cursorTheme.name = "Bibata-Modern-Ice";
  #   iconTheme.name = "GruvboxPlus";
  # };

  # xdg.mimeApps.defaultApplications = {
  #   "text/plain" = [ "neovide.desktop" ];
  #   "application/pdf" = [ "zathura.desktop" ];
  #   "image/*" = [ "sxiv.desktop" ];
  #   "video/png" = [ "mpv.desktop" ];
  #   "video/jpg" = [ "mpv.desktop" ];
  #   "video/*" = [ "mpv.desktop" ];
  # };
}