{
    description = "flake for david with Home Manager enabled";

    inputs = {
        #nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        # Home manager
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

#        hyprland.url = "github:hyprwm/Hyprland";
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
        inherit (self) outputs;
    in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs outputs;};
            # > Our main nixos configuration file <
            modules = [./nixos/configuration.nix];
        };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
        "david@nixos" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
            extraSpecialArgs = {inherit inputs outputs;};

            modules = [./home-manager/home.nix];
        };
    };
  };
}
