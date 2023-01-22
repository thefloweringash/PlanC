{
  description = "PlanC";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux = 
      let 
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in
      rec {
        planc = pkgs.callPackage ./nix/planc.nix {
          inherit self; # for source, maybe there's a better way?
          inherit cpp_properties zstr; # TODO overlay instead for splicing
        };

        cpp_properties = pkgs.callPackage ./nix/cpp_properties-thenickdude {};

        zstr = pkgs.callPackage ./nix/zstr {};

        default = self.packages.x86_64-linux.planc;
      };
  };
}
