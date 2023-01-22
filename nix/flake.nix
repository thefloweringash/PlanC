{
  description = "PlanC";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        boost = pkgs.boost175;
      in
      rec {
        PlanC = pkgs.callPackage ./planc.nix {
          inherit cpp_properties zstr boost; # TODO overlay instead for splicing
        };

        cpp_properties = pkgs.callPackage ./cpp_properties.nix {
          inherit boost;
        };

        zstr = pkgs.callPackage ./zstr.nix {};

        default = self.packages.x86_64-linux.PlanC;
      };
  };
}
