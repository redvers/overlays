self: super:
{
  openspin      = super.callPackage ./pkgs/openspin { };
  propeller-gcc = super.callPackage ./pkgs/propeller-gcc { };
}
