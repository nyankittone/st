{pkgs, stdenv, libX11, libXft}:
stdenv.mkDerivation rec {
  pname = "st";
  version = "0.9.2-nyan";

  src = ./.;

  nativeBuildInputs = [
    pkgs.pkg-config
  ];

  buildInputs = [
    libX11
    # libXinerama
    libXft
  ];

  buildPhase = ''
    make CC=gcc
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -f st $out/bin
    chmod 755 $out/bin/st
  '';
}
