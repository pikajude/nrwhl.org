{ fetchbower, fetchgit, lib }:
let paths = [
  (fetchbower "objectpath" "1.0.5" "~1.0.5" "01jfkfv256swhdxixpxda98ywwph7c575d7w2577qhkjy6x4bddn")
  (fetchbower "tipsy" "0.1.7" "~0.1.7" "0s8swbssmhl1lhmlrhspbmxpc0cawxq3a77amwz243d2x557d2x5")
  (fetchbower "holderjs" "2.4.0" "~2.4.0" "1al6v2d0amcaryc4yfblirbfqr095rw7i3dc7wg0sdi6lafwxqbr")
  (fetchbower "angular-sanitize" "1.2.24" "~1.2.24" "00yh8yx96bsav2alk4wgkqmv1a9l2zdvs7vmxvzmp1zq4xskhr6j")
  (fetchbower "selectize" "0.11.0" "~0.11.0" "1j4nscp5k489wwlh80x2ki04hbn4bhbz4nk0bzx4ypzrq0zv7vq1")
  (fetchbower "angular" "1.2.24" "~1.2.24" "0vjnpnq3pqaci4dnfnp82yixscy51f3c3gs8n5wwianvab06pjzx")
  (fetchbower "tv4" "1.0.17" "~1.0.17" "1pz0iy69zr5chcrbgvmnicmixghbi9cvzj07mbk9jphf0lhcybc1")
  (fetchbower "jquery" "2.1.1" "~2.1.1" "1dzc5547hkwmkz22frrm3bsm2k1fj3rc4pwirghzgzb53bvmfp88")
  (fetchbower "bootstrap" "3.0.3" "~3.0.3" "02ybg950hw3j1byjqshl9wi7jcbwck3nxdl2y58jys0bcdq4jfkl")
];
  angular_schema = fetchgit {
    url = "https://github.com/joelteon/angular-schema-form.git";
    rev = "refs/heads/master";
    sha256 = "123g96zw8vdk5x66n771m23wzdg8frqn4q270wx4niq9dx1x8n57";
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
