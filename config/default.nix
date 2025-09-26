{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  # Global options - aka. let
  globals = {
    # Sets the leader key
    mapleader = " ";
  };

  # Local options - aka. set
  opts = {
    number = true;
    mouse = "a";
    ignorecase = true;
    smartcase = true;
    cursorline = true;
  };

  # Sets the theme i want to use in neovim
  colorschemes.tokyonight.enable = true;

  # Configure LSP servers
  lsp.servers = {
    # Applies to all LSP servers
    "*" = {
      # TODO: Do i need to pass capabilities from cmp_nvim_lsp here, or is it done
      # automatically?
      settings = { };
    };

    clangd = {
      enable = true;
      # This forces the language server to use the clangd instance on path e.g. in a nix flake :)
      package = null;
      settings = {
        filetypes = [ "c" "cpp" "h" "hpp" ];
        root_markers = [ "compile_commands.json" "compile_flags.txt" ];
      };
    };
  };

  plugins = {

    # Enable lazygit plugin in nvim
    lazygit.enable = true;
    
    # Enable telescope
    telescope.enable = true;

    # Provide more capabilities to lsp servers
    cmp = {
      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "nvim_lsp_signature_help"; }
        { name = "nvim_lsp_document_symbol"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "git"; }
        { name = "buffer"; }
      ];
    };

    # Enable and configure the tree-sitter plugin
    treesitter = {
      enable = true;
      folding = true;
        nixvimInjections = true;

      settings = {
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = true;
        };

        indent = { enable = true; };
      };
    };

    # Nix specific plugins
    direnv.enable = true;
    nix.enable = true;
    nix-develop.enable = true;

  };
}
