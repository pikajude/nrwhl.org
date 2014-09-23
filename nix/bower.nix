{ fetchbower, fetchgit, lib }:
let paths = [
  (fetchbower "objectpath" "1.0.5" "~1.0.5" "01jfkfv256swhdxixpxda98ywwph7c575d7w2577qhkjy6x4bddn")
  (fetchbower "tipsy" "0.1.7" "~0.1.7" "0s8swbssmhl1lhmlrhspbmxpc0cawxq3a77amwz243d2x557d2x5")
  (fetchbower "holderjs" "2.4.0" "~2.4.0" "1al6v2d0amcaryc4yfblirbfqr095rw7i3dc7wg0sdi6lafwxqbr")
  (fetchbower "angular-sanitize" "1.2.25" "~1.2.24" "01iizq1aarq5ijf2i7561d91bwjynrxynfn2ajz98bl3l5i7c6sy")
  (fetchbower "selectize" "0.11.0" "~0.11.0" "1j4nscp5k489wwlh80x2ki04hbn4bhbz4nk0bzx4ypzrq0zv7vq1")
  (fetchbower "angular" "1.2.25" "~1.2.24" "0j946h6kxpp76g2m45b9w0aqb6vazssivd5fabcgpfqi1bs34ila")
  (fetchbower "jquery" "2.1.1" "~2.1.1" "1dzc5547hkwmkz22frrm3bsm2k1fj3rc4pwirghzgzb53bvmfp88")
  (fetchbower "tv4" "1.0.17" "~1.0.17" "1pz0iy69zr5chcrbgvmnicmixghbi9cvzj07mbk9jphf0lhcybc1")
  (fetchbower "bootstrap" "3.0.3" "~3.0.3" "02ybg950hw3j1byjqshl9wi7jcbwck3nxdl2y58jys0bcdq4jfkl")
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
