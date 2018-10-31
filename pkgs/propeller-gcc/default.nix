{ stdenv, wget, bison, flex, expat, fetchurl, texinfo, fetchgit }:

let
  version = "2018-04-14";


  srcs = import ./srcs.nix { inherit fetchgit; inherit fetchurl; };

  in stdenv.mkDerivation rec {
  name = "propeller-gcc-${version}";
  CFLAGS="-Wno-implicit-fallthrough -Wno-format-security";

  buildInputs = [ texinfo wget texinfo bison flex expat ];

  src = srcs.pgcc;

  patches = [
    ./gcc-cfns.patch
    ./gcc-docs.patch
    ./spinsim-format.patch
  ];

#  prePatch = ''
#  '';
#  installPhase = ''
#    mkdir -p $out/bin
#    mv build/openspin $out/bin/openspin
#  '';

  postUnpack = ''
    tar -zxvf ${srcs.mpc}  -C $sourceRoot/gcc
    tar -jxvf ${srcs.mpfr} -C $sourceRoot/gcc
    tar -jxvf ${srcs.gmp}  -C $sourceRoot/gcc
    tar -jxvf ${srcs.isl}  -C $sourceRoot/gcc

    ln -sf    mpc-0.8.1 $sourceRoot/gcc/mpc
    ln -sf    mpfr-2.4.2 $sourceRoot/gcc/mpfr
    ln -sf    gmp-4.3.2 $sourceRoot/gcc/gmp
    ln -sf    isl-0.14 $sourceRoot/gcc/isl
  '';

  meta = with stdenv.lib; {
    description = "A port of GCC to the Parallax Propeller";
    homepage = https://github.com/dbetz/propeller-gcc;
    license = licenses.gpl3;
    maintainers = [ maintainers.redvers ];
    platforms = platforms.all;
  };
}
