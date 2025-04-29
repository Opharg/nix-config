{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = [
    pkgs.dotnet-sdk_9
    pkgs.icu
  ];

  shellHook = ''
    export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
  '';
}
