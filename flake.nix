{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    qornflakes.url = "github:guilloteauq/qornflakes";
  };

  outputs = { self, nixpkgs, qornflakes }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    qorn = qornflakes.packages.${system};
  in
  {

    devShells.${system} = {
      default = pkgs.mkShell {
        buildInputs = [
          pkgs.python3
          pkgs.vagrant
          qorn.enoslib
        ];
      };
    };
  };
}
