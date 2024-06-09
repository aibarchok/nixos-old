{
  description = "Aibarchok's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      UserName = "aibarchok";
      HostName = "nixos";
      pkgs = import nixpkgs {
        inherit system; overlays = [
        (self: super: {
          prismlauncher-unwrapped = super.prismlauncher-unwrapped.overrideAttrs (oldAttrs: {
            version = "8.0-2";
            src = pkgs.fetchFromGitHub {
              owner = "Octol1ttle";
              repo = "ElyPrismLauncher";
              rev = "8.0-2";
              hash = "sha256-hL4MVSB6ctdBfgCiJ2jDEsm2PYRaoHD1vV2lXnRtZo8=";
            };
          });
        })
        inputs.neovim-nightly-overlay.overlay
      ];

        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = { inherit inputs UserName HostName; };
        modules = [
          ./core
          home-manager.nixosModules.home-manager
          (config: {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${UserName} = config.users.${UserName} or import ./home;
          })
        ];
      };
    };
}  



