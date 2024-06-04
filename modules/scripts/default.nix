{ pkgs, ... }:
{
  tmux-sessionizer = pkgs.callPackage ./tmux-sessionizer.nix {};
  collect-garbage = pkgs.callPackage ./collect-garbage.nix {};
  gpuinfo = pkgs.callPackage ./gpuinfo.nix {};
}
