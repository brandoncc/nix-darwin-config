{ ... }:

# Wrap ~/dev/llm-memories/bin/llm-memories as `llm-memories` on the personal
# machine only. The tool serves the local wiki / recall browser; the wiki and
# recall data only exist here.
{
  home.file."bin/llm-memories" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      exec "$HOME/dev/llm-memories/bin/llm-memories" "$@"
    '';
  };
}
