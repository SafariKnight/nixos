{ config, ... }:
{
  assertions = [
    {
      assertion = !(config.modules.boot.greetd.enable && config.modules.boot.sddm.enable);
      message = "greetd and sddm aren't compatable with each other";
    }
  ];
}
