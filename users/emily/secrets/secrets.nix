let
  emily = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIyE5TdOtjp7yIfgGSGQKL/cYFhcnrKz1bQnD9ZuTqRj emily@achird";
  users = [emily];
in {
  "sectest.age".publicKeys = users;
  "spotify.age".publicKeys = users;
}
