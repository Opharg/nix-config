{ pkgs, ... }:
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    # NOTE: old rev/hash because git.yazi got version bumped before builds got out.
    #rev = "2a35325c7f2054d56f90d98f4595689a61a27e3b";
    rev = "b12a9ab085a8c2fe2b921e1547ee667b714185f9";
    #hash = "sha256-cmWpuxb1dLk+QHindGftC5JuFRGxDTEepVyxWToOyfc=";

    hash = "sha256-LWN0riaUazQl3llTNNUMktG+7GLAHaG/IxNj1gFhDRE=";
  };
in
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.yazi;
    shellWrapperName = "y";

    settings = {
      manager = {
        show_hidden = true;
        sort_dir_first = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
      plugin = {
        prepend_fetchers = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
      };
    };

    plugins = {
      chmod = "${yazi-plugins}/chmod.yazi";
      toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
      git = "${yazi-plugins}/git.yazi";
      mount = "${yazi-plugins}/mount.yazi";
      starship = pkgs.fetchFromGitHub {
        owner = "Rolv-Apneseth";
        repo = "starship.yazi";
        rev = "main";
        sha256 = "sha256-bhLUziCDnF4QDCyysRn7Az35RAy8ibZIVUzoPgyEO1A=";
      };
    };

    initLua = ''
      require("starship"):setup()
      require("git"):setup()

      th.git = th.git or {}
      th.git.modified = ui.Style():fg("blue")
      th.git.deleted = ui.Style():fg("red"):bold()


      th.git = th.git or {}
      th.git.modified_sign = "M"
      th.git.deleted_sign = "D"
      th.git.added_sign = "A"
      th.git.untracked_sign = "u"
      th.git.ignored_sign = "i"
      th.git.updated_sign = "U"
            		'';
    #require("full-border"):setup()

    keymap = {
      manager.prepend_keymap = [
        {
          on = "T";
          run = "plugin toggle-pane max-preview";
          desc = "Maximize or restore the preview pane";
        }
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
        {
          on = "M";
          run = "plugin mount";
        }
      ];
    };
  };
}
