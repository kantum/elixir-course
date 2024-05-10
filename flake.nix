{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    allSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
      pkgs = import nixpkgs { inherit system; };
    });
  in
  {
    devShells = forAllSystems ({ pkgs }: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          figlet
          elixir_1_16
          gnumake
        ];
        shellHook = ''
        figlet "Elixir"
        '';
      };
    });
  };
}
