{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      nerdtree
      nvim-treesitter.withAllGrammars
      nvim-tree-lua
      vim-sleuth
      catppuccin-nvim
    ];
  };

  programs.tmux = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "aibarchok";
    userEmail = "aibarchok@protonmail.com";
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      palette = "catppuccin_macchiato";
      format = lib.concatStrings [ "$directory" "$character" ];
      right_format = lib.concatStrings [ "$git_branch" ];

      character = {
        success_symbol = "[ ](red)";
        error_symbol = "[ ](rosewater)";
        vimcmd_symbol = "[ ](green)";
      };

      directory = {
        truncation_length = 1;
        style = "bold pink";
      };

      git_branch = {
        symbol = "󱐚 ";
        truncation_length = 10;
        truncation_symbol = "";
        format = lib.concatStrings [ "[ $symbol$branch]($style) " ];
        style = " rosewater";
      };

      palettes = {
        catppuccin_macchiato = {
          rosewater = "#f4dbd6";
          flamingo = "#f0c6c6";
          pink = "#f5bde6";
          mauve = "#c6a0f6";
          red = "#ed8796";
          maroon = "#ee99a0";
          peach = "#f5a97f";
        };
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "macchiato";
        cursorTheme = {
          package = pkgs.catppuccin-cursors.mochaDark;
          name = "Catppuccin-Mocha-Dark-Cursors";
        };
      };
    };
  };
}


