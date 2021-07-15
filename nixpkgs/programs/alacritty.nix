{ ... }:

{
    programs.alacritty = {
        enable = true;
        settings = {
            env.TERM = "alacritty-direct";
            window = {
                decorations = "Full";
                padding = { x = 2; y = 15; };
                dynamic_padding = true;
                dynamic_title = true;
                startup_mode = "windowed";
            };
            tabspaces = 4;
            draw_bold_text_with_bright_colors = true;
            debug = {
                persistent_logging = false;
            log_level = "Warn";
            };
            key_bindings = [
                {
                    key = "N";
                    mods = "Super";
                    action = "SpawnNewInstance";
                }
            ];
        };
    };
}