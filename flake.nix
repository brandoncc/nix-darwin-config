{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, darwin, mac-app-util, ... }: {
    darwinConfigurations = {
      personal = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          # https://github.com/hraban/mac-app-util fixes common problems with apps installed on mac
          mac-app-util.darwinModules.default
          ./flake-config/personal.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.brandoncc = import ./home-manager/personal.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
            home-manager.extraSpecialArgs = {
              inputs = inputs;
            };

            home-manager.sharedModules = [
              mac-app-util.homeManagerModules.default
            ];
          }
        ];
        specialArgs = {
          inputs = inputs;
        };
      };

      work = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          # https://github.com/hraban/mac-app-util fixes common problems with apps installed on mac
          mac-app-util.darwinModules.default
          ./flake-config/work.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.brandoncc = import ./home-manager/work.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
            home-manager.extraSpecialArgs = {
              inputs = inputs;
            };

            home-manager.sharedModules = [
              mac-app-util.homeManagerModules.default
            ];
          }
        ];
        specialArgs = {
          inputs = inputs;
        };
      };
    };
  };
}
