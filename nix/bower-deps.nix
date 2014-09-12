{ self, fetchurl, fetchgit ? null, lib }:

{
  by-spec."abbrev"."1" =
    self.by-version."abbrev"."1.0.5";
  by-version."abbrev"."1.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "abbrev-1.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/abbrev/-/abbrev-1.0.5.tgz";
        name = "abbrev-1.0.5.tgz";
        sha1 = "5d8257bd9ebe435e698b2fa431afde4fe7b10b03";
      })
    ];
    buildInputs =
      (self.nativeDeps."abbrev" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "abbrev" ];
  };
  by-spec."abbrev"."~1.0.4" =
    self.by-version."abbrev"."1.0.5";
  by-spec."amdefine".">=0.0.4" =
    self.by-version."amdefine"."0.1.0";
  by-version."amdefine"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "amdefine-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/amdefine/-/amdefine-0.1.0.tgz";
        name = "amdefine-0.1.0.tgz";
        sha1 = "3ca9735cf1dde0edf7a4bf6641709c8024f9b227";
      })
    ];
    buildInputs =
      (self.nativeDeps."amdefine" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "amdefine" ];
  };
  by-spec."ansi-regex"."^0.2.0" =
    self.by-version."ansi-regex"."0.2.1";
  by-version."ansi-regex"."0.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "ansi-regex-0.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ansi-regex/-/ansi-regex-0.2.1.tgz";
        name = "ansi-regex-0.2.1.tgz";
        sha1 = "0d8e946967a3d8143f93e24e298525fc1b2235f9";
      })
    ];
    buildInputs =
      (self.nativeDeps."ansi-regex" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ansi-regex" ];
  };
  by-spec."ansi-regex"."^0.2.1" =
    self.by-version."ansi-regex"."0.2.1";
  by-spec."ansi-regex"."^1.0.0" =
    self.by-version."ansi-regex"."1.1.0";
  by-version."ansi-regex"."1.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "ansi-regex-1.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ansi-regex/-/ansi-regex-1.1.0.tgz";
        name = "ansi-regex-1.1.0.tgz";
        sha1 = "67792c5d6ad05c792d6cd6057ac8f5e69ebf4357";
      })
    ];
    buildInputs =
      (self.nativeDeps."ansi-regex" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ansi-regex" ];
  };
  by-spec."ansi-styles"."^1.1.0" =
    self.by-version."ansi-styles"."1.1.0";
  by-version."ansi-styles"."1.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "ansi-styles-1.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ansi-styles/-/ansi-styles-1.1.0.tgz";
        name = "ansi-styles-1.1.0.tgz";
        sha1 = "eaecbf66cd706882760b2f4691582b8f55d7a7de";
      })
    ];
    buildInputs =
      (self.nativeDeps."ansi-styles" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ansi-styles" ];
  };
  by-spec."ansi-styles"."~1.0.0" =
    self.by-version."ansi-styles"."1.0.0";
  by-version."ansi-styles"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "ansi-styles-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ansi-styles/-/ansi-styles-1.0.0.tgz";
        name = "ansi-styles-1.0.0.tgz";
        sha1 = "cb102df1c56f5123eab8b67cd7b98027a0279178";
      })
    ];
    buildInputs =
      (self.nativeDeps."ansi-styles" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ansi-styles" ];
  };
  by-spec."ansicolors"."~0.2.1" =
    self.by-version."ansicolors"."0.2.1";
  by-version."ansicolors"."0.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "ansicolors-0.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ansicolors/-/ansicolors-0.2.1.tgz";
        name = "ansicolors-0.2.1.tgz";
        sha1 = "be089599097b74a5c9c4a84a0cdbcdb62bd87aef";
      })
    ];
    buildInputs =
      (self.nativeDeps."ansicolors" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ansicolors" ];
  };
  by-spec."archy"."0.0.2" =
    self.by-version."archy"."0.0.2";
  by-version."archy"."0.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "archy-0.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/archy/-/archy-0.0.2.tgz";
        name = "archy-0.0.2.tgz";
        sha1 = "910f43bf66141fc335564597abc189df44b3d35e";
      })
    ];
    buildInputs =
      (self.nativeDeps."archy" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "archy" ];
  };
  by-spec."archy"."^0.0.2" =
    self.by-version."archy"."0.0.2";
  by-spec."argparse"."~ 0.1.11" =
    self.by-version."argparse"."0.1.15";
  by-version."argparse"."0.1.15" = lib.makeOverridable self.buildNodePackage {
    name = "argparse-0.1.15";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/argparse/-/argparse-0.1.15.tgz";
        name = "argparse-0.1.15.tgz";
        sha1 = "28a1f72c43113e763220e5708414301c8840f0a1";
      })
    ];
    buildInputs =
      (self.nativeDeps."argparse" or []);
    deps = {
      "underscore-1.4.4" = self.by-version."underscore"."1.4.4";
      "underscore.string-2.3.3" = self.by-version."underscore.string"."2.3.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "argparse" ];
  };
  by-spec."array-filter"."~0.0.0" =
    self.by-version."array-filter"."0.0.1";
  by-version."array-filter"."0.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "array-filter-0.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/array-filter/-/array-filter-0.0.1.tgz";
        name = "array-filter-0.0.1.tgz";
        sha1 = "7da8cf2e26628ed732803581fd21f67cacd2eeec";
      })
    ];
    buildInputs =
      (self.nativeDeps."array-filter" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "array-filter" ];
  };
  by-spec."array-map"."~0.0.0" =
    self.by-version."array-map"."0.0.0";
  by-version."array-map"."0.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "array-map-0.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/array-map/-/array-map-0.0.0.tgz";
        name = "array-map-0.0.0.tgz";
        sha1 = "88a2bab73d1cf7bcd5c1b118a003f66f665fa662";
      })
    ];
    buildInputs =
      (self.nativeDeps."array-map" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "array-map" ];
  };
  by-spec."array-reduce"."~0.0.0" =
    self.by-version."array-reduce"."0.0.0";
  by-version."array-reduce"."0.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "array-reduce-0.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/array-reduce/-/array-reduce-0.0.0.tgz";
        name = "array-reduce-0.0.0.tgz";
        sha1 = "173899d3ffd1c7d9383e4479525dbe278cab5f2b";
      })
    ];
    buildInputs =
      (self.nativeDeps."array-reduce" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "array-reduce" ];
  };
  by-spec."asn1"."0.1.11" =
    self.by-version."asn1"."0.1.11";
  by-version."asn1"."0.1.11" = lib.makeOverridable self.buildNodePackage {
    name = "asn1-0.1.11";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/asn1/-/asn1-0.1.11.tgz";
        name = "asn1-0.1.11.tgz";
        sha1 = "559be18376d08a4ec4dbe80877d27818639b2df7";
      })
    ];
    buildInputs =
      (self.nativeDeps."asn1" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "asn1" ];
  };
  by-spec."assert-plus"."0.1.2" =
    self.by-version."assert-plus"."0.1.2";
  by-version."assert-plus"."0.1.2" = lib.makeOverridable self.buildNodePackage {
    name = "assert-plus-0.1.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/assert-plus/-/assert-plus-0.1.2.tgz";
        name = "assert-plus-0.1.2.tgz";
        sha1 = "d93ffdbb67ac5507779be316a7d65146417beef8";
      })
    ];
    buildInputs =
      (self.nativeDeps."assert-plus" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "assert-plus" ];
  };
  by-spec."async"."^0.9.0" =
    self.by-version."async"."0.9.0";
  by-version."async"."0.9.0" = lib.makeOverridable self.buildNodePackage {
    name = "async-0.9.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/async/-/async-0.9.0.tgz";
        name = "async-0.9.0.tgz";
        sha1 = "ac3613b1da9bed1b47510bb4651b8931e47146c7";
      })
    ];
    buildInputs =
      (self.nativeDeps."async" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "async" ];
  };
  by-spec."async"."~0.2.6" =
    self.by-version."async"."0.2.10";
  by-version."async"."0.2.10" = lib.makeOverridable self.buildNodePackage {
    name = "async-0.2.10";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/async/-/async-0.2.10.tgz";
        name = "async-0.2.10.tgz";
        sha1 = "b6bbe0b0674b9d719708ca38de8c237cb526c3d1";
      })
    ];
    buildInputs =
      (self.nativeDeps."async" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "async" ];
  };
  by-spec."async"."~0.2.8" =
    self.by-version."async"."0.2.10";
  by-spec."async"."~0.8.0" =
    self.by-version."async"."0.8.0";
  by-version."async"."0.8.0" = lib.makeOverridable self.buildNodePackage {
    name = "async-0.8.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/async/-/async-0.8.0.tgz";
        name = "async-0.8.0.tgz";
        sha1 = "ee65ec77298c2ff1456bc4418a052d0f06435112";
      })
    ];
    buildInputs =
      (self.nativeDeps."async" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "async" ];
  };
  by-spec."async"."~0.9.0" =
    self.by-version."async"."0.9.0";
  by-spec."aws-sign"."~0.3.0" =
    self.by-version."aws-sign"."0.3.0";
  by-version."aws-sign"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "aws-sign-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/aws-sign/-/aws-sign-0.3.0.tgz";
        name = "aws-sign-0.3.0.tgz";
        sha1 = "3d81ca69b474b1e16518728b51c24ff0bbedc6e9";
      })
    ];
    buildInputs =
      (self.nativeDeps."aws-sign" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "aws-sign" ];
  };
  by-spec."aws-sign2"."~0.5.0" =
    self.by-version."aws-sign2"."0.5.0";
  by-version."aws-sign2"."0.5.0" = lib.makeOverridable self.buildNodePackage {
    name = "aws-sign2-0.5.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/aws-sign2/-/aws-sign2-0.5.0.tgz";
        name = "aws-sign2-0.5.0.tgz";
        sha1 = "c57103f7a17fc037f02d7c2e64b602ea223f7d63";
      })
    ];
    buildInputs =
      (self.nativeDeps."aws-sign2" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "aws-sign2" ];
  };
  by-spec."binary"."~0.3.0" =
    self.by-version."binary"."0.3.0";
  by-version."binary"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "binary-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/binary/-/binary-0.3.0.tgz";
        name = "binary-0.3.0.tgz";
        sha1 = "9f60553bc5ce8c3386f3b553cff47462adecaa79";
      })
    ];
    buildInputs =
      (self.nativeDeps."binary" or []);
    deps = {
      "chainsaw-0.1.0" = self.by-version."chainsaw"."0.1.0";
      "buffers-0.1.1" = self.by-version."buffers"."0.1.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "binary" ];
  };
  by-spec."bl"."~0.9.0" =
    self.by-version."bl"."0.9.3";
  by-version."bl"."0.9.3" = lib.makeOverridable self.buildNodePackage {
    name = "bl-0.9.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bl/-/bl-0.9.3.tgz";
        name = "bl-0.9.3.tgz";
        sha1 = "c41eff3e7cb31bde107c8f10076d274eff7f7d44";
      })
    ];
    buildInputs =
      (self.nativeDeps."bl" or []);
    deps = {
      "readable-stream-1.0.31" = self.by-version."readable-stream"."1.0.31";
    };
    peerDependencies = [
    ];
    passthru.names = [ "bl" ];
  };
  by-spec."block-stream"."*" =
    self.by-version."block-stream"."0.0.7";
  by-version."block-stream"."0.0.7" = lib.makeOverridable self.buildNodePackage {
    name = "block-stream-0.0.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/block-stream/-/block-stream-0.0.7.tgz";
        name = "block-stream-0.0.7.tgz";
        sha1 = "9088ab5ae1e861f4d81b176b4a8046080703deed";
      })
    ];
    buildInputs =
      (self.nativeDeps."block-stream" or []);
    deps = {
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "block-stream" ];
  };
  by-spec."boom"."0.4.x" =
    self.by-version."boom"."0.4.2";
  by-version."boom"."0.4.2" = lib.makeOverridable self.buildNodePackage {
    name = "boom-0.4.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/boom/-/boom-0.4.2.tgz";
        name = "boom-0.4.2.tgz";
        sha1 = "7a636e9ded4efcefb19cef4947a3c67dfaee911b";
      })
    ];
    buildInputs =
      (self.nativeDeps."boom" or []);
    deps = {
      "hoek-0.9.1" = self.by-version."hoek"."0.9.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "boom" ];
  };
  by-spec."bower"."^1.3.9" =
    self.by-version."bower"."1.3.9";
  by-version."bower"."1.3.9" = lib.makeOverridable self.buildNodePackage {
    name = "bower-1.3.9";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower/-/bower-1.3.9.tgz";
        name = "bower-1.3.9.tgz";
        sha1 = "786d4addfc523e875089ccc1ef8d5a6d6e91a2c6";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower" or []);
    deps = {
      "abbrev-1.0.5" = self.by-version."abbrev"."1.0.5";
      "archy-0.0.2" = self.by-version."archy"."0.0.2";
      "bower-config-0.5.2" = self.by-version."bower-config"."0.5.2";
      "bower-endpoint-parser-0.2.2" = self.by-version."bower-endpoint-parser"."0.2.2";
      "bower-json-0.4.0" = self.by-version."bower-json"."0.4.0";
      "bower-logger-0.2.2" = self.by-version."bower-logger"."0.2.2";
      "bower-registry-client-0.2.1" = self.by-version."bower-registry-client"."0.2.1";
      "cardinal-0.4.4" = self.by-version."cardinal"."0.4.4";
      "chalk-0.5.1" = self.by-version."chalk"."0.5.1";
      "chmodr-0.1.0" = self.by-version."chmodr"."0.1.0";
      "decompress-zip-0.0.6" = self.by-version."decompress-zip"."0.0.6";
      "fstream-0.1.31" = self.by-version."fstream"."0.1.31";
      "fstream-ignore-0.0.6" = self.by-version."fstream-ignore"."0.0.6";
      "glob-4.0.5" = self.by-version."glob"."4.0.5";
      "graceful-fs-3.0.2" = self.by-version."graceful-fs"."3.0.2";
      "handlebars-1.3.0" = self.by-version."handlebars"."1.3.0";
      "inquirer-0.5.1" = self.by-version."inquirer"."0.5.1";
      "insight-0.4.3" = self.by-version."insight"."0.4.3";
      "is-root-0.1.0" = self.by-version."is-root"."0.1.0";
      "junk-0.3.0" = self.by-version."junk"."0.3.0";
      "lockfile-0.4.3" = self.by-version."lockfile"."0.4.3";
      "lru-cache-2.5.0" = self.by-version."lru-cache"."2.5.0";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "mout-0.9.1" = self.by-version."mout"."0.9.1";
      "nopt-3.0.1" = self.by-version."nopt"."3.0.1";
      "opn-0.1.2" = self.by-version."opn"."0.1.2";
      "osenv-0.1.0" = self.by-version."osenv"."0.1.0";
      "p-throttler-0.0.1" = self.by-version."p-throttler"."0.0.1";
      "promptly-0.2.0" = self.by-version."promptly"."0.2.0";
      "q-1.0.1" = self.by-version."q"."1.0.1";
      "request-2.36.0" = self.by-version."request"."2.36.0";
      "request-progress-0.3.1" = self.by-version."request-progress"."0.3.1";
      "retry-0.6.1" = self.by-version."retry"."0.6.1";
      "rimraf-2.2.8" = self.by-version."rimraf"."2.2.8";
      "semver-2.3.2" = self.by-version."semver"."2.3.2";
      "shell-quote-1.4.2" = self.by-version."shell-quote"."1.4.2";
      "stringify-object-0.2.1" = self.by-version."stringify-object"."0.2.1";
      "tar-0.1.20" = self.by-version."tar"."0.1.20";
      "tmp-0.0.23" = self.by-version."tmp"."0.0.23";
      "update-notifier-0.2.1" = self.by-version."update-notifier"."0.2.1";
      "which-1.0.5" = self.by-version."which"."1.0.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower" ];
  };
  "bower" = self.by-version."bower"."1.3.9";
  by-spec."bower-config"."~0.5.0" =
    self.by-version."bower-config"."0.5.2";
  by-version."bower-config"."0.5.2" = lib.makeOverridable self.buildNodePackage {
    name = "bower-config-0.5.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower-config/-/bower-config-0.5.2.tgz";
        name = "bower-config-0.5.2.tgz";
        sha1 = "1f7d2e899e99b70c29a613e70d4c64590414b22e";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower-config" or []);
    deps = {
      "graceful-fs-2.0.3" = self.by-version."graceful-fs"."2.0.3";
      "mout-0.9.1" = self.by-version."mout"."0.9.1";
      "optimist-0.6.1" = self.by-version."optimist"."0.6.1";
      "osenv-0.0.3" = self.by-version."osenv"."0.0.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower-config" ];
  };
  by-spec."bower-config"."~0.5.2" =
    self.by-version."bower-config"."0.5.2";
  by-spec."bower-endpoint-parser"."~0.2.2" =
    self.by-version."bower-endpoint-parser"."0.2.2";
  by-version."bower-endpoint-parser"."0.2.2" = lib.makeOverridable self.buildNodePackage {
    name = "bower-endpoint-parser-0.2.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower-endpoint-parser/-/bower-endpoint-parser-0.2.2.tgz";
        name = "bower-endpoint-parser-0.2.2.tgz";
        sha1 = "00b565adbfab6f2d35addde977e97962acbcb3f6";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower-endpoint-parser" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower-endpoint-parser" ];
  };
  by-spec."bower-json"."~0.4.0" =
    self.by-version."bower-json"."0.4.0";
  by-version."bower-json"."0.4.0" = lib.makeOverridable self.buildNodePackage {
    name = "bower-json-0.4.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower-json/-/bower-json-0.4.0.tgz";
        name = "bower-json-0.4.0.tgz";
        sha1 = "a99c3ccf416ef0590ed0ded252c760f1c6d93766";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower-json" or []);
    deps = {
      "deep-extend-0.2.11" = self.by-version."deep-extend"."0.2.11";
      "graceful-fs-2.0.3" = self.by-version."graceful-fs"."2.0.3";
      "intersect-0.0.3" = self.by-version."intersect"."0.0.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower-json" ];
  };
  by-spec."bower-logger"."~0.2.2" =
    self.by-version."bower-logger"."0.2.2";
  by-version."bower-logger"."0.2.2" = lib.makeOverridable self.buildNodePackage {
    name = "bower-logger-0.2.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower-logger/-/bower-logger-0.2.2.tgz";
        name = "bower-logger-0.2.2.tgz";
        sha1 = "39be07e979b2fc8e03a94634205ed9422373d381";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower-logger" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower-logger" ];
  };
  by-spec."bower-registry-client"."~0.2.0" =
    self.by-version."bower-registry-client"."0.2.1";
  by-version."bower-registry-client"."0.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "bower-registry-client-0.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower-registry-client/-/bower-registry-client-0.2.1.tgz";
        name = "bower-registry-client-0.2.1.tgz";
        sha1 = "06fbff982f82a4a4045dc53ac9dcb1c43d9cd591";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower-registry-client" or []);
    deps = {
      "async-0.2.10" = self.by-version."async"."0.2.10";
      "bower-config-0.5.2" = self.by-version."bower-config"."0.5.2";
      "graceful-fs-2.0.3" = self.by-version."graceful-fs"."2.0.3";
      "lru-cache-2.3.1" = self.by-version."lru-cache"."2.3.1";
      "request-2.27.0" = self.by-version."request"."2.27.0";
      "request-replay-0.2.0" = self.by-version."request-replay"."0.2.0";
      "rimraf-2.2.8" = self.by-version."rimraf"."2.2.8";
      "mkdirp-0.3.5" = self.by-version."mkdirp"."0.3.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower-registry-client" ];
  };
  by-spec."buffers"."~0.1.1" =
    self.by-version."buffers"."0.1.1";
  by-version."buffers"."0.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "buffers-0.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/buffers/-/buffers-0.1.1.tgz";
        name = "buffers-0.1.1.tgz";
        sha1 = "b24579c3bed4d6d396aeee6d9a8ae7f5482ab7bb";
      })
    ];
    buildInputs =
      (self.nativeDeps."buffers" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "buffers" ];
  };
  by-spec."cardinal"."~0.4.0" =
    self.by-version."cardinal"."0.4.4";
  by-version."cardinal"."0.4.4" = lib.makeOverridable self.buildNodePackage {
    name = "cardinal-0.4.4";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cardinal/-/cardinal-0.4.4.tgz";
        name = "cardinal-0.4.4.tgz";
        sha1 = "ca5bb68a5b511b90fe93b9acea49bdee5c32bfe2";
      })
    ];
    buildInputs =
      (self.nativeDeps."cardinal" or []);
    deps = {
      "redeyed-0.4.4" = self.by-version."redeyed"."0.4.4";
      "ansicolors-0.2.1" = self.by-version."ansicolors"."0.2.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "cardinal" ];
  };
  by-spec."caseless"."~0.6.0" =
    self.by-version."caseless"."0.6.0";
  by-version."caseless"."0.6.0" = lib.makeOverridable self.buildNodePackage {
    name = "caseless-0.6.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/caseless/-/caseless-0.6.0.tgz";
        name = "caseless-0.6.0.tgz";
        sha1 = "8167c1ab8397fb5bb95f96d28e5a81c50f247ac4";
      })
    ];
    buildInputs =
      (self.nativeDeps."caseless" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "caseless" ];
  };
  by-spec."chainsaw"."~0.1.0" =
    self.by-version."chainsaw"."0.1.0";
  by-version."chainsaw"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "chainsaw-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/chainsaw/-/chainsaw-0.1.0.tgz";
        name = "chainsaw-0.1.0.tgz";
        sha1 = "5eab50b28afe58074d0d58291388828b5e5fbc98";
      })
    ];
    buildInputs =
      (self.nativeDeps."chainsaw" or []);
    deps = {
      "traverse-0.3.9" = self.by-version."traverse"."0.3.9";
    };
    peerDependencies = [
    ];
    passthru.names = [ "chainsaw" ];
  };
  by-spec."chalk"."^0.5.0" =
    self.by-version."chalk"."0.5.1";
  by-version."chalk"."0.5.1" = lib.makeOverridable self.buildNodePackage {
    name = "chalk-0.5.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/chalk/-/chalk-0.5.1.tgz";
        name = "chalk-0.5.1.tgz";
        sha1 = "663b3a648b68b55d04690d49167aa837858f2174";
      })
    ];
    buildInputs =
      (self.nativeDeps."chalk" or []);
    deps = {
      "ansi-styles-1.1.0" = self.by-version."ansi-styles"."1.1.0";
      "escape-string-regexp-1.0.1" = self.by-version."escape-string-regexp"."1.0.1";
      "has-ansi-0.1.0" = self.by-version."has-ansi"."0.1.0";
      "strip-ansi-0.3.0" = self.by-version."strip-ansi"."0.3.0";
      "supports-color-0.2.0" = self.by-version."supports-color"."0.2.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "chalk" ];
  };
  by-spec."chalk"."^0.5.1" =
    self.by-version."chalk"."0.5.1";
  by-spec."chalk"."~0.4.0" =
    self.by-version."chalk"."0.4.0";
  by-version."chalk"."0.4.0" = lib.makeOverridable self.buildNodePackage {
    name = "chalk-0.4.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/chalk/-/chalk-0.4.0.tgz";
        name = "chalk-0.4.0.tgz";
        sha1 = "5199a3ddcd0c1efe23bc08c1b027b06176e0c64f";
      })
    ];
    buildInputs =
      (self.nativeDeps."chalk" or []);
    deps = {
      "has-color-0.1.7" = self.by-version."has-color"."0.1.7";
      "ansi-styles-1.0.0" = self.by-version."ansi-styles"."1.0.0";
      "strip-ansi-0.1.1" = self.by-version."strip-ansi"."0.1.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "chalk" ];
  };
  by-spec."chalk"."~0.5.0" =
    self.by-version."chalk"."0.5.1";
  by-spec."chmodr"."~0.1.0" =
    self.by-version."chmodr"."0.1.0";
  by-version."chmodr"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "chmodr-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/chmodr/-/chmodr-0.1.0.tgz";
        name = "chmodr-0.1.0.tgz";
        sha1 = "e09215a1d51542db2a2576969765bcf6125583eb";
      })
    ];
    buildInputs =
      (self.nativeDeps."chmodr" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "chmodr" ];
  };
  by-spec."cli-color"."~0.3.2" =
    self.by-version."cli-color"."0.3.2";
  by-version."cli-color"."0.3.2" = lib.makeOverridable self.buildNodePackage {
    name = "cli-color-0.3.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cli-color/-/cli-color-0.3.2.tgz";
        name = "cli-color-0.3.2.tgz";
        sha1 = "75fa5f728c308cc4ac594b05e06cc5d80daccd86";
      })
    ];
    buildInputs =
      (self.nativeDeps."cli-color" or []);
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.4" = self.by-version."es5-ext"."0.10.4";
      "memoizee-0.3.7" = self.by-version."memoizee"."0.3.7";
      "timers-ext-0.1.0" = self.by-version."timers-ext"."0.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "cli-color" ];
  };
  by-spec."clone-stats"."^0.0.1" =
    self.by-version."clone-stats"."0.0.1";
  by-version."clone-stats"."0.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "clone-stats-0.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/clone-stats/-/clone-stats-0.0.1.tgz";
        name = "clone-stats-0.0.1.tgz";
        sha1 = "b88f94a82cf38b8791d58046ea4029ad88ca99d1";
      })
    ];
    buildInputs =
      (self.nativeDeps."clone-stats" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "clone-stats" ];
  };
  by-spec."clone-stats"."~0.0.1" =
    self.by-version."clone-stats"."0.0.1";
  by-spec."coffee-script"."~1.8.0" =
    self.by-version."coffee-script"."1.8.0";
  by-version."coffee-script"."1.8.0" = lib.makeOverridable self.buildNodePackage {
    name = "coffee-script-1.8.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/coffee-script/-/coffee-script-1.8.0.tgz";
        name = "coffee-script-1.8.0.tgz";
        sha1 = "9c9f1d2b4a52a000ded15b659791703648263c1d";
      })
    ];
    buildInputs =
      (self.nativeDeps."coffee-script" or []);
    deps = {
      "mkdirp-0.3.5" = self.by-version."mkdirp"."0.3.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "coffee-script" ];
  };
  by-spec."combined-stream"."~0.0.4" =
    self.by-version."combined-stream"."0.0.5";
  by-version."combined-stream"."0.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "combined-stream-0.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/combined-stream/-/combined-stream-0.0.5.tgz";
        name = "combined-stream-0.0.5.tgz";
        sha1 = "29ed76e5c9aad07c4acf9ca3d32601cce28697a2";
      })
    ];
    buildInputs =
      (self.nativeDeps."combined-stream" or []);
    deps = {
      "delayed-stream-0.0.5" = self.by-version."delayed-stream"."0.0.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "combined-stream" ];
  };
  by-spec."concat-with-sourcemaps"."^0.1.3" =
    self.by-version."concat-with-sourcemaps"."0.1.3";
  by-version."concat-with-sourcemaps"."0.1.3" = lib.makeOverridable self.buildNodePackage {
    name = "concat-with-sourcemaps-0.1.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/concat-with-sourcemaps/-/concat-with-sourcemaps-0.1.3.tgz";
        name = "concat-with-sourcemaps-0.1.3.tgz";
        sha1 = "ead3d867a2e29bce420d948dc9a787e580d1f0ed";
      })
    ];
    buildInputs =
      (self.nativeDeps."concat-with-sourcemaps" or []);
    deps = {
      "source-map-0.1.39" = self.by-version."source-map"."0.1.39";
    };
    peerDependencies = [
    ];
    passthru.names = [ "concat-with-sourcemaps" ];
  };
  by-spec."config-chain"."~1.1.8" =
    self.by-version."config-chain"."1.1.8";
  by-version."config-chain"."1.1.8" = lib.makeOverridable self.buildNodePackage {
    name = "config-chain-1.1.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/config-chain/-/config-chain-1.1.8.tgz";
        name = "config-chain-1.1.8.tgz";
        sha1 = "0943d0b7227213a20d4eaff4434f4a1c0a052cad";
      })
    ];
    buildInputs =
      (self.nativeDeps."config-chain" or []);
    deps = {
      "proto-list-1.2.3" = self.by-version."proto-list"."1.2.3";
      "ini-1.2.1" = self.by-version."ini"."1.2.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "config-chain" ];
  };
  by-spec."configstore"."^0.3.1" =
    self.by-version."configstore"."0.3.1";
  by-version."configstore"."0.3.1" = lib.makeOverridable self.buildNodePackage {
    name = "configstore-0.3.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/configstore/-/configstore-0.3.1.tgz";
        name = "configstore-0.3.1.tgz";
        sha1 = "e1b4715994fe5f8e22e69b21d54c7a448339314d";
      })
    ];
    buildInputs =
      (self.nativeDeps."configstore" or []);
    deps = {
      "graceful-fs-3.0.2" = self.by-version."graceful-fs"."3.0.2";
      "js-yaml-3.0.2" = self.by-version."js-yaml"."3.0.2";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "object-assign-0.3.1" = self.by-version."object-assign"."0.3.1";
      "osenv-0.1.0" = self.by-version."osenv"."0.1.0";
      "uuid-1.4.1" = self.by-version."uuid"."1.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "configstore" ];
  };
  by-spec."convert-source-map"."^0.4.1" =
    self.by-version."convert-source-map"."0.4.1";
  by-version."convert-source-map"."0.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "convert-source-map-0.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/convert-source-map/-/convert-source-map-0.4.1.tgz";
        name = "convert-source-map-0.4.1.tgz";
        sha1 = "f919a0099fe31f80fc5a1d0eb303161b394070c7";
      })
    ];
    buildInputs =
      (self.nativeDeps."convert-source-map" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "convert-source-map" ];
  };
  by-spec."cookie-jar"."~0.3.0" =
    self.by-version."cookie-jar"."0.3.0";
  by-version."cookie-jar"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "cookie-jar-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cookie-jar/-/cookie-jar-0.3.0.tgz";
        name = "cookie-jar-0.3.0.tgz";
        sha1 = "bc9a27d4e2b97e186cd57c9e2063cb99fa68cccc";
      })
    ];
    buildInputs =
      (self.nativeDeps."cookie-jar" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "cookie-jar" ];
  };
  by-spec."core-util-is"."~1.0.0" =
    self.by-version."core-util-is"."1.0.1";
  by-version."core-util-is"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "core-util-is-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/core-util-is/-/core-util-is-1.0.1.tgz";
        name = "core-util-is-1.0.1.tgz";
        sha1 = "6b07085aef9a3ccac6ee53bf9d3df0c1521a5538";
      })
    ];
    buildInputs =
      (self.nativeDeps."core-util-is" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "core-util-is" ];
  };
  by-spec."cryptiles"."0.2.x" =
    self.by-version."cryptiles"."0.2.2";
  by-version."cryptiles"."0.2.2" = lib.makeOverridable self.buildNodePackage {
    name = "cryptiles-0.2.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cryptiles/-/cryptiles-0.2.2.tgz";
        name = "cryptiles-0.2.2.tgz";
        sha1 = "ed91ff1f17ad13d3748288594f8a48a0d26f325c";
      })
    ];
    buildInputs =
      (self.nativeDeps."cryptiles" or []);
    deps = {
      "boom-0.4.2" = self.by-version."boom"."0.4.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "cryptiles" ];
  };
  by-spec."ctype"."0.5.2" =
    self.by-version."ctype"."0.5.2";
  by-version."ctype"."0.5.2" = lib.makeOverridable self.buildNodePackage {
    name = "ctype-0.5.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ctype/-/ctype-0.5.2.tgz";
        name = "ctype-0.5.2.tgz";
        sha1 = "fe8091d468a373a0b0c9ff8bbfb3425c00973a1d";
      })
    ];
    buildInputs =
      (self.nativeDeps."ctype" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ctype" ];
  };
  by-spec."d"."~0.1.1" =
    self.by-version."d"."0.1.1";
  by-version."d"."0.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "d-0.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/d/-/d-0.1.1.tgz";
        name = "d-0.1.1.tgz";
        sha1 = "da184c535d18d8ee7ba2aa229b914009fae11309";
      })
    ];
    buildInputs =
      (self.nativeDeps."d" or []);
    deps = {
      "es5-ext-0.10.4" = self.by-version."es5-ext"."0.10.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "d" ];
  };
  by-spec."dateformat"."^1.0.7-1.2.3" =
    self.by-version."dateformat"."1.0.8-1.2.3";
  by-version."dateformat"."1.0.8-1.2.3" = lib.makeOverridable self.buildNodePackage {
    name = "dateformat-1.0.8-1.2.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/dateformat/-/dateformat-1.0.8-1.2.3.tgz";
        name = "dateformat-1.0.8-1.2.3.tgz";
        sha1 = "5d60c5d574dc778a7f98139156c6cfc9d851d1e7";
      })
    ];
    buildInputs =
      (self.nativeDeps."dateformat" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "dateformat" ];
  };
  by-spec."decompress-zip"."0.0.6" =
    self.by-version."decompress-zip"."0.0.6";
  by-version."decompress-zip"."0.0.6" = lib.makeOverridable self.buildNodePackage {
    name = "decompress-zip-0.0.6";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/decompress-zip/-/decompress-zip-0.0.6.tgz";
        name = "decompress-zip-0.0.6.tgz";
        sha1 = "263ef05b304cdcd1172858af453561c53ae017bb";
      })
    ];
    buildInputs =
      (self.nativeDeps."decompress-zip" or []);
    deps = {
      "q-1.0.1" = self.by-version."q"."1.0.1";
      "mkpath-0.1.0" = self.by-version."mkpath"."0.1.0";
      "binary-0.3.0" = self.by-version."binary"."0.3.0";
      "touch-0.0.2" = self.by-version."touch"."0.0.2";
      "readable-stream-1.1.13" = self.by-version."readable-stream"."1.1.13";
      "nopt-2.2.1" = self.by-version."nopt"."2.2.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "decompress-zip" ];
  };
  by-spec."deep-extend"."~0.2.5" =
    self.by-version."deep-extend"."0.2.11";
  by-version."deep-extend"."0.2.11" = lib.makeOverridable self.buildNodePackage {
    name = "deep-extend-0.2.11";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/deep-extend/-/deep-extend-0.2.11.tgz";
        name = "deep-extend-0.2.11.tgz";
        sha1 = "7a16ba69729132340506170494bc83f7076fe08f";
      })
    ];
    buildInputs =
      (self.nativeDeps."deep-extend" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "deep-extend" ];
  };
  by-spec."delayed-stream"."0.0.5" =
    self.by-version."delayed-stream"."0.0.5";
  by-version."delayed-stream"."0.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "delayed-stream-0.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/delayed-stream/-/delayed-stream-0.0.5.tgz";
        name = "delayed-stream-0.0.5.tgz";
        sha1 = "d4b1f43a93e8296dfe02694f4680bc37a313c73f";
      })
    ];
    buildInputs =
      (self.nativeDeps."delayed-stream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "delayed-stream" ];
  };
  by-spec."deprecated"."^0.0.1" =
    self.by-version."deprecated"."0.0.1";
  by-version."deprecated"."0.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "deprecated-0.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/deprecated/-/deprecated-0.0.1.tgz";
        name = "deprecated-0.0.1.tgz";
        sha1 = "f9c9af5464afa1e7a971458a8bdef2aa94d5bb19";
      })
    ];
    buildInputs =
      (self.nativeDeps."deprecated" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "deprecated" ];
  };
  by-spec."duplexer2"."0.0.2" =
    self.by-version."duplexer2"."0.0.2";
  by-version."duplexer2"."0.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "duplexer2-0.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/duplexer2/-/duplexer2-0.0.2.tgz";
        name = "duplexer2-0.0.2.tgz";
        sha1 = "c614dcf67e2fb14995a91711e5a617e8a60a31db";
      })
    ];
    buildInputs =
      (self.nativeDeps."duplexer2" or []);
    deps = {
      "readable-stream-1.1.13" = self.by-version."readable-stream"."1.1.13";
    };
    peerDependencies = [
    ];
    passthru.names = [ "duplexer2" ];
  };
  by-spec."end-of-stream"."~0.1.5" =
    self.by-version."end-of-stream"."0.1.5";
  by-version."end-of-stream"."0.1.5" = lib.makeOverridable self.buildNodePackage {
    name = "end-of-stream-0.1.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/end-of-stream/-/end-of-stream-0.1.5.tgz";
        name = "end-of-stream-0.1.5.tgz";
        sha1 = "8e177206c3c80837d85632e8b9359dfe8b2f6eaf";
      })
    ];
    buildInputs =
      (self.nativeDeps."end-of-stream" or []);
    deps = {
      "once-1.3.0" = self.by-version."once"."1.3.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "end-of-stream" ];
  };
  by-spec."es5-ext"."~0.10.2" =
    self.by-version."es5-ext"."0.10.4";
  by-version."es5-ext"."0.10.4" = lib.makeOverridable self.buildNodePackage {
    name = "es5-ext-0.10.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/es5-ext/-/es5-ext-0.10.4.tgz";
        name = "es5-ext-0.10.4.tgz";
        sha1 = "f4d7d85d45acfbe93379d4c0948fbae6466ec876";
      })
    ];
    buildInputs =
      (self.nativeDeps."es5-ext" or []);
    deps = {
      "es6-iterator-0.1.1" = self.by-version."es6-iterator"."0.1.1";
      "es6-symbol-0.1.0" = self.by-version."es6-symbol"."0.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "es5-ext" ];
  };
  by-spec."es5-ext"."~0.10.4" =
    self.by-version."es5-ext"."0.10.4";
  by-spec."es6-iterator"."~0.1.1" =
    self.by-version."es6-iterator"."0.1.1";
  by-version."es6-iterator"."0.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "es6-iterator-0.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/es6-iterator/-/es6-iterator-0.1.1.tgz";
        name = "es6-iterator-0.1.1.tgz";
        sha1 = "5e136c899aa1c26296414f90859b73934812d275";
      })
    ];
    buildInputs =
      (self.nativeDeps."es6-iterator" or []);
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.4" = self.by-version."es5-ext"."0.10.4";
      "es6-symbol-0.1.0" = self.by-version."es6-symbol"."0.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "es6-iterator" ];
  };
  by-spec."es6-symbol"."0.1.x" =
    self.by-version."es6-symbol"."0.1.0";
  by-version."es6-symbol"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "es6-symbol-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/es6-symbol/-/es6-symbol-0.1.0.tgz";
        name = "es6-symbol-0.1.0.tgz";
        sha1 = "ba5878f37a652f6c713244716fc7b24d61d2dc39";
      })
    ];
    buildInputs =
      (self.nativeDeps."es6-symbol" or []);
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.4" = self.by-version."es5-ext"."0.10.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "es6-symbol" ];
  };
  by-spec."escape-string-regexp"."^1.0.0" =
    self.by-version."escape-string-regexp"."1.0.1";
  by-version."escape-string-regexp"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "escape-string-regexp-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.1.tgz";
        name = "escape-string-regexp-1.0.1.tgz";
        sha1 = "78c76393afb84f102230d949a6125c7f3cf65904";
      })
    ];
    buildInputs =
      (self.nativeDeps."escape-string-regexp" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "escape-string-regexp" ];
  };
  by-spec."esprima"."~ 1.0.2" =
    self.by-version."esprima"."1.0.4";
  by-version."esprima"."1.0.4" = lib.makeOverridable self.buildNodePackage {
    name = "esprima-1.0.4";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/esprima/-/esprima-1.0.4.tgz";
        name = "esprima-1.0.4.tgz";
        sha1 = "9f557e08fc3b4d26ece9dd34f8fbf476b62585ad";
      })
    ];
    buildInputs =
      (self.nativeDeps."esprima" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "esprima" ];
  };
  by-spec."esprima"."~1.0.4" =
    self.by-version."esprima"."1.0.4";
  by-spec."event-emitter"."~0.3.1" =
    self.by-version."event-emitter"."0.3.1";
  by-version."event-emitter"."0.3.1" = lib.makeOverridable self.buildNodePackage {
    name = "event-emitter-0.3.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/event-emitter/-/event-emitter-0.3.1.tgz";
        name = "event-emitter-0.3.1.tgz";
        sha1 = "1425ca9c5649a1a31ba835bd9dba6bfad3880238";
      })
    ];
    buildInputs =
      (self.nativeDeps."event-emitter" or []);
    deps = {
      "es5-ext-0.10.4" = self.by-version."es5-ext"."0.10.4";
      "d-0.1.1" = self.by-version."d"."0.1.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "event-emitter" ];
  };
  by-spec."extend"."~1.3.0" =
    self.by-version."extend"."1.3.0";
  by-version."extend"."1.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "extend-1.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/extend/-/extend-1.3.0.tgz";
        name = "extend-1.3.0.tgz";
        sha1 = "d1516fb0ff5624d2ebf9123ea1dac5a1994004f8";
      })
    ];
    buildInputs =
      (self.nativeDeps."extend" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "extend" ];
  };
  by-spec."findup-sync"."~0.1.2" =
    self.by-version."findup-sync"."0.1.3";
  by-version."findup-sync"."0.1.3" = lib.makeOverridable self.buildNodePackage {
    name = "findup-sync-0.1.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/findup-sync/-/findup-sync-0.1.3.tgz";
        name = "findup-sync-0.1.3.tgz";
        sha1 = "7f3e7a97b82392c653bf06589bd85190e93c3683";
      })
    ];
    buildInputs =
      (self.nativeDeps."findup-sync" or []);
    deps = {
      "glob-3.2.11" = self.by-version."glob"."3.2.11";
      "lodash-2.4.1" = self.by-version."lodash"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "findup-sync" ];
  };
  by-spec."first-chunk-stream"."^1.0.0" =
    self.by-version."first-chunk-stream"."1.0.0";
  by-version."first-chunk-stream"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "first-chunk-stream-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/first-chunk-stream/-/first-chunk-stream-1.0.0.tgz";
        name = "first-chunk-stream-1.0.0.tgz";
        sha1 = "59bfb50cd905f60d7c394cd3d9acaab4e6ad934e";
      })
    ];
    buildInputs =
      (self.nativeDeps."first-chunk-stream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "first-chunk-stream" ];
  };
  by-spec."forever-agent"."~0.5.0" =
    self.by-version."forever-agent"."0.5.2";
  by-version."forever-agent"."0.5.2" = lib.makeOverridable self.buildNodePackage {
    name = "forever-agent-0.5.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/forever-agent/-/forever-agent-0.5.2.tgz";
        name = "forever-agent-0.5.2.tgz";
        sha1 = "6d0e09c4921f94a27f63d3b49c5feff1ea4c5130";
      })
    ];
    buildInputs =
      (self.nativeDeps."forever-agent" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "forever-agent" ];
  };
  by-spec."form-data"."~0.1.0" =
    self.by-version."form-data"."0.1.4";
  by-version."form-data"."0.1.4" = lib.makeOverridable self.buildNodePackage {
    name = "form-data-0.1.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/form-data/-/form-data-0.1.4.tgz";
        name = "form-data-0.1.4.tgz";
        sha1 = "91abd788aba9702b1aabfa8bc01031a2ac9e3b12";
      })
    ];
    buildInputs =
      (self.nativeDeps."form-data" or []);
    deps = {
      "combined-stream-0.0.5" = self.by-version."combined-stream"."0.0.5";
      "mime-1.2.11" = self.by-version."mime"."1.2.11";
      "async-0.9.0" = self.by-version."async"."0.9.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "form-data" ];
  };
  by-spec."fstream"."~0.1.17" =
    self.by-version."fstream"."0.1.31";
  by-version."fstream"."0.1.31" = lib.makeOverridable self.buildNodePackage {
    name = "fstream-0.1.31";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/fstream/-/fstream-0.1.31.tgz";
        name = "fstream-0.1.31.tgz";
        sha1 = "7337f058fbbbbefa8c9f561a28cab0849202c988";
      })
    ];
    buildInputs =
      (self.nativeDeps."fstream" or []);
    deps = {
      "graceful-fs-3.0.2" = self.by-version."graceful-fs"."3.0.2";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "rimraf-2.2.8" = self.by-version."rimraf"."2.2.8";
    };
    peerDependencies = [
    ];
    passthru.names = [ "fstream" ];
  };
  by-spec."fstream"."~0.1.22" =
    self.by-version."fstream"."0.1.31";
  by-spec."fstream"."~0.1.28" =
    self.by-version."fstream"."0.1.31";
  by-spec."fstream-ignore"."0.0.6" =
    self.by-version."fstream-ignore"."0.0.6";
  by-version."fstream-ignore"."0.0.6" = lib.makeOverridable self.buildNodePackage {
    name = "fstream-ignore-0.0.6";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/fstream-ignore/-/fstream-ignore-0.0.6.tgz";
        name = "fstream-ignore-0.0.6.tgz";
        sha1 = "06506aedfa1f4106bde3c02a2e5f546e85afb9c7";
      })
    ];
    buildInputs =
      (self.nativeDeps."fstream-ignore" or []);
    deps = {
      "minimatch-0.2.14" = self.by-version."minimatch"."0.2.14";
      "fstream-0.1.31" = self.by-version."fstream"."0.1.31";
      "inherits-1.0.0" = self.by-version."inherits"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "fstream-ignore" ];
  };
  by-spec."gaze"."^0.5.1" =
    self.by-version."gaze"."0.5.1";
  by-version."gaze"."0.5.1" = lib.makeOverridable self.buildNodePackage {
    name = "gaze-0.5.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/gaze/-/gaze-0.5.1.tgz";
        name = "gaze-0.5.1.tgz";
        sha1 = "22e731078ef3e49d1c4ab1115ac091192051824c";
      })
    ];
    buildInputs =
      (self.nativeDeps."gaze" or []);
    deps = {
      "globule-0.1.0" = self.by-version."globule"."0.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "gaze" ];
  };
  by-spec."glob"."^4.0.0" =
    self.by-version."glob"."4.0.5";
  by-version."glob"."4.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "glob-4.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/glob/-/glob-4.0.5.tgz";
        name = "glob-4.0.5.tgz";
        sha1 = "95e42c9efdb3ab1f4788fd7793dfded4a3378063";
      })
    ];
    buildInputs =
      (self.nativeDeps."glob" or []);
    deps = {
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "minimatch-1.0.0" = self.by-version."minimatch"."1.0.0";
      "once-1.3.0" = self.by-version."once"."1.3.0";
      "graceful-fs-3.0.2" = self.by-version."graceful-fs"."3.0.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "glob" ];
  };
  by-spec."glob"."~3.1.21" =
    self.by-version."glob"."3.1.21";
  by-version."glob"."3.1.21" = lib.makeOverridable self.buildNodePackage {
    name = "glob-3.1.21";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/glob/-/glob-3.1.21.tgz";
        name = "glob-3.1.21.tgz";
        sha1 = "d29e0a055dea5138f4d07ed40e8982e83c2066cd";
      })
    ];
    buildInputs =
      (self.nativeDeps."glob" or []);
    deps = {
      "minimatch-0.2.14" = self.by-version."minimatch"."0.2.14";
      "graceful-fs-1.2.3" = self.by-version."graceful-fs"."1.2.3";
      "inherits-1.0.0" = self.by-version."inherits"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "glob" ];
  };
  by-spec."glob"."~3.2.9" =
    self.by-version."glob"."3.2.11";
  by-version."glob"."3.2.11" = lib.makeOverridable self.buildNodePackage {
    name = "glob-3.2.11";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/glob/-/glob-3.2.11.tgz";
        name = "glob-3.2.11.tgz";
        sha1 = "4a973f635b9190f715d10987d5c00fd2815ebe3d";
      })
    ];
    buildInputs =
      (self.nativeDeps."glob" or []);
    deps = {
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "minimatch-0.3.0" = self.by-version."minimatch"."0.3.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "glob" ];
  };
  by-spec."glob"."~4.0.2" =
    self.by-version."glob"."4.0.5";
  by-spec."glob-stream"."^3.1.5" =
    self.by-version."glob-stream"."3.1.15";
  by-version."glob-stream"."3.1.15" = lib.makeOverridable self.buildNodePackage {
    name = "glob-stream-3.1.15";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/glob-stream/-/glob-stream-3.1.15.tgz";
        name = "glob-stream-3.1.15.tgz";
        sha1 = "084bdbe9d8203fbb48bcf05c382dbb7e6666f8f5";
      })
    ];
    buildInputs =
      (self.nativeDeps."glob-stream" or []);
    deps = {
      "glob-4.0.5" = self.by-version."glob"."4.0.5";
      "minimatch-1.0.0" = self.by-version."minimatch"."1.0.0";
      "ordered-read-streams-0.0.8" = self.by-version."ordered-read-streams"."0.0.8";
      "glob2base-0.0.11" = self.by-version."glob2base"."0.0.11";
      "unique-stream-1.0.0" = self.by-version."unique-stream"."1.0.0";
      "through2-0.6.1" = self.by-version."through2"."0.6.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "glob-stream" ];
  };
  by-spec."glob-watcher"."^0.0.6" =
    self.by-version."glob-watcher"."0.0.6";
  by-version."glob-watcher"."0.0.6" = lib.makeOverridable self.buildNodePackage {
    name = "glob-watcher-0.0.6";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/glob-watcher/-/glob-watcher-0.0.6.tgz";
        name = "glob-watcher-0.0.6.tgz";
        sha1 = "b95b4a8df74b39c83298b0c05c978b4d9a3b710b";
      })
    ];
    buildInputs =
      (self.nativeDeps."glob-watcher" or []);
    deps = {
      "gaze-0.5.1" = self.by-version."gaze"."0.5.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "glob-watcher" ];
  };
  by-spec."glob2base"."^0.0.11" =
    self.by-version."glob2base"."0.0.11";
  by-version."glob2base"."0.0.11" = lib.makeOverridable self.buildNodePackage {
    name = "glob2base-0.0.11";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/glob2base/-/glob2base-0.0.11.tgz";
        name = "glob2base-0.0.11.tgz";
        sha1 = "e56904ae5292c2d9cefbc5b97f419614fb56b660";
      })
    ];
    buildInputs =
      (self.nativeDeps."glob2base" or []);
    deps = {
      "lodash-2.4.1" = self.by-version."lodash"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "glob2base" ];
  };
  by-spec."globule"."~0.1.0" =
    self.by-version."globule"."0.1.0";
  by-version."globule"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "globule-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/globule/-/globule-0.1.0.tgz";
        name = "globule-0.1.0.tgz";
        sha1 = "d9c8edde1da79d125a151b79533b978676346ae5";
      })
    ];
    buildInputs =
      (self.nativeDeps."globule" or []);
    deps = {
      "lodash-1.0.1" = self.by-version."lodash"."1.0.1";
      "glob-3.1.21" = self.by-version."glob"."3.1.21";
      "minimatch-0.2.14" = self.by-version."minimatch"."0.2.14";
    };
    peerDependencies = [
    ];
    passthru.names = [ "globule" ];
  };
  by-spec."got"."^1.0.1" =
    self.by-version."got"."1.2.0";
  by-version."got"."1.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "got-1.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/got/-/got-1.2.0.tgz";
        name = "got-1.2.0.tgz";
        sha1 = "11407f478e2ec1355a25427fba2e7563cbe8e732";
      })
    ];
    buildInputs =
      (self.nativeDeps."got" or []);
    deps = {
      "object-assign-0.3.1" = self.by-version."object-assign"."0.3.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "got" ];
  };
  by-spec."graceful-fs"."^3.0.0" =
    self.by-version."graceful-fs"."3.0.2";
  by-version."graceful-fs"."3.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "graceful-fs-3.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/graceful-fs/-/graceful-fs-3.0.2.tgz";
        name = "graceful-fs-3.0.2.tgz";
        sha1 = "2cb5bf7f742bea8ad47c754caeee032b7e71a577";
      })
    ];
    buildInputs =
      (self.nativeDeps."graceful-fs" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "graceful-fs" ];
  };
  by-spec."graceful-fs"."^3.0.2" =
    self.by-version."graceful-fs"."3.0.2";
  by-spec."graceful-fs"."~1.2.0" =
    self.by-version."graceful-fs"."1.2.3";
  by-version."graceful-fs"."1.2.3" = lib.makeOverridable self.buildNodePackage {
    name = "graceful-fs-1.2.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/graceful-fs/-/graceful-fs-1.2.3.tgz";
        name = "graceful-fs-1.2.3.tgz";
        sha1 = "15a4806a57547cb2d2dbf27f42e89a8c3451b364";
      })
    ];
    buildInputs =
      (self.nativeDeps."graceful-fs" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "graceful-fs" ];
  };
  by-spec."graceful-fs"."~2.0.0" =
    self.by-version."graceful-fs"."2.0.3";
  by-version."graceful-fs"."2.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "graceful-fs-2.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/graceful-fs/-/graceful-fs-2.0.3.tgz";
        name = "graceful-fs-2.0.3.tgz";
        sha1 = "7cd2cdb228a4a3f36e95efa6cc142de7d1a136d0";
      })
    ];
    buildInputs =
      (self.nativeDeps."graceful-fs" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "graceful-fs" ];
  };
  by-spec."graceful-fs"."~3.0.1" =
    self.by-version."graceful-fs"."3.0.2";
  by-spec."graceful-fs"."~3.0.2" =
    self.by-version."graceful-fs"."3.0.2";
  by-spec."gulp"."^3.8.7" =
    self.by-version."gulp"."3.8.8";
  by-version."gulp"."3.8.8" = lib.makeOverridable self.buildNodePackage {
    name = "gulp-3.8.8";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/gulp/-/gulp-3.8.8.tgz";
        name = "gulp-3.8.8.tgz";
        sha1 = "0b0473e7cdfd04c785184513938397d4552cfe96";
      })
    ];
    buildInputs =
      (self.nativeDeps."gulp" or []);
    deps = {
      "archy-0.0.2" = self.by-version."archy"."0.0.2";
      "chalk-0.5.1" = self.by-version."chalk"."0.5.1";
      "deprecated-0.0.1" = self.by-version."deprecated"."0.0.1";
      "gulp-util-3.0.1" = self.by-version."gulp-util"."3.0.1";
      "interpret-0.3.6" = self.by-version."interpret"."0.3.6";
      "liftoff-0.12.1" = self.by-version."liftoff"."0.12.1";
      "minimist-1.1.0" = self.by-version."minimist"."1.1.0";
      "orchestrator-0.3.7" = self.by-version."orchestrator"."0.3.7";
      "pretty-hrtime-0.2.1" = self.by-version."pretty-hrtime"."0.2.1";
      "semver-3.0.1" = self.by-version."semver"."3.0.1";
      "tildify-1.0.0" = self.by-version."tildify"."1.0.0";
      "vinyl-fs-0.3.7" = self.by-version."vinyl-fs"."0.3.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "gulp" ];
  };
  "gulp" = self.by-version."gulp"."3.8.8";
  by-spec."gulp-coffee"."^2.1.2" =
    self.by-version."gulp-coffee"."2.2.0";
  by-version."gulp-coffee"."2.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "gulp-coffee-2.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/gulp-coffee/-/gulp-coffee-2.2.0.tgz";
        name = "gulp-coffee-2.2.0.tgz";
        sha1 = "261fba53a28cf9c3ca8157bcdc49a39a7ed668aa";
      })
    ];
    buildInputs =
      (self.nativeDeps."gulp-coffee" or []);
    deps = {
      "coffee-script-1.8.0" = self.by-version."coffee-script"."1.8.0";
      "through2-0.6.1" = self.by-version."through2"."0.6.1";
      "gulp-util-3.0.1" = self.by-version."gulp-util"."3.0.1";
      "merge-1.2.0" = self.by-version."merge"."1.2.0";
      "vinyl-sourcemaps-apply-0.1.1" = self.by-version."vinyl-sourcemaps-apply"."0.1.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "gulp-coffee" ];
  };
  "gulp-coffee" = self.by-version."gulp-coffee"."2.2.0";
  by-spec."gulp-concat"."^2.3.4" =
    self.by-version."gulp-concat"."2.4.0";
  by-version."gulp-concat"."2.4.0" = lib.makeOverridable self.buildNodePackage {
    name = "gulp-concat-2.4.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/gulp-concat/-/gulp-concat-2.4.0.tgz";
        name = "gulp-concat-2.4.0.tgz";
        sha1 = "bd20abfd853a7f530155d60478aab9fd04882a8f";
      })
    ];
    buildInputs =
      (self.nativeDeps."gulp-concat" or []);
    deps = {
      "concat-with-sourcemaps-0.1.3" = self.by-version."concat-with-sourcemaps"."0.1.3";
      "gulp-util-2.2.20" = self.by-version."gulp-util"."2.2.20";
      "through-2.3.4" = self.by-version."through"."2.3.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "gulp-concat" ];
  };
  "gulp-concat" = self.by-version."gulp-concat"."2.4.0";
  by-spec."gulp-sourcemaps"."^1.1.1" =
    self.by-version."gulp-sourcemaps"."1.1.5";
  by-version."gulp-sourcemaps"."1.1.5" = lib.makeOverridable self.buildNodePackage {
    name = "gulp-sourcemaps-1.1.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/gulp-sourcemaps/-/gulp-sourcemaps-1.1.5.tgz";
        name = "gulp-sourcemaps-1.1.5.tgz";
        sha1 = "b09ff58e2c0afa6aef4126d0de10eb86dd4b4b0d";
      })
    ];
    buildInputs =
      (self.nativeDeps."gulp-sourcemaps" or []);
    deps = {
      "through2-0.6.1" = self.by-version."through2"."0.6.1";
      "vinyl-0.4.3" = self.by-version."vinyl"."0.4.3";
      "convert-source-map-0.4.1" = self.by-version."convert-source-map"."0.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "gulp-sourcemaps" ];
  };
  "gulp-sourcemaps" = self.by-version."gulp-sourcemaps"."1.1.5";
  by-spec."gulp-util"."^2.2.5" =
    self.by-version."gulp-util"."2.2.20";
  by-version."gulp-util"."2.2.20" = lib.makeOverridable self.buildNodePackage {
    name = "gulp-util-2.2.20";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/gulp-util/-/gulp-util-2.2.20.tgz";
        name = "gulp-util-2.2.20.tgz";
        sha1 = "d7146e5728910bd8f047a6b0b1e549bc22dbd64c";
      })
    ];
    buildInputs =
      (self.nativeDeps."gulp-util" or []);
    deps = {
      "chalk-0.5.1" = self.by-version."chalk"."0.5.1";
      "dateformat-1.0.8-1.2.3" = self.by-version."dateformat"."1.0.8-1.2.3";
      "lodash._reinterpolate-2.4.1" = self.by-version."lodash._reinterpolate"."2.4.1";
      "lodash.template-2.4.1" = self.by-version."lodash.template"."2.4.1";
      "minimist-0.2.0" = self.by-version."minimist"."0.2.0";
      "multipipe-0.1.1" = self.by-version."multipipe"."0.1.1";
      "through2-0.5.1" = self.by-version."through2"."0.5.1";
      "vinyl-0.2.3" = self.by-version."vinyl"."0.2.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "gulp-util" ];
  };
  by-spec."gulp-util"."^3.0.0" =
    self.by-version."gulp-util"."3.0.1";
  by-version."gulp-util"."3.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "gulp-util-3.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/gulp-util/-/gulp-util-3.0.1.tgz";
        name = "gulp-util-3.0.1.tgz";
        sha1 = "8214894d05c2bb6cc7f5544918a51ddf88180f00";
      })
    ];
    buildInputs =
      (self.nativeDeps."gulp-util" or []);
    deps = {
      "chalk-0.5.1" = self.by-version."chalk"."0.5.1";
      "dateformat-1.0.8-1.2.3" = self.by-version."dateformat"."1.0.8-1.2.3";
      "lodash-2.4.1" = self.by-version."lodash"."2.4.1";
      "lodash._reinterpolate-2.4.1" = self.by-version."lodash._reinterpolate"."2.4.1";
      "lodash.template-2.4.1" = self.by-version."lodash.template"."2.4.1";
      "minimist-1.1.0" = self.by-version."minimist"."1.1.0";
      "multipipe-0.1.1" = self.by-version."multipipe"."0.1.1";
      "through2-0.6.1" = self.by-version."through2"."0.6.1";
      "vinyl-0.4.3" = self.by-version."vinyl"."0.4.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "gulp-util" ];
  };
  by-spec."handlebars"."~1.3.0" =
    self.by-version."handlebars"."1.3.0";
  by-version."handlebars"."1.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "handlebars-1.3.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/handlebars/-/handlebars-1.3.0.tgz";
        name = "handlebars-1.3.0.tgz";
        sha1 = "9e9b130a93e389491322d975cf3ec1818c37ce34";
      })
    ];
    buildInputs =
      (self.nativeDeps."handlebars" or []);
    deps = {
      "optimist-0.3.7" = self.by-version."optimist"."0.3.7";
      "uglify-js-2.3.6" = self.by-version."uglify-js"."2.3.6";
    };
    peerDependencies = [
    ];
    passthru.names = [ "handlebars" ];
  };
  by-spec."has-ansi"."^0.1.0" =
    self.by-version."has-ansi"."0.1.0";
  by-version."has-ansi"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "has-ansi-0.1.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/has-ansi/-/has-ansi-0.1.0.tgz";
        name = "has-ansi-0.1.0.tgz";
        sha1 = "84f265aae8c0e6a88a12d7022894b7568894c62e";
      })
    ];
    buildInputs =
      (self.nativeDeps."has-ansi" or []);
    deps = {
      "ansi-regex-0.2.1" = self.by-version."ansi-regex"."0.2.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "has-ansi" ];
  };
  by-spec."has-color"."~0.1.0" =
    self.by-version."has-color"."0.1.7";
  by-version."has-color"."0.1.7" = lib.makeOverridable self.buildNodePackage {
    name = "has-color-0.1.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/has-color/-/has-color-0.1.7.tgz";
        name = "has-color-0.1.7.tgz";
        sha1 = "67144a5260c34fc3cca677d041daf52fe7b78b2f";
      })
    ];
    buildInputs =
      (self.nativeDeps."has-color" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "has-color" ];
  };
  by-spec."hawk"."1.1.1" =
    self.by-version."hawk"."1.1.1";
  by-version."hawk"."1.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "hawk-1.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/hawk/-/hawk-1.1.1.tgz";
        name = "hawk-1.1.1.tgz";
        sha1 = "87cd491f9b46e4e2aeaca335416766885d2d1ed9";
      })
    ];
    buildInputs =
      (self.nativeDeps."hawk" or []);
    deps = {
      "hoek-0.9.1" = self.by-version."hoek"."0.9.1";
      "boom-0.4.2" = self.by-version."boom"."0.4.2";
      "cryptiles-0.2.2" = self.by-version."cryptiles"."0.2.2";
      "sntp-0.2.4" = self.by-version."sntp"."0.2.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "hawk" ];
  };
  by-spec."hawk"."~1.0.0" =
    self.by-version."hawk"."1.0.0";
  by-version."hawk"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "hawk-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/hawk/-/hawk-1.0.0.tgz";
        name = "hawk-1.0.0.tgz";
        sha1 = "b90bb169807285411da7ffcb8dd2598502d3b52d";
      })
    ];
    buildInputs =
      (self.nativeDeps."hawk" or []);
    deps = {
      "hoek-0.9.1" = self.by-version."hoek"."0.9.1";
      "boom-0.4.2" = self.by-version."boom"."0.4.2";
      "cryptiles-0.2.2" = self.by-version."cryptiles"."0.2.2";
      "sntp-0.2.4" = self.by-version."sntp"."0.2.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "hawk" ];
  };
  by-spec."hoek"."0.9.x" =
    self.by-version."hoek"."0.9.1";
  by-version."hoek"."0.9.1" = lib.makeOverridable self.buildNodePackage {
    name = "hoek-0.9.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/hoek/-/hoek-0.9.1.tgz";
        name = "hoek-0.9.1.tgz";
        sha1 = "3d322462badf07716ea7eb85baf88079cddce505";
      })
    ];
    buildInputs =
      (self.nativeDeps."hoek" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "hoek" ];
  };
  by-spec."http-signature"."~0.10.0" =
    self.by-version."http-signature"."0.10.0";
  by-version."http-signature"."0.10.0" = lib.makeOverridable self.buildNodePackage {
    name = "http-signature-0.10.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/http-signature/-/http-signature-0.10.0.tgz";
        name = "http-signature-0.10.0.tgz";
        sha1 = "1494e4f5000a83c0f11bcc12d6007c530cb99582";
      })
    ];
    buildInputs =
      (self.nativeDeps."http-signature" or []);
    deps = {
      "assert-plus-0.1.2" = self.by-version."assert-plus"."0.1.2";
      "asn1-0.1.11" = self.by-version."asn1"."0.1.11";
      "ctype-0.5.2" = self.by-version."ctype"."0.5.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "http-signature" ];
  };
  by-spec."inherits"."1" =
    self.by-version."inherits"."1.0.0";
  by-version."inherits"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "inherits-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/inherits/-/inherits-1.0.0.tgz";
        name = "inherits-1.0.0.tgz";
        sha1 = "38e1975285bf1f7ba9c84da102bb12771322ac48";
      })
    ];
    buildInputs =
      (self.nativeDeps."inherits" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "inherits" ];
  };
  by-spec."inherits"."2" =
    self.by-version."inherits"."2.0.1";
  by-version."inherits"."2.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "inherits-2.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/inherits/-/inherits-2.0.1.tgz";
        name = "inherits-2.0.1.tgz";
        sha1 = "b17d08d326b4423e568eff719f91b0b1cbdf69f1";
      })
    ];
    buildInputs =
      (self.nativeDeps."inherits" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "inherits" ];
  };
  by-spec."inherits"."~1.0.0" =
    self.by-version."inherits"."1.0.0";
  by-spec."inherits"."~2.0.0" =
    self.by-version."inherits"."2.0.1";
  by-spec."inherits"."~2.0.1" =
    self.by-version."inherits"."2.0.1";
  by-spec."ini"."1" =
    self.by-version."ini"."1.2.1";
  by-version."ini"."1.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "ini-1.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ini/-/ini-1.2.1.tgz";
        name = "ini-1.2.1.tgz";
        sha1 = "7f774e2f22752cd1dacbf9c63323df2a164ebca3";
      })
    ];
    buildInputs =
      (self.nativeDeps."ini" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ini" ];
  };
  by-spec."ini"."^1.2.0" =
    self.by-version."ini"."1.2.1";
  by-spec."inquirer"."^0.6.0" =
    self.by-version."inquirer"."0.6.0";
  by-version."inquirer"."0.6.0" = lib.makeOverridable self.buildNodePackage {
    name = "inquirer-0.6.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/inquirer/-/inquirer-0.6.0.tgz";
        name = "inquirer-0.6.0.tgz";
        sha1 = "614d7bb3e48f9e6a8028e94a0c38f23ef29823d3";
      })
    ];
    buildInputs =
      (self.nativeDeps."inquirer" or []);
    deps = {
      "chalk-0.5.1" = self.by-version."chalk"."0.5.1";
      "cli-color-0.3.2" = self.by-version."cli-color"."0.3.2";
      "lodash-2.4.1" = self.by-version."lodash"."2.4.1";
      "mute-stream-0.0.4" = self.by-version."mute-stream"."0.0.4";
      "readline2-0.1.0" = self.by-version."readline2"."0.1.0";
      "rx-2.3.9" = self.by-version."rx"."2.3.9";
      "through-2.3.4" = self.by-version."through"."2.3.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "inquirer" ];
  };
  by-spec."inquirer"."~0.5.1" =
    self.by-version."inquirer"."0.5.1";
  by-version."inquirer"."0.5.1" = lib.makeOverridable self.buildNodePackage {
    name = "inquirer-0.5.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/inquirer/-/inquirer-0.5.1.tgz";
        name = "inquirer-0.5.1.tgz";
        sha1 = "e9f2cd1ee172c7a32e054b78a03d4ddb0d7707f1";
      })
    ];
    buildInputs =
      (self.nativeDeps."inquirer" or []);
    deps = {
      "async-0.8.0" = self.by-version."async"."0.8.0";
      "cli-color-0.3.2" = self.by-version."cli-color"."0.3.2";
      "lodash-2.4.1" = self.by-version."lodash"."2.4.1";
      "mute-stream-0.0.4" = self.by-version."mute-stream"."0.0.4";
      "readline2-0.1.0" = self.by-version."readline2"."0.1.0";
      "through-2.3.4" = self.by-version."through"."2.3.4";
      "chalk-0.4.0" = self.by-version."chalk"."0.4.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "inquirer" ];
  };
  by-spec."insight"."~0.4.1" =
    self.by-version."insight"."0.4.3";
  by-version."insight"."0.4.3" = lib.makeOverridable self.buildNodePackage {
    name = "insight-0.4.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/insight/-/insight-0.4.3.tgz";
        name = "insight-0.4.3.tgz";
        sha1 = "76d653c5c0d8048b03cdba6385a6948f74614af0";
      })
    ];
    buildInputs =
      (self.nativeDeps."insight" or []);
    deps = {
      "async-0.9.0" = self.by-version."async"."0.9.0";
      "chalk-0.5.1" = self.by-version."chalk"."0.5.1";
      "configstore-0.3.1" = self.by-version."configstore"."0.3.1";
      "inquirer-0.6.0" = self.by-version."inquirer"."0.6.0";
      "lodash.debounce-2.4.1" = self.by-version."lodash.debounce"."2.4.1";
      "object-assign-1.0.0" = self.by-version."object-assign"."1.0.0";
      "os-name-1.0.0" = self.by-version."os-name"."1.0.0";
      "request-2.42.0" = self.by-version."request"."2.42.0";
      "tough-cookie-0.12.1" = self.by-version."tough-cookie"."0.12.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "insight" ];
  };
  by-spec."interpret"."^0.3.2" =
    self.by-version."interpret"."0.3.6";
  by-version."interpret"."0.3.6" = lib.makeOverridable self.buildNodePackage {
    name = "interpret-0.3.6";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/interpret/-/interpret-0.3.6.tgz";
        name = "interpret-0.3.6.tgz";
        sha1 = "51b6927f372a92f1e4a2a5af0d14699de9618799";
      })
    ];
    buildInputs =
      (self.nativeDeps."interpret" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "interpret" ];
  };
  by-spec."intersect"."~0.0.3" =
    self.by-version."intersect"."0.0.3";
  by-version."intersect"."0.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "intersect-0.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/intersect/-/intersect-0.0.3.tgz";
        name = "intersect-0.0.3.tgz";
        sha1 = "c1a4a5e5eac6ede4af7504cc07e0ada7bc9f4920";
      })
    ];
    buildInputs =
      (self.nativeDeps."intersect" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "intersect" ];
  };
  by-spec."is-root"."~0.1.0" =
    self.by-version."is-root"."0.1.0";
  by-version."is-root"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "is-root-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/is-root/-/is-root-0.1.0.tgz";
        name = "is-root-0.1.0.tgz";
        sha1 = "825e394ab593df2d73c5d0092fce507270b53dcb";
      })
    ];
    buildInputs =
      (self.nativeDeps."is-root" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "is-root" ];
  };
  by-spec."is-utf8"."^0.2.0" =
    self.by-version."is-utf8"."0.2.0";
  by-version."is-utf8"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "is-utf8-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/is-utf8/-/is-utf8-0.2.0.tgz";
        name = "is-utf8-0.2.0.tgz";
        sha1 = "b8aa54125ae626bfe4e3beb965f16a89c58a1137";
      })
    ];
    buildInputs =
      (self.nativeDeps."is-utf8" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "is-utf8" ];
  };
  by-spec."isarray"."0.0.1" =
    self.by-version."isarray"."0.0.1";
  by-version."isarray"."0.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "isarray-0.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz";
        name = "isarray-0.0.1.tgz";
        sha1 = "8a18acfca9a8f4177e09abfc6038939b05d1eedf";
      })
    ];
    buildInputs =
      (self.nativeDeps."isarray" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "isarray" ];
  };
  by-spec."js-yaml"."~3.0.1" =
    self.by-version."js-yaml"."3.0.2";
  by-version."js-yaml"."3.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "js-yaml-3.0.2";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/js-yaml/-/js-yaml-3.0.2.tgz";
        name = "js-yaml-3.0.2.tgz";
        sha1 = "9937865f8e897a5e894e73c2c5cf2e89b32eb771";
      })
    ];
    buildInputs =
      (self.nativeDeps."js-yaml" or []);
    deps = {
      "argparse-0.1.15" = self.by-version."argparse"."0.1.15";
      "esprima-1.0.4" = self.by-version."esprima"."1.0.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "js-yaml" ];
  };
  by-spec."jsmin"."^1.0.1" =
    self.by-version."jsmin"."1.0.1";
  by-version."jsmin"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "jsmin-1.0.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/jsmin/-/jsmin-1.0.1.tgz";
        name = "jsmin-1.0.1.tgz";
        sha1 = "e7bd0dcd6496c3bf4863235bf461a3d98aa3b98c";
      })
    ];
    buildInputs =
      (self.nativeDeps."jsmin" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "jsmin" ];
  };
  "jsmin" = self.by-version."jsmin"."1.0.1";
  by-spec."json-stringify-safe"."~5.0.0" =
    self.by-version."json-stringify-safe"."5.0.0";
  by-version."json-stringify-safe"."5.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "json-stringify-safe-5.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5.0.0.tgz";
        name = "json-stringify-safe-5.0.0.tgz";
        sha1 = "4c1f228b5050837eba9d21f50c2e6e320624566e";
      })
    ];
    buildInputs =
      (self.nativeDeps."json-stringify-safe" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "json-stringify-safe" ];
  };
  by-spec."jsonify"."~0.0.0" =
    self.by-version."jsonify"."0.0.0";
  by-version."jsonify"."0.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "jsonify-0.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/jsonify/-/jsonify-0.0.0.tgz";
        name = "jsonify-0.0.0.tgz";
        sha1 = "2c74b6ee41d93ca51b7b5aaee8f503631d252a73";
      })
    ];
    buildInputs =
      (self.nativeDeps."jsonify" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "jsonify" ];
  };
  by-spec."junk"."~0.3.0" =
    self.by-version."junk"."0.3.0";
  by-version."junk"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "junk-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/junk/-/junk-0.3.0.tgz";
        name = "junk-0.3.0.tgz";
        sha1 = "6c89c636f6e99898d8efbfc50430db40be71e10c";
      })
    ];
    buildInputs =
      (self.nativeDeps."junk" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "junk" ];
  };
  by-spec."latest-version"."^1.0.0" =
    self.by-version."latest-version"."1.0.0";
  by-version."latest-version"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "latest-version-1.0.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/latest-version/-/latest-version-1.0.0.tgz";
        name = "latest-version-1.0.0.tgz";
        sha1 = "84f40e5c90745c7e4f7811624d6152c381d931d9";
      })
    ];
    buildInputs =
      (self.nativeDeps."latest-version" or []);
    deps = {
      "package-json-1.0.0" = self.by-version."package-json"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "latest-version" ];
  };
  by-spec."liftoff"."^0.12.0" =
    self.by-version."liftoff"."0.12.1";
  by-version."liftoff"."0.12.1" = lib.makeOverridable self.buildNodePackage {
    name = "liftoff-0.12.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/liftoff/-/liftoff-0.12.1.tgz";
        name = "liftoff-0.12.1.tgz";
        sha1 = "bcaa49759c68396b83b984ad0b2d8cc226f9526d";
      })
    ];
    buildInputs =
      (self.nativeDeps."liftoff" or []);
    deps = {
      "findup-sync-0.1.3" = self.by-version."findup-sync"."0.1.3";
      "resolve-0.7.4" = self.by-version."resolve"."0.7.4";
      "minimist-0.2.0" = self.by-version."minimist"."0.2.0";
      "extend-1.3.0" = self.by-version."extend"."1.3.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "liftoff" ];
  };
  by-spec."lockfile"."~0.4.2" =
    self.by-version."lockfile"."0.4.3";
  by-version."lockfile"."0.4.3" = lib.makeOverridable self.buildNodePackage {
    name = "lockfile-0.4.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lockfile/-/lockfile-0.4.3.tgz";
        name = "lockfile-0.4.3.tgz";
        sha1 = "79b965ee9b32d9dd24b59cf81205e6dcb6d3b224";
      })
    ];
    buildInputs =
      (self.nativeDeps."lockfile" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lockfile" ];
  };
  by-spec."lodash"."^2.4.1" =
    self.by-version."lodash"."2.4.1";
  by-version."lodash"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash/-/lodash-2.4.1.tgz";
        name = "lodash-2.4.1.tgz";
        sha1 = "5b7723034dda4d262e5a46fb2c58d7cc22f71420";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash" ];
  };
  by-spec."lodash"."~1.0.1" =
    self.by-version."lodash"."1.0.1";
  by-version."lodash"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash/-/lodash-1.0.1.tgz";
        name = "lodash-1.0.1.tgz";
        sha1 = "57945732498d92310e5bd4b1ff4f273a79e6c9fc";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash" ];
  };
  by-spec."lodash"."~2.4.1" =
    self.by-version."lodash"."2.4.1";
  by-spec."lodash._escapehtmlchar"."~2.4.1" =
    self.by-version."lodash._escapehtmlchar"."2.4.1";
  by-version."lodash._escapehtmlchar"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash._escapehtmlchar-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash._escapehtmlchar/-/lodash._escapehtmlchar-2.4.1.tgz";
        name = "lodash._escapehtmlchar-2.4.1.tgz";
        sha1 = "df67c3bb6b7e8e1e831ab48bfa0795b92afe899d";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash._escapehtmlchar" or []);
    deps = {
      "lodash._htmlescapes-2.4.1" = self.by-version."lodash._htmlescapes"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash._escapehtmlchar" ];
  };
  by-spec."lodash._escapestringchar"."~2.4.1" =
    self.by-version."lodash._escapestringchar"."2.4.1";
  by-version."lodash._escapestringchar"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash._escapestringchar-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash._escapestringchar/-/lodash._escapestringchar-2.4.1.tgz";
        name = "lodash._escapestringchar-2.4.1.tgz";
        sha1 = "ecfe22618a2ade50bfeea43937e51df66f0edb72";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash._escapestringchar" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash._escapestringchar" ];
  };
  by-spec."lodash._htmlescapes"."~2.4.1" =
    self.by-version."lodash._htmlescapes"."2.4.1";
  by-version."lodash._htmlescapes"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash._htmlescapes-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash._htmlescapes/-/lodash._htmlescapes-2.4.1.tgz";
        name = "lodash._htmlescapes-2.4.1.tgz";
        sha1 = "32d14bf0844b6de6f8b62a051b4f67c228b624cb";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash._htmlescapes" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash._htmlescapes" ];
  };
  by-spec."lodash._isnative"."~2.4.1" =
    self.by-version."lodash._isnative"."2.4.1";
  by-version."lodash._isnative"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash._isnative-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash._isnative/-/lodash._isnative-2.4.1.tgz";
        name = "lodash._isnative-2.4.1.tgz";
        sha1 = "3ea6404b784a7be836c7b57580e1cdf79b14832c";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash._isnative" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash._isnative" ];
  };
  by-spec."lodash._objecttypes"."~2.4.1" =
    self.by-version."lodash._objecttypes"."2.4.1";
  by-version."lodash._objecttypes"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash._objecttypes-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash._objecttypes/-/lodash._objecttypes-2.4.1.tgz";
        name = "lodash._objecttypes-2.4.1.tgz";
        sha1 = "7c0b7f69d98a1f76529f890b0cdb1b4dfec11c11";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash._objecttypes" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash._objecttypes" ];
  };
  by-spec."lodash._reinterpolate"."^2.4.1" =
    self.by-version."lodash._reinterpolate"."2.4.1";
  by-version."lodash._reinterpolate"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash._reinterpolate-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash._reinterpolate/-/lodash._reinterpolate-2.4.1.tgz";
        name = "lodash._reinterpolate-2.4.1.tgz";
        sha1 = "4f1227aa5a8711fc632f5b07a1f4607aab8b3222";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash._reinterpolate" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash._reinterpolate" ];
  };
  by-spec."lodash._reinterpolate"."~2.4.1" =
    self.by-version."lodash._reinterpolate"."2.4.1";
  by-spec."lodash._reunescapedhtml"."~2.4.1" =
    self.by-version."lodash._reunescapedhtml"."2.4.1";
  by-version."lodash._reunescapedhtml"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash._reunescapedhtml-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash._reunescapedhtml/-/lodash._reunescapedhtml-2.4.1.tgz";
        name = "lodash._reunescapedhtml-2.4.1.tgz";
        sha1 = "747c4fc40103eb3bb8a0976e571f7a2659e93ba7";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash._reunescapedhtml" or []);
    deps = {
      "lodash._htmlescapes-2.4.1" = self.by-version."lodash._htmlescapes"."2.4.1";
      "lodash.keys-2.4.1" = self.by-version."lodash.keys"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash._reunescapedhtml" ];
  };
  by-spec."lodash._shimkeys"."~2.4.1" =
    self.by-version."lodash._shimkeys"."2.4.1";
  by-version."lodash._shimkeys"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash._shimkeys-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash._shimkeys/-/lodash._shimkeys-2.4.1.tgz";
        name = "lodash._shimkeys-2.4.1.tgz";
        sha1 = "6e9cc9666ff081f0b5a6c978b83e242e6949d203";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash._shimkeys" or []);
    deps = {
      "lodash._objecttypes-2.4.1" = self.by-version."lodash._objecttypes"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash._shimkeys" ];
  };
  by-spec."lodash.debounce"."^2.4.1" =
    self.by-version."lodash.debounce"."2.4.1";
  by-version."lodash.debounce"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.debounce-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.debounce/-/lodash.debounce-2.4.1.tgz";
        name = "lodash.debounce-2.4.1.tgz";
        sha1 = "d8cead246ec4b926e8b85678fc396bfeba8cc6fc";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.debounce" or []);
    deps = {
      "lodash.isfunction-2.4.1" = self.by-version."lodash.isfunction"."2.4.1";
      "lodash.isobject-2.4.1" = self.by-version."lodash.isobject"."2.4.1";
      "lodash.now-2.4.1" = self.by-version."lodash.now"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.debounce" ];
  };
  by-spec."lodash.defaults"."~2.4.1" =
    self.by-version."lodash.defaults"."2.4.1";
  by-version."lodash.defaults"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.defaults-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.defaults/-/lodash.defaults-2.4.1.tgz";
        name = "lodash.defaults-2.4.1.tgz";
        sha1 = "a7e8885f05e68851144b6e12a8f3678026bc4c54";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.defaults" or []);
    deps = {
      "lodash.keys-2.4.1" = self.by-version."lodash.keys"."2.4.1";
      "lodash._objecttypes-2.4.1" = self.by-version."lodash._objecttypes"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.defaults" ];
  };
  by-spec."lodash.escape"."~2.4.1" =
    self.by-version."lodash.escape"."2.4.1";
  by-version."lodash.escape"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.escape-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.escape/-/lodash.escape-2.4.1.tgz";
        name = "lodash.escape-2.4.1.tgz";
        sha1 = "2ce12c5e084db0a57dda5e5d1eeeb9f5d175a3b4";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.escape" or []);
    deps = {
      "lodash._escapehtmlchar-2.4.1" = self.by-version."lodash._escapehtmlchar"."2.4.1";
      "lodash.keys-2.4.1" = self.by-version."lodash.keys"."2.4.1";
      "lodash._reunescapedhtml-2.4.1" = self.by-version."lodash._reunescapedhtml"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.escape" ];
  };
  by-spec."lodash.isfunction"."~2.4.1" =
    self.by-version."lodash.isfunction"."2.4.1";
  by-version."lodash.isfunction"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.isfunction-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.isfunction/-/lodash.isfunction-2.4.1.tgz";
        name = "lodash.isfunction-2.4.1.tgz";
        sha1 = "2cfd575c73e498ab57e319b77fa02adef13a94d1";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.isfunction" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.isfunction" ];
  };
  by-spec."lodash.isobject"."~2.4.1" =
    self.by-version."lodash.isobject"."2.4.1";
  by-version."lodash.isobject"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.isobject-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.isobject/-/lodash.isobject-2.4.1.tgz";
        name = "lodash.isobject-2.4.1.tgz";
        sha1 = "5a2e47fe69953f1ee631a7eba1fe64d2d06558f5";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.isobject" or []);
    deps = {
      "lodash._objecttypes-2.4.1" = self.by-version."lodash._objecttypes"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.isobject" ];
  };
  by-spec."lodash.keys"."~2.4.1" =
    self.by-version."lodash.keys"."2.4.1";
  by-version."lodash.keys"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.keys-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.keys/-/lodash.keys-2.4.1.tgz";
        name = "lodash.keys-2.4.1.tgz";
        sha1 = "48dea46df8ff7632b10d706b8acb26591e2b3727";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.keys" or []);
    deps = {
      "lodash._isnative-2.4.1" = self.by-version."lodash._isnative"."2.4.1";
      "lodash.isobject-2.4.1" = self.by-version."lodash.isobject"."2.4.1";
      "lodash._shimkeys-2.4.1" = self.by-version."lodash._shimkeys"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.keys" ];
  };
  by-spec."lodash.now"."~2.4.1" =
    self.by-version."lodash.now"."2.4.1";
  by-version."lodash.now"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.now-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.now/-/lodash.now-2.4.1.tgz";
        name = "lodash.now-2.4.1.tgz";
        sha1 = "6872156500525185faf96785bb7fe7fe15b562c6";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.now" or []);
    deps = {
      "lodash._isnative-2.4.1" = self.by-version."lodash._isnative"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.now" ];
  };
  by-spec."lodash.template"."^2.4.1" =
    self.by-version."lodash.template"."2.4.1";
  by-version."lodash.template"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.template-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.template/-/lodash.template-2.4.1.tgz";
        name = "lodash.template-2.4.1.tgz";
        sha1 = "9e611007edf629129a974ab3c48b817b3e1cf20d";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.template" or []);
    deps = {
      "lodash.defaults-2.4.1" = self.by-version."lodash.defaults"."2.4.1";
      "lodash.escape-2.4.1" = self.by-version."lodash.escape"."2.4.1";
      "lodash._escapestringchar-2.4.1" = self.by-version."lodash._escapestringchar"."2.4.1";
      "lodash.keys-2.4.1" = self.by-version."lodash.keys"."2.4.1";
      "lodash._reinterpolate-2.4.1" = self.by-version."lodash._reinterpolate"."2.4.1";
      "lodash.templatesettings-2.4.1" = self.by-version."lodash.templatesettings"."2.4.1";
      "lodash.values-2.4.1" = self.by-version."lodash.values"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.template" ];
  };
  by-spec."lodash.templatesettings"."~2.4.1" =
    self.by-version."lodash.templatesettings"."2.4.1";
  by-version."lodash.templatesettings"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.templatesettings-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.templatesettings/-/lodash.templatesettings-2.4.1.tgz";
        name = "lodash.templatesettings-2.4.1.tgz";
        sha1 = "ea76c75d11eb86d4dbe89a83893bb861929ac699";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.templatesettings" or []);
    deps = {
      "lodash.escape-2.4.1" = self.by-version."lodash.escape"."2.4.1";
      "lodash._reinterpolate-2.4.1" = self.by-version."lodash._reinterpolate"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.templatesettings" ];
  };
  by-spec."lodash.values"."~2.4.1" =
    self.by-version."lodash.values"."2.4.1";
  by-version."lodash.values"."2.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.values-2.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.values/-/lodash.values-2.4.1.tgz";
        name = "lodash.values-2.4.1.tgz";
        sha1 = "abf514436b3cb705001627978cbcf30b1280eea4";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.values" or []);
    deps = {
      "lodash.keys-2.4.1" = self.by-version."lodash.keys"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.values" ];
  };
  by-spec."lru-cache"."2" =
    self.by-version."lru-cache"."2.5.0";
  by-version."lru-cache"."2.5.0" = lib.makeOverridable self.buildNodePackage {
    name = "lru-cache-2.5.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lru-cache/-/lru-cache-2.5.0.tgz";
        name = "lru-cache-2.5.0.tgz";
        sha1 = "d82388ae9c960becbea0c73bb9eb79b6c6ce9aeb";
      })
    ];
    buildInputs =
      (self.nativeDeps."lru-cache" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lru-cache" ];
  };
  by-spec."lru-cache"."~2.3.0" =
    self.by-version."lru-cache"."2.3.1";
  by-version."lru-cache"."2.3.1" = lib.makeOverridable self.buildNodePackage {
    name = "lru-cache-2.3.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lru-cache/-/lru-cache-2.3.1.tgz";
        name = "lru-cache-2.3.1.tgz";
        sha1 = "b3adf6b3d856e954e2c390e6cef22081245a53d6";
      })
    ];
    buildInputs =
      (self.nativeDeps."lru-cache" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lru-cache" ];
  };
  by-spec."lru-cache"."~2.5.0" =
    self.by-version."lru-cache"."2.5.0";
  by-spec."lru-queue"."0.1.x" =
    self.by-version."lru-queue"."0.1.0";
  by-version."lru-queue"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "lru-queue-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lru-queue/-/lru-queue-0.1.0.tgz";
        name = "lru-queue-0.1.0.tgz";
        sha1 = "2738bd9f0d3cf4f84490c5736c48699ac632cda3";
      })
    ];
    buildInputs =
      (self.nativeDeps."lru-queue" or []);
    deps = {
      "es5-ext-0.10.4" = self.by-version."es5-ext"."0.10.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lru-queue" ];
  };
  by-spec."memoizee"."0.3.x" =
    self.by-version."memoizee"."0.3.7";
  by-version."memoizee"."0.3.7" = lib.makeOverridable self.buildNodePackage {
    name = "memoizee-0.3.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/memoizee/-/memoizee-0.3.7.tgz";
        name = "memoizee-0.3.7.tgz";
        sha1 = "13ccfdd580e56cf7c10f4b6342a6800ef87e975b";
      })
    ];
    buildInputs =
      (self.nativeDeps."memoizee" or []);
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.4" = self.by-version."es5-ext"."0.10.4";
      "event-emitter-0.3.1" = self.by-version."event-emitter"."0.3.1";
      "lru-queue-0.1.0" = self.by-version."lru-queue"."0.1.0";
      "next-tick-0.2.2" = self.by-version."next-tick"."0.2.2";
      "timers-ext-0.1.0" = self.by-version."timers-ext"."0.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "memoizee" ];
  };
  by-spec."merge"."^1.1.3" =
    self.by-version."merge"."1.2.0";
  by-version."merge"."1.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "merge-1.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/merge/-/merge-1.2.0.tgz";
        name = "merge-1.2.0.tgz";
        sha1 = "7531e39d4949c281a66b8c5a6e0265e8b05894da";
      })
    ];
    buildInputs =
      (self.nativeDeps."merge" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "merge" ];
  };
  by-spec."mime"."~1.2.11" =
    self.by-version."mime"."1.2.11";
  by-version."mime"."1.2.11" = lib.makeOverridable self.buildNodePackage {
    name = "mime-1.2.11";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mime/-/mime-1.2.11.tgz";
        name = "mime-1.2.11.tgz";
        sha1 = "58203eed86e3a5ef17aed2b7d9ebd47f0a60dd10";
      })
    ];
    buildInputs =
      (self.nativeDeps."mime" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mime" ];
  };
  by-spec."mime"."~1.2.9" =
    self.by-version."mime"."1.2.11";
  by-spec."mime-types"."~1.0.1" =
    self.by-version."mime-types"."1.0.2";
  by-version."mime-types"."1.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "mime-types-1.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mime-types/-/mime-types-1.0.2.tgz";
        name = "mime-types-1.0.2.tgz";
        sha1 = "995ae1392ab8affcbfcb2641dd054e943c0d5dce";
      })
    ];
    buildInputs =
      (self.nativeDeps."mime-types" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mime-types" ];
  };
  by-spec."minimatch"."0.3" =
    self.by-version."minimatch"."0.3.0";
  by-version."minimatch"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "minimatch-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimatch/-/minimatch-0.3.0.tgz";
        name = "minimatch-0.3.0.tgz";
        sha1 = "275d8edaac4f1bb3326472089e7949c8394699dd";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimatch" or []);
    deps = {
      "lru-cache-2.5.0" = self.by-version."lru-cache"."2.5.0";
      "sigmund-1.0.0" = self.by-version."sigmund"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimatch" ];
  };
  by-spec."minimatch"."^1.0.0" =
    self.by-version."minimatch"."1.0.0";
  by-version."minimatch"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "minimatch-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimatch/-/minimatch-1.0.0.tgz";
        name = "minimatch-1.0.0.tgz";
        sha1 = "e0dd2120b49e1b724ce8d714c520822a9438576d";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimatch" or []);
    deps = {
      "lru-cache-2.5.0" = self.by-version."lru-cache"."2.5.0";
      "sigmund-1.0.0" = self.by-version."sigmund"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimatch" ];
  };
  by-spec."minimatch"."~0.2.0" =
    self.by-version."minimatch"."0.2.14";
  by-version."minimatch"."0.2.14" = lib.makeOverridable self.buildNodePackage {
    name = "minimatch-0.2.14";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimatch/-/minimatch-0.2.14.tgz";
        name = "minimatch-0.2.14.tgz";
        sha1 = "c74e780574f63c6f9a090e90efbe6ef53a6a756a";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimatch" or []);
    deps = {
      "lru-cache-2.5.0" = self.by-version."lru-cache"."2.5.0";
      "sigmund-1.0.0" = self.by-version."sigmund"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimatch" ];
  };
  by-spec."minimatch"."~0.2.11" =
    self.by-version."minimatch"."0.2.14";
  by-spec."minimist"."0.0.8" =
    self.by-version."minimist"."0.0.8";
  by-version."minimist"."0.0.8" = lib.makeOverridable self.buildNodePackage {
    name = "minimist-0.0.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimist/-/minimist-0.0.8.tgz";
        name = "minimist-0.0.8.tgz";
        sha1 = "857fcabfc3397d2625b8228262e86aa7a011b05d";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimist" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimist" ];
  };
  by-spec."minimist"."^0.2.0" =
    self.by-version."minimist"."0.2.0";
  by-version."minimist"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "minimist-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimist/-/minimist-0.2.0.tgz";
        name = "minimist-0.2.0.tgz";
        sha1 = "4dffe525dae2b864c66c2e23c6271d7afdecefce";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimist" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimist" ];
  };
  by-spec."minimist"."^1.1.0" =
    self.by-version."minimist"."1.1.0";
  by-version."minimist"."1.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "minimist-1.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimist/-/minimist-1.1.0.tgz";
        name = "minimist-1.1.0.tgz";
        sha1 = "cdf225e8898f840a258ded44fc91776770afdc93";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimist" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimist" ];
  };
  by-spec."minimist"."~0.0.1" =
    self.by-version."minimist"."0.0.10";
  by-version."minimist"."0.0.10" = lib.makeOverridable self.buildNodePackage {
    name = "minimist-0.0.10";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimist/-/minimist-0.0.10.tgz";
        name = "minimist-0.0.10.tgz";
        sha1 = "de3f98543dbf96082be48ad1a0c7cda836301dcf";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimist" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimist" ];
  };
  by-spec."minimist"."~0.2.0" =
    self.by-version."minimist"."0.2.0";
  by-spec."mkdirp"."0.5" =
    self.by-version."mkdirp"."0.5.0";
  by-version."mkdirp"."0.5.0" = lib.makeOverridable self.buildNodePackage {
    name = "mkdirp-0.5.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mkdirp/-/mkdirp-0.5.0.tgz";
        name = "mkdirp-0.5.0.tgz";
        sha1 = "1d73076a6df986cd9344e15e71fcc05a4c9abf12";
      })
    ];
    buildInputs =
      (self.nativeDeps."mkdirp" or []);
    deps = {
      "minimist-0.0.8" = self.by-version."minimist"."0.0.8";
    };
    peerDependencies = [
    ];
    passthru.names = [ "mkdirp" ];
  };
  by-spec."mkdirp"."^0.5.0" =
    self.by-version."mkdirp"."0.5.0";
  by-spec."mkdirp"."~0.3.5" =
    self.by-version."mkdirp"."0.3.5";
  by-version."mkdirp"."0.3.5" = lib.makeOverridable self.buildNodePackage {
    name = "mkdirp-0.3.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mkdirp/-/mkdirp-0.3.5.tgz";
        name = "mkdirp-0.3.5.tgz";
        sha1 = "de3e5f8961c88c787ee1368df849ac4413eca8d7";
      })
    ];
    buildInputs =
      (self.nativeDeps."mkdirp" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mkdirp" ];
  };
  by-spec."mkdirp"."~0.5.0" =
    self.by-version."mkdirp"."0.5.0";
  by-spec."mkpath"."~0.1.0" =
    self.by-version."mkpath"."0.1.0";
  by-version."mkpath"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "mkpath-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mkpath/-/mkpath-0.1.0.tgz";
        name = "mkpath-0.1.0.tgz";
        sha1 = "7554a6f8d871834cc97b5462b122c4c124d6de91";
      })
    ];
    buildInputs =
      (self.nativeDeps."mkpath" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mkpath" ];
  };
  by-spec."mout"."~0.9.0" =
    self.by-version."mout"."0.9.1";
  by-version."mout"."0.9.1" = lib.makeOverridable self.buildNodePackage {
    name = "mout-0.9.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mout/-/mout-0.9.1.tgz";
        name = "mout-0.9.1.tgz";
        sha1 = "84f0f3fd6acc7317f63de2affdcc0cee009b0477";
      })
    ];
    buildInputs =
      (self.nativeDeps."mout" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mout" ];
  };
  by-spec."mout"."~0.9.1" =
    self.by-version."mout"."0.9.1";
  by-spec."multipipe"."^0.1.0" =
    self.by-version."multipipe"."0.1.1";
  by-version."multipipe"."0.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "multipipe-0.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/multipipe/-/multipipe-0.1.1.tgz";
        name = "multipipe-0.1.1.tgz";
        sha1 = "bc271fbb2bf3a5ed3e43cc6ba3d7dbc1c4eb07fb";
      })
    ];
    buildInputs =
      (self.nativeDeps."multipipe" or []);
    deps = {
      "duplexer2-0.0.2" = self.by-version."duplexer2"."0.0.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "multipipe" ];
  };
  by-spec."mute-stream"."0.0.4" =
    self.by-version."mute-stream"."0.0.4";
  by-version."mute-stream"."0.0.4" = lib.makeOverridable self.buildNodePackage {
    name = "mute-stream-0.0.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mute-stream/-/mute-stream-0.0.4.tgz";
        name = "mute-stream-0.0.4.tgz";
        sha1 = "a9219960a6d5d5d046597aee51252c6655f7177e";
      })
    ];
    buildInputs =
      (self.nativeDeps."mute-stream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mute-stream" ];
  };
  by-spec."mute-stream"."~0.0.4" =
    self.by-version."mute-stream"."0.0.4";
  by-spec."next-tick"."~0.2.2" =
    self.by-version."next-tick"."0.2.2";
  by-version."next-tick"."0.2.2" = lib.makeOverridable self.buildNodePackage {
    name = "next-tick-0.2.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/next-tick/-/next-tick-0.2.2.tgz";
        name = "next-tick-0.2.2.tgz";
        sha1 = "75da4a927ee5887e39065880065b7336413b310d";
      })
    ];
    buildInputs =
      (self.nativeDeps."next-tick" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "next-tick" ];
  };
  by-spec."node-uuid"."~1.4.0" =
    self.by-version."node-uuid"."1.4.1";
  by-version."node-uuid"."1.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "node-uuid-1.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/node-uuid/-/node-uuid-1.4.1.tgz";
        name = "node-uuid-1.4.1.tgz";
        sha1 = "39aef510e5889a3dca9c895b506c73aae1bac048";
      })
    ];
    buildInputs =
      (self.nativeDeps."node-uuid" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "node-uuid" ];
  };
  by-spec."nopt"."~1.0.10" =
    self.by-version."nopt"."1.0.10";
  by-version."nopt"."1.0.10" = lib.makeOverridable self.buildNodePackage {
    name = "nopt-1.0.10";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/nopt/-/nopt-1.0.10.tgz";
        name = "nopt-1.0.10.tgz";
        sha1 = "6ddd21bd2a31417b92727dd585f8a6f37608ebee";
      })
    ];
    buildInputs =
      (self.nativeDeps."nopt" or []);
    deps = {
      "abbrev-1.0.5" = self.by-version."abbrev"."1.0.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "nopt" ];
  };
  by-spec."nopt"."~2.2.0" =
    self.by-version."nopt"."2.2.1";
  by-version."nopt"."2.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "nopt-2.2.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/nopt/-/nopt-2.2.1.tgz";
        name = "nopt-2.2.1.tgz";
        sha1 = "2aa09b7d1768487b3b89a9c5aa52335bff0baea7";
      })
    ];
    buildInputs =
      (self.nativeDeps."nopt" or []);
    deps = {
      "abbrev-1.0.5" = self.by-version."abbrev"."1.0.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "nopt" ];
  };
  by-spec."nopt"."~3.0.0" =
    self.by-version."nopt"."3.0.1";
  by-version."nopt"."3.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "nopt-3.0.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/nopt/-/nopt-3.0.1.tgz";
        name = "nopt-3.0.1.tgz";
        sha1 = "bce5c42446a3291f47622a370abbf158fbbacbfd";
      })
    ];
    buildInputs =
      (self.nativeDeps."nopt" or []);
    deps = {
      "abbrev-1.0.5" = self.by-version."abbrev"."1.0.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "nopt" ];
  };
  by-spec."nopt"."~3.0.1" =
    self.by-version."nopt"."3.0.1";
  by-spec."npmconf"."^2.0.1" =
    self.by-version."npmconf"."2.0.9";
  by-version."npmconf"."2.0.9" = lib.makeOverridable self.buildNodePackage {
    name = "npmconf-2.0.9";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/npmconf/-/npmconf-2.0.9.tgz";
        name = "npmconf-2.0.9.tgz";
        sha1 = "5c87e5fb308104eceeca781e3d9115d216351ef2";
      })
    ];
    buildInputs =
      (self.nativeDeps."npmconf" or []);
    deps = {
      "config-chain-1.1.8" = self.by-version."config-chain"."1.1.8";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "ini-1.2.1" = self.by-version."ini"."1.2.1";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "nopt-3.0.1" = self.by-version."nopt"."3.0.1";
      "once-1.3.0" = self.by-version."once"."1.3.0";
      "osenv-0.1.0" = self.by-version."osenv"."0.1.0";
      "semver-4.0.0" = self.by-version."semver"."4.0.0";
      "uid-number-0.0.5" = self.by-version."uid-number"."0.0.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "npmconf" ];
  };
  by-spec."oauth-sign"."~0.3.0" =
    self.by-version."oauth-sign"."0.3.0";
  by-version."oauth-sign"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "oauth-sign-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/oauth-sign/-/oauth-sign-0.3.0.tgz";
        name = "oauth-sign-0.3.0.tgz";
        sha1 = "cb540f93bb2b22a7d5941691a288d60e8ea9386e";
      })
    ];
    buildInputs =
      (self.nativeDeps."oauth-sign" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "oauth-sign" ];
  };
  by-spec."oauth-sign"."~0.4.0" =
    self.by-version."oauth-sign"."0.4.0";
  by-version."oauth-sign"."0.4.0" = lib.makeOverridable self.buildNodePackage {
    name = "oauth-sign-0.4.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/oauth-sign/-/oauth-sign-0.4.0.tgz";
        name = "oauth-sign-0.4.0.tgz";
        sha1 = "f22956f31ea7151a821e5f2fb32c113cad8b9f69";
      })
    ];
    buildInputs =
      (self.nativeDeps."oauth-sign" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "oauth-sign" ];
  };
  by-spec."object-assign"."^0.3.0" =
    self.by-version."object-assign"."0.3.1";
  by-version."object-assign"."0.3.1" = lib.makeOverridable self.buildNodePackage {
    name = "object-assign-0.3.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/object-assign/-/object-assign-0.3.1.tgz";
        name = "object-assign-0.3.1.tgz";
        sha1 = "060e2a2a27d7c0d77ec77b78f11aa47fd88008d2";
      })
    ];
    buildInputs =
      (self.nativeDeps."object-assign" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "object-assign" ];
  };
  by-spec."object-assign"."^1.0.0" =
    self.by-version."object-assign"."1.0.0";
  by-version."object-assign"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "object-assign-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/object-assign/-/object-assign-1.0.0.tgz";
        name = "object-assign-1.0.0.tgz";
        sha1 = "e65dc8766d3b47b4b8307465c8311da030b070a6";
      })
    ];
    buildInputs =
      (self.nativeDeps."object-assign" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "object-assign" ];
  };
  by-spec."object-assign"."~0.3.1" =
    self.by-version."object-assign"."0.3.1";
  by-spec."once"."^1.3.0" =
    self.by-version."once"."1.3.0";
  by-version."once"."1.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "once-1.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/once/-/once-1.3.0.tgz";
        name = "once-1.3.0.tgz";
        sha1 = "151af86bfc1f08c4b9f07d06ab250ffcbeb56581";
      })
    ];
    buildInputs =
      (self.nativeDeps."once" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "once" ];
  };
  by-spec."once"."~1.3.0" =
    self.by-version."once"."1.3.0";
  by-spec."opn"."~0.1.1" =
    self.by-version."opn"."0.1.2";
  by-version."opn"."0.1.2" = lib.makeOverridable self.buildNodePackage {
    name = "opn-0.1.2";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/opn/-/opn-0.1.2.tgz";
        name = "opn-0.1.2.tgz";
        sha1 = "c527832cfd964d52096b524d0035ecaece51db4f";
      })
    ];
    buildInputs =
      (self.nativeDeps."opn" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "opn" ];
  };
  by-spec."optimist"."~0.3" =
    self.by-version."optimist"."0.3.7";
  by-version."optimist"."0.3.7" = lib.makeOverridable self.buildNodePackage {
    name = "optimist-0.3.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/optimist/-/optimist-0.3.7.tgz";
        name = "optimist-0.3.7.tgz";
        sha1 = "c90941ad59e4273328923074d2cf2e7cbc6ec0d9";
      })
    ];
    buildInputs =
      (self.nativeDeps."optimist" or []);
    deps = {
      "wordwrap-0.0.2" = self.by-version."wordwrap"."0.0.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "optimist" ];
  };
  by-spec."optimist"."~0.3.5" =
    self.by-version."optimist"."0.3.7";
  by-spec."optimist"."~0.6.0" =
    self.by-version."optimist"."0.6.1";
  by-version."optimist"."0.6.1" = lib.makeOverridable self.buildNodePackage {
    name = "optimist-0.6.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/optimist/-/optimist-0.6.1.tgz";
        name = "optimist-0.6.1.tgz";
        sha1 = "da3ea74686fa21a19a111c326e90eb15a0196686";
      })
    ];
    buildInputs =
      (self.nativeDeps."optimist" or []);
    deps = {
      "wordwrap-0.0.2" = self.by-version."wordwrap"."0.0.2";
      "minimist-0.0.10" = self.by-version."minimist"."0.0.10";
    };
    peerDependencies = [
    ];
    passthru.names = [ "optimist" ];
  };
  by-spec."orchestrator"."^0.3.0" =
    self.by-version."orchestrator"."0.3.7";
  by-version."orchestrator"."0.3.7" = lib.makeOverridable self.buildNodePackage {
    name = "orchestrator-0.3.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/orchestrator/-/orchestrator-0.3.7.tgz";
        name = "orchestrator-0.3.7.tgz";
        sha1 = "c45064e22c5a2a7b99734f409a95ffedc7d3c3df";
      })
    ];
    buildInputs =
      (self.nativeDeps."orchestrator" or []);
    deps = {
      "end-of-stream-0.1.5" = self.by-version."end-of-stream"."0.1.5";
      "sequencify-0.0.7" = self.by-version."sequencify"."0.0.7";
      "stream-consume-0.1.0" = self.by-version."stream-consume"."0.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "orchestrator" ];
  };
  by-spec."ordered-read-streams"."0.0.8" =
    self.by-version."ordered-read-streams"."0.0.8";
  by-version."ordered-read-streams"."0.0.8" = lib.makeOverridable self.buildNodePackage {
    name = "ordered-read-streams-0.0.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ordered-read-streams/-/ordered-read-streams-0.0.8.tgz";
        name = "ordered-read-streams-0.0.8.tgz";
        sha1 = "fd921331b1a130b66aeef711b219aee01d89e0c5";
      })
    ];
    buildInputs =
      (self.nativeDeps."ordered-read-streams" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ordered-read-streams" ];
  };
  by-spec."os-name"."^1.0.0" =
    self.by-version."os-name"."1.0.0";
  by-version."os-name"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "os-name-1.0.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/os-name/-/os-name-1.0.0.tgz";
        name = "os-name-1.0.0.tgz";
        sha1 = "f0b2790d05f32c729f8e5168859484ab2cd32bab";
      })
    ];
    buildInputs =
      (self.nativeDeps."os-name" or []);
    deps = {
      "minimist-1.1.0" = self.by-version."minimist"."1.1.0";
      "osx-release-1.0.0" = self.by-version."osx-release"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "os-name" ];
  };
  by-spec."osenv"."0.0.3" =
    self.by-version."osenv"."0.0.3";
  by-version."osenv"."0.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "osenv-0.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/osenv/-/osenv-0.0.3.tgz";
        name = "osenv-0.0.3.tgz";
        sha1 = "cd6ad8ddb290915ad9e22765576025d411f29cb6";
      })
    ];
    buildInputs =
      (self.nativeDeps."osenv" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "osenv" ];
  };
  by-spec."osenv"."^0.1.0" =
    self.by-version."osenv"."0.1.0";
  by-version."osenv"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "osenv-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/osenv/-/osenv-0.1.0.tgz";
        name = "osenv-0.1.0.tgz";
        sha1 = "61668121eec584955030b9f470b1d2309504bfcb";
      })
    ];
    buildInputs =
      (self.nativeDeps."osenv" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "osenv" ];
  };
  by-spec."osenv"."~0.1.0" =
    self.by-version."osenv"."0.1.0";
  by-spec."osx-release"."^1.0.0" =
    self.by-version."osx-release"."1.0.0";
  by-version."osx-release"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "osx-release-1.0.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/osx-release/-/osx-release-1.0.0.tgz";
        name = "osx-release-1.0.0.tgz";
        sha1 = "02bee80f3b898aaa88922d2f86e178605974beac";
      })
    ];
    buildInputs =
      (self.nativeDeps."osx-release" or []);
    deps = {
      "minimist-1.1.0" = self.by-version."minimist"."1.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "osx-release" ];
  };
  by-spec."p-throttler"."0.0.1" =
    self.by-version."p-throttler"."0.0.1";
  by-version."p-throttler"."0.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "p-throttler-0.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/p-throttler/-/p-throttler-0.0.1.tgz";
        name = "p-throttler-0.0.1.tgz";
        sha1 = "c341e3589ec843852a035e6f88e6c1e96150029b";
      })
    ];
    buildInputs =
      (self.nativeDeps."p-throttler" or []);
    deps = {
      "q-0.9.7" = self.by-version."q"."0.9.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "p-throttler" ];
  };
  by-spec."package-json"."^1.0.0" =
    self.by-version."package-json"."1.0.0";
  by-version."package-json"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "package-json-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/package-json/-/package-json-1.0.0.tgz";
        name = "package-json-1.0.0.tgz";
        sha1 = "71ccbbef319c8a7451321b61484d96fc5a1cb9aa";
      })
    ];
    buildInputs =
      (self.nativeDeps."package-json" or []);
    deps = {
      "got-1.2.0" = self.by-version."got"."1.2.0";
      "registry-url-1.0.0" = self.by-version."registry-url"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "package-json" ];
  };
  by-spec."pretty-hrtime"."^0.2.0" =
    self.by-version."pretty-hrtime"."0.2.1";
  by-version."pretty-hrtime"."0.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "pretty-hrtime-0.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/pretty-hrtime/-/pretty-hrtime-0.2.1.tgz";
        name = "pretty-hrtime-0.2.1.tgz";
        sha1 = "f341d39215fa5f7bff50af7d8572f8d4ec9d12f6";
      })
    ];
    buildInputs =
      (self.nativeDeps."pretty-hrtime" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "pretty-hrtime" ];
  };
  by-spec."promptly"."~0.2.0" =
    self.by-version."promptly"."0.2.0";
  by-version."promptly"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "promptly-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/promptly/-/promptly-0.2.0.tgz";
        name = "promptly-0.2.0.tgz";
        sha1 = "73ef200fa8329d5d3a8df41798950b8646ca46d9";
      })
    ];
    buildInputs =
      (self.nativeDeps."promptly" or []);
    deps = {
      "read-1.0.5" = self.by-version."read"."1.0.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "promptly" ];
  };
  by-spec."proto-list"."~1.2.1" =
    self.by-version."proto-list"."1.2.3";
  by-version."proto-list"."1.2.3" = lib.makeOverridable self.buildNodePackage {
    name = "proto-list-1.2.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/proto-list/-/proto-list-1.2.3.tgz";
        name = "proto-list-1.2.3.tgz";
        sha1 = "6235554a1bca1f0d15e3ca12ca7329d5def42bd9";
      })
    ];
    buildInputs =
      (self.nativeDeps."proto-list" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "proto-list" ];
  };
  by-spec."punycode".">=0.2.0" =
    self.by-version."punycode"."1.3.1";
  by-version."punycode"."1.3.1" = lib.makeOverridable self.buildNodePackage {
    name = "punycode-1.3.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/punycode/-/punycode-1.3.1.tgz";
        name = "punycode-1.3.1.tgz";
        sha1 = "710afe5123c20a1530b712e3e682b9118fe8058e";
      })
    ];
    buildInputs =
      (self.nativeDeps."punycode" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "punycode" ];
  };
  by-spec."q"."~0.9.2" =
    self.by-version."q"."0.9.7";
  by-version."q"."0.9.7" = lib.makeOverridable self.buildNodePackage {
    name = "q-0.9.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/q/-/q-0.9.7.tgz";
        name = "q-0.9.7.tgz";
        sha1 = "4de2e6cb3b29088c9e4cbc03bf9d42fb96ce2f75";
      })
    ];
    buildInputs =
      (self.nativeDeps."q" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "q" ];
  };
  by-spec."q"."~1.0.0" =
    self.by-version."q"."1.0.1";
  by-version."q"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "q-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/q/-/q-1.0.1.tgz";
        name = "q-1.0.1.tgz";
        sha1 = "11872aeedee89268110b10a718448ffb10112a14";
      })
    ];
    buildInputs =
      (self.nativeDeps."q" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "q" ];
  };
  by-spec."q"."~1.0.1" =
    self.by-version."q"."1.0.1";
  by-spec."qs"."~0.6.0" =
    self.by-version."qs"."0.6.6";
  by-version."qs"."0.6.6" = lib.makeOverridable self.buildNodePackage {
    name = "qs-0.6.6";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/qs/-/qs-0.6.6.tgz";
        name = "qs-0.6.6.tgz";
        sha1 = "6e015098ff51968b8a3c819001d5f2c89bc4b107";
      })
    ];
    buildInputs =
      (self.nativeDeps."qs" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "qs" ];
  };
  by-spec."qs"."~1.2.0" =
    self.by-version."qs"."1.2.2";
  by-version."qs"."1.2.2" = lib.makeOverridable self.buildNodePackage {
    name = "qs-1.2.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/qs/-/qs-1.2.2.tgz";
        name = "qs-1.2.2.tgz";
        sha1 = "19b57ff24dc2a99ce1f8bdf6afcda59f8ef61f88";
      })
    ];
    buildInputs =
      (self.nativeDeps."qs" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "qs" ];
  };
  by-spec."read"."~1.0.4" =
    self.by-version."read"."1.0.5";
  by-version."read"."1.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "read-1.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/read/-/read-1.0.5.tgz";
        name = "read-1.0.5.tgz";
        sha1 = "007a3d169478aa710a491727e453effb92e76203";
      })
    ];
    buildInputs =
      (self.nativeDeps."read" or []);
    deps = {
      "mute-stream-0.0.4" = self.by-version."mute-stream"."0.0.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "read" ];
  };
  by-spec."readable-stream".">=1.0.27-1 <1.1.0-0" =
    self.by-version."readable-stream"."1.0.31";
  by-version."readable-stream"."1.0.31" = lib.makeOverridable self.buildNodePackage {
    name = "readable-stream-1.0.31";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/readable-stream/-/readable-stream-1.0.31.tgz";
        name = "readable-stream-1.0.31.tgz";
        sha1 = "8f2502e0bc9e3b0da1b94520aabb4e2603ecafae";
      })
    ];
    buildInputs =
      (self.nativeDeps."readable-stream" or []);
    deps = {
      "core-util-is-1.0.1" = self.by-version."core-util-is"."1.0.1";
      "isarray-0.0.1" = self.by-version."isarray"."0.0.1";
      "string_decoder-0.10.31" = self.by-version."string_decoder"."0.10.31";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "readable-stream" ];
  };
  by-spec."readable-stream"."~1.0.17" =
    self.by-version."readable-stream"."1.0.31";
  by-spec."readable-stream"."~1.0.26" =
    self.by-version."readable-stream"."1.0.31";
  by-spec."readable-stream"."~1.1.8" =
    self.by-version."readable-stream"."1.1.13";
  by-version."readable-stream"."1.1.13" = lib.makeOverridable self.buildNodePackage {
    name = "readable-stream-1.1.13";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/readable-stream/-/readable-stream-1.1.13.tgz";
        name = "readable-stream-1.1.13.tgz";
        sha1 = "f6eef764f514c89e2b9e23146a75ba106756d23e";
      })
    ];
    buildInputs =
      (self.nativeDeps."readable-stream" or []);
    deps = {
      "core-util-is-1.0.1" = self.by-version."core-util-is"."1.0.1";
      "isarray-0.0.1" = self.by-version."isarray"."0.0.1";
      "string_decoder-0.10.31" = self.by-version."string_decoder"."0.10.31";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "readable-stream" ];
  };
  by-spec."readable-stream"."~1.1.9" =
    self.by-version."readable-stream"."1.1.13";
  by-spec."readline2"."~0.1.0" =
    self.by-version."readline2"."0.1.0";
  by-version."readline2"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "readline2-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/readline2/-/readline2-0.1.0.tgz";
        name = "readline2-0.1.0.tgz";
        sha1 = "6a272ef89731225b448e4c6799b6e50d5be12b98";
      })
    ];
    buildInputs =
      (self.nativeDeps."readline2" or []);
    deps = {
      "mute-stream-0.0.4" = self.by-version."mute-stream"."0.0.4";
      "lodash-2.4.1" = self.by-version."lodash"."2.4.1";
      "chalk-0.4.0" = self.by-version."chalk"."0.4.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "readline2" ];
  };
  by-spec."redeyed"."~0.4.0" =
    self.by-version."redeyed"."0.4.4";
  by-version."redeyed"."0.4.4" = lib.makeOverridable self.buildNodePackage {
    name = "redeyed-0.4.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/redeyed/-/redeyed-0.4.4.tgz";
        name = "redeyed-0.4.4.tgz";
        sha1 = "37e990a6f2b21b2a11c2e6a48fd4135698cba97f";
      })
    ];
    buildInputs =
      (self.nativeDeps."redeyed" or []);
    deps = {
      "esprima-1.0.4" = self.by-version."esprima"."1.0.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "redeyed" ];
  };
  by-spec."registry-url"."^1.0.0" =
    self.by-version."registry-url"."1.0.0";
  by-version."registry-url"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "registry-url-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/registry-url/-/registry-url-1.0.0.tgz";
        name = "registry-url-1.0.0.tgz";
        sha1 = "453fc586d4b4e7a8a11faef29745633db309565a";
      })
    ];
    buildInputs =
      (self.nativeDeps."registry-url" or []);
    deps = {
      "npmconf-2.0.9" = self.by-version."npmconf"."2.0.9";
    };
    peerDependencies = [
    ];
    passthru.names = [ "registry-url" ];
  };
  by-spec."request"."^2.40.0" =
    self.by-version."request"."2.42.0";
  by-version."request"."2.42.0" = lib.makeOverridable self.buildNodePackage {
    name = "request-2.42.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/request/-/request-2.42.0.tgz";
        name = "request-2.42.0.tgz";
        sha1 = "572bd0148938564040ac7ab148b96423a063304a";
      })
    ];
    buildInputs =
      (self.nativeDeps."request" or []);
    deps = {
      "bl-0.9.3" = self.by-version."bl"."0.9.3";
      "caseless-0.6.0" = self.by-version."caseless"."0.6.0";
      "forever-agent-0.5.2" = self.by-version."forever-agent"."0.5.2";
      "qs-1.2.2" = self.by-version."qs"."1.2.2";
      "json-stringify-safe-5.0.0" = self.by-version."json-stringify-safe"."5.0.0";
      "mime-types-1.0.2" = self.by-version."mime-types"."1.0.2";
      "node-uuid-1.4.1" = self.by-version."node-uuid"."1.4.1";
      "tunnel-agent-0.4.0" = self.by-version."tunnel-agent"."0.4.0";
      "tough-cookie-0.12.1" = self.by-version."tough-cookie"."0.12.1";
      "form-data-0.1.4" = self.by-version."form-data"."0.1.4";
      "http-signature-0.10.0" = self.by-version."http-signature"."0.10.0";
      "oauth-sign-0.4.0" = self.by-version."oauth-sign"."0.4.0";
      "hawk-1.1.1" = self.by-version."hawk"."1.1.1";
      "aws-sign2-0.5.0" = self.by-version."aws-sign2"."0.5.0";
      "stringstream-0.0.4" = self.by-version."stringstream"."0.0.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "request" ];
  };
  by-spec."request"."~2.27.0" =
    self.by-version."request"."2.27.0";
  by-version."request"."2.27.0" = lib.makeOverridable self.buildNodePackage {
    name = "request-2.27.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/request/-/request-2.27.0.tgz";
        name = "request-2.27.0.tgz";
        sha1 = "dfb1a224dd3a5a9bade4337012503d710e538668";
      })
    ];
    buildInputs =
      (self.nativeDeps."request" or []);
    deps = {
      "qs-0.6.6" = self.by-version."qs"."0.6.6";
      "json-stringify-safe-5.0.0" = self.by-version."json-stringify-safe"."5.0.0";
      "forever-agent-0.5.2" = self.by-version."forever-agent"."0.5.2";
      "tunnel-agent-0.3.0" = self.by-version."tunnel-agent"."0.3.0";
      "http-signature-0.10.0" = self.by-version."http-signature"."0.10.0";
      "hawk-1.0.0" = self.by-version."hawk"."1.0.0";
      "aws-sign-0.3.0" = self.by-version."aws-sign"."0.3.0";
      "oauth-sign-0.3.0" = self.by-version."oauth-sign"."0.3.0";
      "cookie-jar-0.3.0" = self.by-version."cookie-jar"."0.3.0";
      "node-uuid-1.4.1" = self.by-version."node-uuid"."1.4.1";
      "mime-1.2.11" = self.by-version."mime"."1.2.11";
      "form-data-0.1.4" = self.by-version."form-data"."0.1.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "request" ];
  };
  by-spec."request"."~2.36.0" =
    self.by-version."request"."2.36.0";
  by-version."request"."2.36.0" = lib.makeOverridable self.buildNodePackage {
    name = "request-2.36.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/request/-/request-2.36.0.tgz";
        name = "request-2.36.0.tgz";
        sha1 = "28c6c04262c7b9ffdd21b9255374517ee6d943f5";
      })
    ];
    buildInputs =
      (self.nativeDeps."request" or []);
    deps = {
      "qs-0.6.6" = self.by-version."qs"."0.6.6";
      "json-stringify-safe-5.0.0" = self.by-version."json-stringify-safe"."5.0.0";
      "mime-1.2.11" = self.by-version."mime"."1.2.11";
      "forever-agent-0.5.2" = self.by-version."forever-agent"."0.5.2";
      "node-uuid-1.4.1" = self.by-version."node-uuid"."1.4.1";
      "tough-cookie-0.12.1" = self.by-version."tough-cookie"."0.12.1";
      "form-data-0.1.4" = self.by-version."form-data"."0.1.4";
      "tunnel-agent-0.4.0" = self.by-version."tunnel-agent"."0.4.0";
      "http-signature-0.10.0" = self.by-version."http-signature"."0.10.0";
      "oauth-sign-0.3.0" = self.by-version."oauth-sign"."0.3.0";
      "hawk-1.0.0" = self.by-version."hawk"."1.0.0";
      "aws-sign2-0.5.0" = self.by-version."aws-sign2"."0.5.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "request" ];
  };
  by-spec."request-progress"."~0.3.0" =
    self.by-version."request-progress"."0.3.1";
  by-version."request-progress"."0.3.1" = lib.makeOverridable self.buildNodePackage {
    name = "request-progress-0.3.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/request-progress/-/request-progress-0.3.1.tgz";
        name = "request-progress-0.3.1.tgz";
        sha1 = "0721c105d8a96ac6b2ce8b2c89ae2d5ecfcf6b3a";
      })
    ];
    buildInputs =
      (self.nativeDeps."request-progress" or []);
    deps = {
      "throttleit-0.0.2" = self.by-version."throttleit"."0.0.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "request-progress" ];
  };
  by-spec."request-replay"."~0.2.0" =
    self.by-version."request-replay"."0.2.0";
  by-version."request-replay"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "request-replay-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/request-replay/-/request-replay-0.2.0.tgz";
        name = "request-replay-0.2.0.tgz";
        sha1 = "9b693a5d118b39f5c596ead5ed91a26444057f60";
      })
    ];
    buildInputs =
      (self.nativeDeps."request-replay" or []);
    deps = {
      "retry-0.6.1" = self.by-version."retry"."0.6.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "request-replay" ];
  };
  by-spec."resolve"."~0.7.0" =
    self.by-version."resolve"."0.7.4";
  by-version."resolve"."0.7.4" = lib.makeOverridable self.buildNodePackage {
    name = "resolve-0.7.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/resolve/-/resolve-0.7.4.tgz";
        name = "resolve-0.7.4.tgz";
        sha1 = "395a9ef9e873fbfe12bd14408bd91bb936003d69";
      })
    ];
    buildInputs =
      (self.nativeDeps."resolve" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "resolve" ];
  };
  by-spec."retry"."~0.6.0" =
    self.by-version."retry"."0.6.1";
  by-version."retry"."0.6.1" = lib.makeOverridable self.buildNodePackage {
    name = "retry-0.6.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/retry/-/retry-0.6.1.tgz";
        name = "retry-0.6.1.tgz";
        sha1 = "fdc90eed943fde11b893554b8cc63d0e899ba918";
      })
    ];
    buildInputs =
      (self.nativeDeps."retry" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "retry" ];
  };
  by-spec."rimraf"."2" =
    self.by-version."rimraf"."2.2.8";
  by-version."rimraf"."2.2.8" = lib.makeOverridable self.buildNodePackage {
    name = "rimraf-2.2.8";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/rimraf/-/rimraf-2.2.8.tgz";
        name = "rimraf-2.2.8.tgz";
        sha1 = "e439be2aaee327321952730f99a8929e4fc50582";
      })
    ];
    buildInputs =
      (self.nativeDeps."rimraf" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "rimraf" ];
  };
  by-spec."rimraf"."~2.2.0" =
    self.by-version."rimraf"."2.2.8";
  by-spec."rx"."^2.2.27" =
    self.by-version."rx"."2.3.9";
  by-version."rx"."2.3.9" = lib.makeOverridable self.buildNodePackage {
    name = "rx-2.3.9";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/rx/-/rx-2.3.9.tgz";
        name = "rx-2.3.9.tgz";
        sha1 = "f6eb959a4262935f7334aecd9234c21b8151c784";
      })
    ];
    buildInputs =
      (self.nativeDeps."rx" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "rx" ];
  };
  by-spec."semver"."2 || 3 || 4" =
    self.by-version."semver"."4.0.0";
  by-version."semver"."4.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "semver-4.0.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/semver/-/semver-4.0.0.tgz";
        name = "semver-4.0.0.tgz";
        sha1 = "7be868416a5e669923a8e3af8bafa5faf62a151a";
      })
    ];
    buildInputs =
      (self.nativeDeps."semver" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "semver" ];
  };
  by-spec."semver"."^3.0.1" =
    self.by-version."semver"."3.0.1";
  by-version."semver"."3.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "semver-3.0.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/semver/-/semver-3.0.1.tgz";
        name = "semver-3.0.1.tgz";
        sha1 = "720ac012515a252f91fb0dd2e99a56a70d6cf078";
      })
    ];
    buildInputs =
      (self.nativeDeps."semver" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "semver" ];
  };
  by-spec."semver"."~2.3.0" =
    self.by-version."semver"."2.3.2";
  by-version."semver"."2.3.2" = lib.makeOverridable self.buildNodePackage {
    name = "semver-2.3.2";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/semver/-/semver-2.3.2.tgz";
        name = "semver-2.3.2.tgz";
        sha1 = "b9848f25d6cf36333073ec9ef8856d42f1233e52";
      })
    ];
    buildInputs =
      (self.nativeDeps."semver" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "semver" ];
  };
  by-spec."semver-diff"."^1.0.0" =
    self.by-version."semver-diff"."1.0.0";
  by-version."semver-diff"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "semver-diff-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/semver-diff/-/semver-diff-1.0.0.tgz";
        name = "semver-diff-1.0.0.tgz";
        sha1 = "efa952393625b56d21ba146661dff68e90552b25";
      })
    ];
    buildInputs =
      (self.nativeDeps."semver-diff" or []);
    deps = {
      "semver-3.0.1" = self.by-version."semver"."3.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "semver-diff" ];
  };
  by-spec."sequencify"."~0.0.7" =
    self.by-version."sequencify"."0.0.7";
  by-version."sequencify"."0.0.7" = lib.makeOverridable self.buildNodePackage {
    name = "sequencify-0.0.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/sequencify/-/sequencify-0.0.7.tgz";
        name = "sequencify-0.0.7.tgz";
        sha1 = "90cff19d02e07027fd767f5ead3e7b95d1e7380c";
      })
    ];
    buildInputs =
      (self.nativeDeps."sequencify" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "sequencify" ];
  };
  by-spec."shell-quote"."~1.4.1" =
    self.by-version."shell-quote"."1.4.2";
  by-version."shell-quote"."1.4.2" = lib.makeOverridable self.buildNodePackage {
    name = "shell-quote-1.4.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/shell-quote/-/shell-quote-1.4.2.tgz";
        name = "shell-quote-1.4.2.tgz";
        sha1 = "f132a54f2030d69280d370d4974155f85f62f67b";
      })
    ];
    buildInputs =
      (self.nativeDeps."shell-quote" or []);
    deps = {
      "jsonify-0.0.0" = self.by-version."jsonify"."0.0.0";
      "array-filter-0.0.1" = self.by-version."array-filter"."0.0.1";
      "array-reduce-0.0.0" = self.by-version."array-reduce"."0.0.0";
      "array-map-0.0.0" = self.by-version."array-map"."0.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "shell-quote" ];
  };
  by-spec."sigmund"."~1.0.0" =
    self.by-version."sigmund"."1.0.0";
  by-version."sigmund"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "sigmund-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/sigmund/-/sigmund-1.0.0.tgz";
        name = "sigmund-1.0.0.tgz";
        sha1 = "66a2b3a749ae8b5fb89efd4fcc01dc94fbe02296";
      })
    ];
    buildInputs =
      (self.nativeDeps."sigmund" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "sigmund" ];
  };
  by-spec."sntp"."0.2.x" =
    self.by-version."sntp"."0.2.4";
  by-version."sntp"."0.2.4" = lib.makeOverridable self.buildNodePackage {
    name = "sntp-0.2.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/sntp/-/sntp-0.2.4.tgz";
        name = "sntp-0.2.4.tgz";
        sha1 = "fb885f18b0f3aad189f824862536bceeec750900";
      })
    ];
    buildInputs =
      (self.nativeDeps."sntp" or []);
    deps = {
      "hoek-0.9.1" = self.by-version."hoek"."0.9.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "sntp" ];
  };
  by-spec."source-map"."^0.1.33" =
    self.by-version."source-map"."0.1.39";
  by-version."source-map"."0.1.39" = lib.makeOverridable self.buildNodePackage {
    name = "source-map-0.1.39";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/source-map/-/source-map-0.1.39.tgz";
        name = "source-map-0.1.39.tgz";
        sha1 = "64ad329c4761ab956ff7d011c6b205aeb66a2d4a";
      })
    ];
    buildInputs =
      (self.nativeDeps."source-map" or []);
    deps = {
      "amdefine-0.1.0" = self.by-version."amdefine"."0.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "source-map" ];
  };
  by-spec."source-map"."^0.1.34" =
    self.by-version."source-map"."0.1.39";
  by-spec."source-map"."~0.1.7" =
    self.by-version."source-map"."0.1.39";
  by-spec."stream-consume"."~0.1.0" =
    self.by-version."stream-consume"."0.1.0";
  by-version."stream-consume"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "stream-consume-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/stream-consume/-/stream-consume-0.1.0.tgz";
        name = "stream-consume-0.1.0.tgz";
        sha1 = "a41ead1a6d6081ceb79f65b061901b6d8f3d1d0f";
      })
    ];
    buildInputs =
      (self.nativeDeps."stream-consume" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "stream-consume" ];
  };
  by-spec."string-length"."^1.0.0" =
    self.by-version."string-length"."1.0.0";
  by-version."string-length"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "string-length-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/string-length/-/string-length-1.0.0.tgz";
        name = "string-length-1.0.0.tgz";
        sha1 = "5f0564b174feb299595a763da71513266370d3a9";
      })
    ];
    buildInputs =
      (self.nativeDeps."string-length" or []);
    deps = {
      "strip-ansi-2.0.0" = self.by-version."strip-ansi"."2.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "string-length" ];
  };
  by-spec."string_decoder"."~0.10.x" =
    self.by-version."string_decoder"."0.10.31";
  by-version."string_decoder"."0.10.31" = lib.makeOverridable self.buildNodePackage {
    name = "string_decoder-0.10.31";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz";
        name = "string_decoder-0.10.31.tgz";
        sha1 = "62e203bc41766c6c28c9fc84301dab1c5310fa94";
      })
    ];
    buildInputs =
      (self.nativeDeps."string_decoder" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "string_decoder" ];
  };
  by-spec."stringify-object"."~0.2.0" =
    self.by-version."stringify-object"."0.2.1";
  by-version."stringify-object"."0.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "stringify-object-0.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/stringify-object/-/stringify-object-0.2.1.tgz";
        name = "stringify-object-0.2.1.tgz";
        sha1 = "b58be50b3ff5f371038c545d4332656bfded5620";
      })
    ];
    buildInputs =
      (self.nativeDeps."stringify-object" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "stringify-object" ];
  };
  by-spec."stringstream"."~0.0.4" =
    self.by-version."stringstream"."0.0.4";
  by-version."stringstream"."0.0.4" = lib.makeOverridable self.buildNodePackage {
    name = "stringstream-0.0.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/stringstream/-/stringstream-0.0.4.tgz";
        name = "stringstream-0.0.4.tgz";
        sha1 = "0f0e3423f942960b5692ac324a57dd093bc41a92";
      })
    ];
    buildInputs =
      (self.nativeDeps."stringstream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "stringstream" ];
  };
  by-spec."strip-ansi"."^0.3.0" =
    self.by-version."strip-ansi"."0.3.0";
  by-version."strip-ansi"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "strip-ansi-0.3.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/strip-ansi/-/strip-ansi-0.3.0.tgz";
        name = "strip-ansi-0.3.0.tgz";
        sha1 = "25f48ea22ca79187f3174a4db8759347bb126220";
      })
    ];
    buildInputs =
      (self.nativeDeps."strip-ansi" or []);
    deps = {
      "ansi-regex-0.2.1" = self.by-version."ansi-regex"."0.2.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "strip-ansi" ];
  };
  by-spec."strip-ansi"."^2.0.0" =
    self.by-version."strip-ansi"."2.0.0";
  by-version."strip-ansi"."2.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "strip-ansi-2.0.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/strip-ansi/-/strip-ansi-2.0.0.tgz";
        name = "strip-ansi-2.0.0.tgz";
        sha1 = "fa8d69432e97674746f55f51d076ae78b18df13f";
      })
    ];
    buildInputs =
      (self.nativeDeps."strip-ansi" or []);
    deps = {
      "ansi-regex-1.1.0" = self.by-version."ansi-regex"."1.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "strip-ansi" ];
  };
  by-spec."strip-ansi"."~0.1.0" =
    self.by-version."strip-ansi"."0.1.1";
  by-version."strip-ansi"."0.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "strip-ansi-0.1.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/strip-ansi/-/strip-ansi-0.1.1.tgz";
        name = "strip-ansi-0.1.1.tgz";
        sha1 = "39e8a98d044d150660abe4a6808acf70bb7bc991";
      })
    ];
    buildInputs =
      (self.nativeDeps."strip-ansi" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "strip-ansi" ];
  };
  by-spec."strip-bom"."^1.0.0" =
    self.by-version."strip-bom"."1.0.0";
  by-version."strip-bom"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "strip-bom-1.0.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/strip-bom/-/strip-bom-1.0.0.tgz";
        name = "strip-bom-1.0.0.tgz";
        sha1 = "85b8862f3844b5a6d5ec8467a93598173a36f794";
      })
    ];
    buildInputs =
      (self.nativeDeps."strip-bom" or []);
    deps = {
      "first-chunk-stream-1.0.0" = self.by-version."first-chunk-stream"."1.0.0";
      "is-utf8-0.2.0" = self.by-version."is-utf8"."0.2.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "strip-bom" ];
  };
  by-spec."supports-color"."^0.2.0" =
    self.by-version."supports-color"."0.2.0";
  by-version."supports-color"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "supports-color-0.2.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/supports-color/-/supports-color-0.2.0.tgz";
        name = "supports-color-0.2.0.tgz";
        sha1 = "d92de2694eb3f67323973d7ae3d8b55b4c22190a";
      })
    ];
    buildInputs =
      (self.nativeDeps."supports-color" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "supports-color" ];
  };
  by-spec."tar"."~0.1.17" =
    self.by-version."tar"."0.1.20";
  by-version."tar"."0.1.20" = lib.makeOverridable self.buildNodePackage {
    name = "tar-0.1.20";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tar/-/tar-0.1.20.tgz";
        name = "tar-0.1.20.tgz";
        sha1 = "42940bae5b5f22c74483699126f9f3f27449cb13";
      })
    ];
    buildInputs =
      (self.nativeDeps."tar" or []);
    deps = {
      "block-stream-0.0.7" = self.by-version."block-stream"."0.0.7";
      "fstream-0.1.31" = self.by-version."fstream"."0.1.31";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "tar" ];
  };
  by-spec."throttleit"."~0.0.2" =
    self.by-version."throttleit"."0.0.2";
  by-version."throttleit"."0.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "throttleit-0.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/throttleit/-/throttleit-0.0.2.tgz";
        name = "throttleit-0.0.2.tgz";
        sha1 = "cfedf88e60c00dd9697b61fdd2a8343a9b680eaf";
      })
    ];
    buildInputs =
      (self.nativeDeps."throttleit" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "throttleit" ];
  };
  by-spec."through"."^2.3.4" =
    self.by-version."through"."2.3.4";
  by-version."through"."2.3.4" = lib.makeOverridable self.buildNodePackage {
    name = "through-2.3.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/through/-/through-2.3.4.tgz";
        name = "through-2.3.4.tgz";
        sha1 = "495e40e8d8a8eaebc7c275ea88c2b8fc14c56455";
      })
    ];
    buildInputs =
      (self.nativeDeps."through" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "through" ];
  };
  by-spec."through"."~2.3.4" =
    self.by-version."through"."2.3.4";
  by-spec."through2"."^0.5.0" =
    self.by-version."through2"."0.5.1";
  by-version."through2"."0.5.1" = lib.makeOverridable self.buildNodePackage {
    name = "through2-0.5.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/through2/-/through2-0.5.1.tgz";
        name = "through2-0.5.1.tgz";
        sha1 = "dfdd012eb9c700e2323fd334f38ac622ab372da7";
      })
    ];
    buildInputs =
      (self.nativeDeps."through2" or []);
    deps = {
      "readable-stream-1.0.31" = self.by-version."readable-stream"."1.0.31";
      "xtend-3.0.0" = self.by-version."xtend"."3.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "through2" ];
  };
  by-spec."through2"."^0.6.1" =
    self.by-version."through2"."0.6.1";
  by-version."through2"."0.6.1" = lib.makeOverridable self.buildNodePackage {
    name = "through2-0.6.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/through2/-/through2-0.6.1.tgz";
        name = "through2-0.6.1.tgz";
        sha1 = "f742b32893e8bd26146e789e4fd2ccb2c07a717e";
      })
    ];
    buildInputs =
      (self.nativeDeps."through2" or []);
    deps = {
      "readable-stream-1.0.31" = self.by-version."readable-stream"."1.0.31";
      "xtend-4.0.0" = self.by-version."xtend"."4.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "through2" ];
  };
  by-spec."tildify"."^1.0.0" =
    self.by-version."tildify"."1.0.0";
  by-version."tildify"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "tildify-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tildify/-/tildify-1.0.0.tgz";
        name = "tildify-1.0.0.tgz";
        sha1 = "2a021db5e8fbde0a8f8b4df37adaa8fb1d39d7dd";
      })
    ];
    buildInputs =
      (self.nativeDeps."tildify" or []);
    deps = {
      "user-home-1.0.0" = self.by-version."user-home"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "tildify" ];
  };
  by-spec."timers-ext"."0.1.x" =
    self.by-version."timers-ext"."0.1.0";
  by-version."timers-ext"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "timers-ext-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/timers-ext/-/timers-ext-0.1.0.tgz";
        name = "timers-ext-0.1.0.tgz";
        sha1 = "00345a2ca93089d1251322054389d263e27b77e2";
      })
    ];
    buildInputs =
      (self.nativeDeps."timers-ext" or []);
    deps = {
      "es5-ext-0.10.4" = self.by-version."es5-ext"."0.10.4";
      "next-tick-0.2.2" = self.by-version."next-tick"."0.2.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "timers-ext" ];
  };
  by-spec."tmp"."0.0.23" =
    self.by-version."tmp"."0.0.23";
  by-version."tmp"."0.0.23" = lib.makeOverridable self.buildNodePackage {
    name = "tmp-0.0.23";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tmp/-/tmp-0.0.23.tgz";
        name = "tmp-0.0.23.tgz";
        sha1 = "de874aa5e974a85f0a32cdfdbd74663cb3bd9c74";
      })
    ];
    buildInputs =
      (self.nativeDeps."tmp" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "tmp" ];
  };
  by-spec."touch"."0.0.2" =
    self.by-version."touch"."0.0.2";
  by-version."touch"."0.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "touch-0.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/touch/-/touch-0.0.2.tgz";
        name = "touch-0.0.2.tgz";
        sha1 = "a65a777795e5cbbe1299499bdc42281ffb21b5f4";
      })
    ];
    buildInputs =
      (self.nativeDeps."touch" or []);
    deps = {
      "nopt-1.0.10" = self.by-version."nopt"."1.0.10";
    };
    peerDependencies = [
    ];
    passthru.names = [ "touch" ];
  };
  by-spec."tough-cookie".">=0.12.0" =
    self.by-version."tough-cookie"."0.12.1";
  by-version."tough-cookie"."0.12.1" = lib.makeOverridable self.buildNodePackage {
    name = "tough-cookie-0.12.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tough-cookie/-/tough-cookie-0.12.1.tgz";
        name = "tough-cookie-0.12.1.tgz";
        sha1 = "8220c7e21abd5b13d96804254bd5a81ebf2c7d62";
      })
    ];
    buildInputs =
      (self.nativeDeps."tough-cookie" or []);
    deps = {
      "punycode-1.3.1" = self.by-version."punycode"."1.3.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "tough-cookie" ];
  };
  by-spec."tough-cookie"."^0.12.1" =
    self.by-version."tough-cookie"."0.12.1";
  by-spec."traverse".">=0.3.0 <0.4" =
    self.by-version."traverse"."0.3.9";
  by-version."traverse"."0.3.9" = lib.makeOverridable self.buildNodePackage {
    name = "traverse-0.3.9";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/traverse/-/traverse-0.3.9.tgz";
        name = "traverse-0.3.9.tgz";
        sha1 = "717b8f220cc0bb7b44e40514c22b2e8bbc70d8b9";
      })
    ];
    buildInputs =
      (self.nativeDeps."traverse" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "traverse" ];
  };
  by-spec."tunnel-agent"."~0.3.0" =
    self.by-version."tunnel-agent"."0.3.0";
  by-version."tunnel-agent"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "tunnel-agent-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.3.0.tgz";
        name = "tunnel-agent-0.3.0.tgz";
        sha1 = "ad681b68f5321ad2827c4cfb1b7d5df2cfe942ee";
      })
    ];
    buildInputs =
      (self.nativeDeps."tunnel-agent" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "tunnel-agent" ];
  };
  by-spec."tunnel-agent"."~0.4.0" =
    self.by-version."tunnel-agent"."0.4.0";
  by-version."tunnel-agent"."0.4.0" = lib.makeOverridable self.buildNodePackage {
    name = "tunnel-agent-0.4.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.4.0.tgz";
        name = "tunnel-agent-0.4.0.tgz";
        sha1 = "b1184e312ffbcf70b3b4c78e8c219de7ebb1c550";
      })
    ];
    buildInputs =
      (self.nativeDeps."tunnel-agent" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "tunnel-agent" ];
  };
  by-spec."uglify-js"."~2.3" =
    self.by-version."uglify-js"."2.3.6";
  by-version."uglify-js"."2.3.6" = lib.makeOverridable self.buildNodePackage {
    name = "uglify-js-2.3.6";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/uglify-js/-/uglify-js-2.3.6.tgz";
        name = "uglify-js-2.3.6.tgz";
        sha1 = "fa0984770b428b7a9b2a8058f46355d14fef211a";
      })
    ];
    buildInputs =
      (self.nativeDeps."uglify-js" or []);
    deps = {
      "async-0.2.10" = self.by-version."async"."0.2.10";
      "source-map-0.1.39" = self.by-version."source-map"."0.1.39";
      "optimist-0.3.7" = self.by-version."optimist"."0.3.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "uglify-js" ];
  };
  by-spec."uid-number"."0.0.5" =
    self.by-version."uid-number"."0.0.5";
  by-version."uid-number"."0.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "uid-number-0.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/uid-number/-/uid-number-0.0.5.tgz";
        name = "uid-number-0.0.5.tgz";
        sha1 = "5a3db23ef5dbd55b81fce0ec9a2ac6fccdebb81e";
      })
    ];
    buildInputs =
      (self.nativeDeps."uid-number" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "uid-number" ];
  };
  by-spec."underscore"."~1.4.3" =
    self.by-version."underscore"."1.4.4";
  by-version."underscore"."1.4.4" = lib.makeOverridable self.buildNodePackage {
    name = "underscore-1.4.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/underscore/-/underscore-1.4.4.tgz";
        name = "underscore-1.4.4.tgz";
        sha1 = "61a6a32010622afa07963bf325203cf12239d604";
      })
    ];
    buildInputs =
      (self.nativeDeps."underscore" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "underscore" ];
  };
  by-spec."underscore.string"."~2.3.1" =
    self.by-version."underscore.string"."2.3.3";
  by-version."underscore.string"."2.3.3" = lib.makeOverridable self.buildNodePackage {
    name = "underscore.string-2.3.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/underscore.string/-/underscore.string-2.3.3.tgz";
        name = "underscore.string-2.3.3.tgz";
        sha1 = "71c08bf6b428b1133f37e78fa3a21c82f7329b0d";
      })
    ];
    buildInputs =
      (self.nativeDeps."underscore.string" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "underscore.string" ];
  };
  by-spec."unique-stream"."^1.0.0" =
    self.by-version."unique-stream"."1.0.0";
  by-version."unique-stream"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "unique-stream-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/unique-stream/-/unique-stream-1.0.0.tgz";
        name = "unique-stream-1.0.0.tgz";
        sha1 = "d59a4a75427447d9aa6c91e70263f8d26a4b104b";
      })
    ];
    buildInputs =
      (self.nativeDeps."unique-stream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "unique-stream" ];
  };
  by-spec."update-notifier"."~0.2.0" =
    self.by-version."update-notifier"."0.2.1";
  by-version."update-notifier"."0.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "update-notifier-0.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/update-notifier/-/update-notifier-0.2.1.tgz";
        name = "update-notifier-0.2.1.tgz";
        sha1 = "72dabbd3e506a09c39d8a90f4807295166c1d424";
      })
    ];
    buildInputs =
      (self.nativeDeps."update-notifier" or []);
    deps = {
      "chalk-0.5.1" = self.by-version."chalk"."0.5.1";
      "configstore-0.3.1" = self.by-version."configstore"."0.3.1";
      "latest-version-1.0.0" = self.by-version."latest-version"."1.0.0";
      "semver-diff-1.0.0" = self.by-version."semver-diff"."1.0.0";
      "string-length-1.0.0" = self.by-version."string-length"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "update-notifier" ];
  };
  by-spec."user-home"."^1.0.0" =
    self.by-version."user-home"."1.0.0";
  by-version."user-home"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "user-home-1.0.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/user-home/-/user-home-1.0.0.tgz";
        name = "user-home-1.0.0.tgz";
        sha1 = "54ecb631e0fa420e9b0a6b946b158d137825b38b";
      })
    ];
    buildInputs =
      (self.nativeDeps."user-home" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "user-home" ];
  };
  by-spec."uuid"."~1.4.1" =
    self.by-version."uuid"."1.4.1";
  by-version."uuid"."1.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "uuid-1.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/uuid/-/uuid-1.4.1.tgz";
        name = "uuid-1.4.1.tgz";
        sha1 = "a337828580d426e375b8ee11bd2bf901a596e0b8";
      })
    ];
    buildInputs =
      (self.nativeDeps."uuid" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "uuid" ];
  };
  by-spec."vinyl"."^0.2.1" =
    self.by-version."vinyl"."0.2.3";
  by-version."vinyl"."0.2.3" = lib.makeOverridable self.buildNodePackage {
    name = "vinyl-0.2.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/vinyl/-/vinyl-0.2.3.tgz";
        name = "vinyl-0.2.3.tgz";
        sha1 = "bca938209582ec5a49ad538a00fa1f125e513252";
      })
    ];
    buildInputs =
      (self.nativeDeps."vinyl" or []);
    deps = {
      "clone-stats-0.0.1" = self.by-version."clone-stats"."0.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "vinyl" ];
  };
  by-spec."vinyl"."^0.4.0" =
    self.by-version."vinyl"."0.4.3";
  by-version."vinyl"."0.4.3" = lib.makeOverridable self.buildNodePackage {
    name = "vinyl-0.4.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/vinyl/-/vinyl-0.4.3.tgz";
        name = "vinyl-0.4.3.tgz";
        sha1 = "19f61a1b28e72b4c50697889dbe91d7503943ecf";
      })
    ];
    buildInputs =
      (self.nativeDeps."vinyl" or []);
    deps = {
      "clone-stats-0.0.1" = self.by-version."clone-stats"."0.0.1";
      "lodash-2.4.1" = self.by-version."lodash"."2.4.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "vinyl" ];
  };
  by-spec."vinyl"."^0.4.2" =
    self.by-version."vinyl"."0.4.3";
  by-spec."vinyl-fs"."^0.3.0" =
    self.by-version."vinyl-fs"."0.3.7";
  by-version."vinyl-fs"."0.3.7" = lib.makeOverridable self.buildNodePackage {
    name = "vinyl-fs-0.3.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/vinyl-fs/-/vinyl-fs-0.3.7.tgz";
        name = "vinyl-fs-0.3.7.tgz";
        sha1 = "2e25cfe6df5c80818f97ff417bf5c21a41e4a49b";
      })
    ];
    buildInputs =
      (self.nativeDeps."vinyl-fs" or []);
    deps = {
      "glob-stream-3.1.15" = self.by-version."glob-stream"."3.1.15";
      "glob-watcher-0.0.6" = self.by-version."glob-watcher"."0.0.6";
      "graceful-fs-3.0.2" = self.by-version."graceful-fs"."3.0.2";
      "lodash-2.4.1" = self.by-version."lodash"."2.4.1";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "strip-bom-1.0.0" = self.by-version."strip-bom"."1.0.0";
      "through2-0.6.1" = self.by-version."through2"."0.6.1";
      "vinyl-0.4.3" = self.by-version."vinyl"."0.4.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "vinyl-fs" ];
  };
  by-spec."vinyl-sourcemaps-apply"."~0.1.1" =
    self.by-version."vinyl-sourcemaps-apply"."0.1.1";
  by-version."vinyl-sourcemaps-apply"."0.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "vinyl-sourcemaps-apply-0.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/vinyl-sourcemaps-apply/-/vinyl-sourcemaps-apply-0.1.1.tgz";
        name = "vinyl-sourcemaps-apply-0.1.1.tgz";
        sha1 = "6435c8d216386466c000ead01065939eb4a83254";
      })
    ];
    buildInputs =
      (self.nativeDeps."vinyl-sourcemaps-apply" or []);
    deps = {
      "source-map-0.1.39" = self.by-version."source-map"."0.1.39";
    };
    peerDependencies = [
    ];
    passthru.names = [ "vinyl-sourcemaps-apply" ];
  };
  by-spec."which"."~1.0.5" =
    self.by-version."which"."1.0.5";
  by-version."which"."1.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "which-1.0.5";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/which/-/which-1.0.5.tgz";
        name = "which-1.0.5.tgz";
        sha1 = "5630d6819dda692f1464462e7956cb42c0842739";
      })
    ];
    buildInputs =
      (self.nativeDeps."which" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "which" ];
  };
  by-spec."wordwrap"."~0.0.2" =
    self.by-version."wordwrap"."0.0.2";
  by-version."wordwrap"."0.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "wordwrap-0.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/wordwrap/-/wordwrap-0.0.2.tgz";
        name = "wordwrap-0.0.2.tgz";
        sha1 = "b79669bb42ecb409f83d583cad52ca17eaa1643f";
      })
    ];
    buildInputs =
      (self.nativeDeps."wordwrap" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "wordwrap" ];
  };
  by-spec."xtend".">=4.0.0 <4.1.0-0" =
    self.by-version."xtend"."4.0.0";
  by-version."xtend"."4.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "xtend-4.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/xtend/-/xtend-4.0.0.tgz";
        name = "xtend-4.0.0.tgz";
        sha1 = "8bc36ff87aedbe7ce9eaf0bca36b2354a743840f";
      })
    ];
    buildInputs =
      (self.nativeDeps."xtend" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "xtend" ];
  };
  by-spec."xtend"."~3.0.0" =
    self.by-version."xtend"."3.0.0";
  by-version."xtend"."3.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "xtend-3.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/xtend/-/xtend-3.0.0.tgz";
        name = "xtend-3.0.0.tgz";
        sha1 = "5cce7407baf642cba7becda568111c493f59665a";
      })
    ];
    buildInputs =
      (self.nativeDeps."xtend" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "xtend" ];
  };
}
