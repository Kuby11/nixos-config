{pkgs, ...}:
{
  programs.qylock = {
    enable = true;
    # theme = "enfield";
    sddm.enable = true;
    quickshell.enable = true;

    # Optional per-theme tweaks (replaces the interactive prompts):
    # themeOptions = {
    #   terraria.backgroundMode = "time";              # time | random | static
    #   Genshin.backgroundMode = "time";
    #   clockwork.orbital = { themeMode = "dark"; enableWindup = true; };
    #   osu.gameMode = "menu";                         # menu | game
    # };
  };
}
