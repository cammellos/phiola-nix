 { stdenv, lib
, pkgs
, fetchurl
, autoPatchelfHook
}:

stdenv.mkDerivation rec {
  pname = "phiola";
  version = "2.2.5";

  src = fetchurl {
    url = "https://github.com/stsaz/phiola/releases/download/v${version}/phiola-${version}-linux-amd64.tar.zst";
    hash = "sha256-+fgOWYoQrOXZlGYqbxKprGCdUW0P81USgussDQNpzyI=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    pkgs.gtk3.dev
    pkgs.alsa-lib.dev
    pkgs.pulseaudio.dev
    pkgs.jack2.dev
  ];

  sourceRoot = ".";

  unpackPhase = ":";

  installPhase = ''
    runHook preInstall
    echo "HERE"
    mkdir -p $out/bin
    tar xf $src -C $out/bin
    ln -s $out/bin/phiola-2/phiola $out/bin/phiola
    echo "BEAR"
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/stsaz/phiola";
    description = "Fast audio player, recorder, converter for Windows, Linux & Android.";
    platforms = platforms.linux;
  };
}
