{ stdenv, fetchFromGitHub, cmake, zlib }:

stdenv.mkDerivation rec {
  pname = "zstr";
  version = "1.0.7";

  src = fetchFromGitHub {
    owner = "mateidavid";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-NVwfzDraZKn6CUjHctc03uokvvozxF5h8YbKS0BkyTI=";
  };

  propagatedBuildInputs = [ zlib ];

  installPhase = ''
    mkdir $out $out/include
    cp src/{*.h,*.hpp} $out/include
  '';
}
