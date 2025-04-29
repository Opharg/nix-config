{
  lib,
  stdenvNoCC,
  fetchzip
}:

stdenvNoCC.mkDerivation {
  pname = "figtree";
  version = "2.0.3";

  src = fetchzip {
    url = "https://github.com/erikdkennedy/figtree/archive/refs/tags/v2.0.3.zip";
    hash = "sha256-owzoM0zfKYxLJCQbL1eUE0cdSLVmm+QNRUGxbsNJ37I=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/opentype
    install -Dm644 fonts/otf/*.otf -t $out/share/fonts/opentype

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://www.erikdkennedy.com/projects/figtree.html";
    description = "A simple and friendly geometric sans serif font.";
    license = licenses.ofl;
    maintainers = [ opharg ];
    platforms = platforms.all;
  };
}
