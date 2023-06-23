{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        drv = pkgs.writeShellApplication {
          name = "cabal-explain";
          runtimeInputs = with pkgs; [ curl lowdown ];
          text = builtins.readFile ./cabal-explain;
        };
      in {
        packages = {
          cabal-explain = drv;
          default = drv;
        };
        apps = rec {
          cabal-explain = flake-utils.lib.mkApp { inherit drv; };
          default = cabal-explain;
        };
      });
}
