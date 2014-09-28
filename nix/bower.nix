{ fetchbower, fetchgit, lib }:
let paths = [
  (fetchbower "objectpath" "1.0.5" "*" "1ar6xsmd9q2h2b6sa65fy60v3c224h8mris9zwgkx4z2kvykh4sp")
  (fetchbower "tipsy" "0.1.7" "*" "01kvfmmq75s6dwpr0f1i0i41lpj2vf9sqf4c4xmm6kaw53jdxiij")
  (fetchbower "holderjs" "2.4.0" "*" "1czia5rv2943qracb5wwjq4zcrd51yf36nrll3mjyfff4g6wknra")
  (fetchbower "selectize" "0.11.2" "*" "086h53yzrabaph9jlhjp98bh2vlzllwyxqyklljy0jd4scnj08n8")
  (fetchbower "angular-sanitize" "1.2.25" "*" "0z5w5d0s3qzv1ph0ay1grn9950myx0akaddirjbgh6s3avkx7zbw")
  (fetchbower "angular" "1.2.25" "*" "01sxhvjir2n1zgwl1fv42w0ymj6yfx293ji1apzrj1z543sbx5hs")
  (fetchbower "tv4" "1.0.17" "*" "0fd97m6i4ax8a76mlbcf4kradkbnk0g3pkw94kym7vw4fp5mn5l4")
  (fetchbower "jquery" "2.1.1" "*" "15ds8rgvnqkzndp9q06sbsgm6ql3gwj3vn173n3dv8b22ldxaicv")
  (fetchbower "bootstrap" "3.2.0" "*" "0ikay6d0nxzy018lb5a99flhfjdljcff4n0ibplg1m0j2piw269z")
];
  angular_schema = fetchgit {
    url = "https://github.com/joelteon/angular-schema-form.git";
    rev = "refs/heads/master";
    sha256 = "0k2v2n9acfyf0j3mqx7k427fyd4yav1ra68alndbrckakzds29zx";
  };
in
{
  link = ''
    mkdir -p bower_components
    ${lib.concatStringsSep "\n"
      (builtins.map (p: "ln -sv ${p}/packages/*/* bower_components/${(builtins.parseDrvName p.name).name}")
        paths)
     }
    ln -sv ${angular_schema} bower_components/angular-schema-form
  '';
}
