{ pkgs, lib, config, inputs, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ./audio.nix
            ./networking.nix
            ./nvidia.nix
            ./services.nix
            ./users.nix
        ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    hardware.bluetooth.enable = true;hardware.bluetooth.enable = true;

    nixpkgs = {
        overlays = [];
        config = {
            allowUnfree = true;
        };
    };

    nix = let
        flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in {
        settings = {
            experimental-features = "nix-command flakes";

            # Opinionated: disable global registry
            flake-registry = "";

            # Workaround for https://github.com/NixOS/nix/issues/9574
            nix-path = config.nix.nixPath;
        };

        # Opinionated: disable channels
        channel.enable = false;

        # Opinionated: make flake registry and nix path match flake inputs
        registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
        nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

    # nix.nixPath = [
    #   "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    #   "nixos-config=${config.users.users.david.home}/.dotfiles-nixos/nixos/configuration.nix"
    #   "/nix/var/nix/profiles/per-user/root/channels"
    # ];

    environment.systemPackages = with pkgs; [
        firefox
        dolphin
        kitty
        git
        vscodium
        obsidian
        #  wget
        #libnotify
        #swaybg
        #rofi-wayland
        #tidal-hifi
        #xclip
    ];

    programs.nm-applet.enable = true;

    system.stateVersion = "24.11"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
}
