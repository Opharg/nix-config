{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.git;

    # NOTE: change name and email
    userName = "Opharg";
    userEmail = "jonathan.stolte@web.de";

    extraConfig = {
      core.editor = "nvim";
      pull.rebase = "true";
      init.defaultBranch = "main";

      core.autocrlf = true;
      core.eol = "lf";
    };

    lfs.enable = true;
  };
}
