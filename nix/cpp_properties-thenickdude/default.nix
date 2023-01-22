{ stdenv, fetchFromGitHub, cmake, ninja, boost }:

stdenv.mkDerivation rec {
  pname = "cpp_properties";
  version = "2021-02-01";

  src = fetchFromGitHub {
    owner = "thenickdude";
    repo = pname;
    rev = "4a0a515dc96e4236613fa51aab5af4a32418bb8b";
    sha256 = "sha256-i/lqkWvaxwbVtoa9FmRbfgbcmlCO+LPhGsJMAsbum98=";
  };

  installPhase = ''
    mkdir $out
    cp -vr src/include $out
    cp -vr example/include/sample $out/include
  '';
}

