{
  description = "A collection of my personal flake templates";

  outputs =
    { self, ... }:
    {
      templates = {
        plethora = {
          path = ./templates/plethora;
          descripion = "A simple flake that does not do anything";
        };
        go = {
          path = ./templates/go;
          description = "A simple flake for go development";
        };
        java = {
          path = ./templates/java;
          description = "A simple flake for java development";
        };
      };

      defaultTemplate = self.templates.plethora;
    };
}
