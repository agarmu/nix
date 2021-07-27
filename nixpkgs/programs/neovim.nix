{ pkgs, ... }:
{
    programs.neovim = {
        enable = true;
        extraConfig = ''
        colorscheme gruvbox
        let g:context_nvim_no_redraw = 1
        set mouse=a
        set number
        set termguicolors
    	'';
    	plugins = with pkgs.vimPlugins; [
			coc-nvim
			coc-rust-analyzer
			coc-css
			coc-yaml
			coc-json
			coc-cmake
        	editorconfig-vim
        	gruvbox
			neogit
			ferret
    		vim-airline
    		vim-elixir
        	vim-nix
    	];
    	viAlias = true;
    	vimAlias = true;
    	vimdiffAlias = true;

		withNodeJs = true;
		withPython3 = true;
		withRuby = true;
    };
}