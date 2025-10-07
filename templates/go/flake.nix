{
  description = "A basic flake for go development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      perSystem =
        { pkgs, ... }:
        {
          devShells = rec {
            dev = pkgs.mkShell {
              packages = with pkgs; [
                go
                gofumpt
              ];
            };
            default = dev;
          };

          packages = rec {
            app = pkgs.buildGoModule {
              pname = "go-app";
              version = "0.1";
              src = ./.;
              vendorHash = null;
              meta = {
                mainProgram = "go-app";
              };
            };
            default = app;
          };
        };
    };
}
