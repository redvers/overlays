{ fetchurl, fetchgit }:

{
   pgcc = fetchgit {
     url = "https://github.com/dbetz/propeller-gcc";
     rev = "2a39bdcf0ee581830938c7b776191c24f0433f3d";
     sha256 = "0ni2a5rd4pxw89v9hfvs4xpy5ax23gmfkmg1r1z0y3ad5809i8z2";
     fetchSubmodules = true;
   };
   mpfr = fetchurl {
     url = "https://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2";
     sha256 = "1fpjphja2ridy1wfc53mcbavj4axl28ibvnawj1217flm045mry7";
   };
   gmp = fetchurl {
     url = "ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2";
     sha256 = "0x8prpqi9amfcmi7r4zrza609ai9529pjaq0h4aw51i867064qck";
   };
   mpc = fetchurl {
     url = "ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz";
     sha256 = "1r73zqw8lnf0bkfsxn0znbwbfyacg94pd0l4aaixh7r5awvn0r76";
   };
   isl = fetchurl {
     url = "ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.14.tar.bz2";
     sha256 = "0dlg4b85nw4w534525h0fvb7yhb8i4am8kskhmm0ym7qabzh4g3y";
   };
}

