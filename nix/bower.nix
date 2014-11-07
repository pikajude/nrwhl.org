{ fetchbower, buildEnv }:
buildEnv { name = "bower-env"; ignoreCollisions = true; paths = [
  (fetchbower "objectpath" "1.0.5" "*" "1ar6xsmd9q2h2b6sa65fy60v3c224h8mris9zwgkx4z2kvykh4sp")
  (fetchbower "tipsy" "0.1.7" "*" "01kvfmmq75s6dwpr0f1i0i41lpj2vf9sqf4c4xmm6kaw53jdxiij")
  (fetchbower "holderjs" "2.4.1" "*" "023771kc1053fvyafzx8clmywyirjxsmy0zsj51gb4qd1qmyzy3s")
  (fetchbower "angular-sanitize" "1.3.1" "*" "1i3a6b5rjl5h3vvjq9wp0mg7cqjvzgq79i7k48vs4d4c24xggn0m")
  (fetchbower "selectize" "0.11.2" "*" "086h53yzrabaph9jlhjp98bh2vlzllwyxqyklljy0jd4scnj08n8")
  (fetchbower "angular-schema-form" "0.7.6" "*" "1fs7zcjyfy7xn96mskl5n1fq292mhf37yffapc9mfl7dhfk4qk89")
  (fetchbower "angular" "1.3.1" "*" "1g47kcvbp6ggl5r4mg75h4cgrc1x346b8sl2a3bhkq0fk47zxfr7")
  (fetchbower "tv4" "1.1.4" "*" "023mr2bbyxkqda80ymcgngkks3ssq5nj9rvppq61zdrv2az3na1g")
  (fetchbower "jquery" "2.1.1" "*" "15ds8rgvnqkzndp9q06sbsgm6ql3gwj3vn173n3dv8b22ldxaicv")
  (fetchbower "bootstrap" "3.3.0" "*" "1cxzg69bfv9z4j94cs2vfzdvfi6q5h7m47qblz8jmrjjrs5i5ig9")
]; }
