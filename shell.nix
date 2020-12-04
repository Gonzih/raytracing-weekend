let
   pkgs = import <nixpkgs> {};
in pkgs.clangStdenv.mkDerivation rec {
  name = "raytracing";
  LIBCLANG_PATH="${pkgs.llvmPackages.libclang}/lib";
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = with pkgs; [
    clangStdenv
    clang
  ];
}
