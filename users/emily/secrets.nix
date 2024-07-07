{...}: {
  age.identityPaths = ["/home/emily/.ssh/agekey"];
  age.secretsDir = "/run/agenix";
  age.secrets = {
    spotify.file = ./secrets/spotify.age;
  };
}
