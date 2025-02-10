{...}:

{
  programs.git = {
    enable = true;

    hooks = {
      pre-commit = ./hooks/pre-commit;
      pre-push = ./hooks/pre-push;
    };
  };
}
