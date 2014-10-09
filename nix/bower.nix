{ fetchbower, fetchgit, lib }:
let paths = [
  (fetchbower "angular" "1.2.26" "*" "0psbq9vbb4zg5fjdb1spnq41mlackxx5jw3aibwxkai166al67v1")
  (fetchbower "angular-sanitize" "1.2.26" "*" "0hx6nbh5jxyg2zjc8sq7ifcr7nh8pg9762nziffhsvz9597gfibh")
  (fetchbower "bootstrap" "3.2.0" "*" "0ikay6d0nxzy018lb5a99flhfjdljcff4n0ibplg1m0j2piw269z")
  (fetchbower "holderjs" "2.4.0" "*" "1czia5rv2943qracb5wwjq4zcrd51yf36nrll3mjyfff4g6wknra")
  (fetchbower "jquery" "2.1.1" "*" "15ds8rgvnqkzndp9q06sbsgm6ql3gwj3vn173n3dv8b22ldxaicv")
  (fetchbower "objectpath" "1.0.5" "*" "1ar6xsmd9q2h2b6sa65fy60v3c224h8mris9zwgkx4z2kvykh4sp")
  (fetchbower "selectize" "0.11.2" "*" "086h53yzrabaph9jlhjp98bh2vlzllwyxqyklljy0jd4scnj08n8")
  (fetchbower "tipsy" "0.1.7" "*" "01kvfmmq75s6dwpr0f1i0i41lpj2vf9sqf4c4xmm6kaw53jdxiij")
  (fetchbower "tv4" "1.1.4" "*" "023mr2bbyxkqda80ymcgngkks3ssq5nj9rvppq61zdrv2az3na1g")
];
  angular_schema = fetchgit {
    url = "https://github.com/joelteon/angular-schema-form.git";
    rev = "refs/heads/master";
    sha256 = "0k2v2n9acfyf0j3mqx7k427fyd4yav1ra68alndbrckakzds29zx";
  };
in
{
  link = ''
    if ! test -d bower_components; then
      mkdir -p bower_components
      ${lib.concatStringsSep "\n"
        (builtins.map (p: "ln -sv ${p}/packages/*/* bower_components/${p.pname}")
          paths)
       }
      ln -sv ${angular_schema} bower_components/angular-schema-form
    fi
  '';
}
