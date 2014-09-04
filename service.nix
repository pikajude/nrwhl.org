{ config, pkgs, lib ? pkgs.lib, ... }:

with lib;

let
  cfg = config.services.narwhal;
in
{
  options = {
    services.narwhal = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Run the narwhal client.
        '';
      };

      package = mkOption {
        type = types.path;
        description = "Package to use.";
      };

      environment = mkOption {
        type = with types; uniq (enum ["Development" "Staging" "Production"]);
        description = ''
          Environment narwhal should run in.
        '';
      };

      listenOn = mkOption {
        type = with types; uniq int;
        description = ''
          TCP port narwhal should listen on.
        '';
      };

      database = mkOption {
        type = with types; uniq attrs;
        description = "the database configuration";
      };

      http = mkOption {
        type = with types; uniq attrs;
        description = "the HTTP configuration";
      };

      aws = mkOption {
        type = with types; uniq attrs;
        description = "the AWS configuration";
      };

      airbrake = mkOption {
        type = with types; uniq attrs;
        description = "the Airbrake configuration";
      };

      user = mkOption {
        type = with types; uniq string;
        default = "narwhal";
        description = ''
          Who should run the narwhal process.
        '';
      };

      stateDir = mkOption {
        type = types.string;
        description = "Where to put assets in the service.";
        default = "/var/lib/narwhal";
      };
    };
  };

  config = mkIf cfg.enable {
    users.extraUsers."${cfg.user}" = {
      description = "Narwhal runner.";
      home = cfg.stateDir;
      createHome = true;
      useDefaultShell = true;
    };

    systemd.services.narwhal = {
      wantedBy = [ "multi-user.target" ];
      requires = [ "postgresql.service" ];
      after = [ "postgresql.service" ];
      description = "Run narwhal";
      serviceConfig.User = cfg.user;
      environment = {
        # app stuff
        HOME = "/homeless-shelter";
        PORT = toString cfg.http.port;
        APPROOT = cfg.http.approot;

        # airbrake
        AIRBRAKE_API_KEY = cfg.airbrake.key;

        # AWS
        AWS_ACCESS_KEY_ID = cfg.aws.key;
        AWS_ACCESS_KEY_SECRET = cfg.aws.secret;

        # database
        PGHOST = cfg.database.host;
        PGPORT = toString cfg.database.port;
        PGUSER = cfg.database.user;
        PGPASS = cfg.database.password;
        PGDATABASE = cfg.database.name;
      };
      script = ''
        mkdir -p ${cfg.stateDir}
        cd ${cfg.stateDir}
        mkdir -p config
        mkdir -p static
        ln -sfv ${cfg.package}/static/{combined,css,fonts,img,js} static/
        ln -sfv ${cfg.package}/config/settings.yml config/settings.yml
        ${cfg.package}/bin/narwhal ${cfg.environment}
      '';
    };
  };
}
