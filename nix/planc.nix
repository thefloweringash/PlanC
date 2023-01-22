{ stdenv,
  lib,
  meson,
  ninja,
  pkg-config,

  boost,
  cpp_properties,
  cryptopp,
  leveldb,
  snappy,
  zlib,
  zstr,

  self # this flake
}:

stdenv.mkDerivation {
  name = "PlanC";

  src = self;

  nativeBuildInputs = [ meson ninja pkg-config ];

  buildInputs = [ 
    boost
    cpp_properties
    cryptopp
    leveldb
    snappy
    zlib
    zstr
  ];

  # Meson is no longer able to pick up Boost automatically.
  # https://github.com/NixOS/nixpkgs/issues/86131
  BOOST_INCLUDEDIR = "${lib.getDev boost}/include";
  BOOST_LIBRARYDIR = "${lib.getLib boost}/lib";

  preBuild = ''
    mkdir zstr
    ln -s ${zstr}/include zstr/src
  '';

  meta.mainProgram = "planc";
}

