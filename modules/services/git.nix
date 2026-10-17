{ pkgs, ...}:
{
  programs.gh = {
    enable = true;

    settings = {
      git_protocol = "ssh";
    };

    gitCredentialHelper = {
      enable = true;
      hosts = [ "github.com" ];
    };
  };

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "kuby11";
        email = "saab112468@gmail.com";
      };
    };
  };
}
