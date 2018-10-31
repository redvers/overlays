with import <nixpkgs> { overlays = [ (import ./default.nix) ]; }; { inherit openspin propeller-gcc; }
