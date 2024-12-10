{
    description = "Chat bot";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    outputs = {self, nixpkgs}:
    let pkgs = nixpkgs.legacyyPackages.x86_64-linux;
    in  {
        devShell.x86_64-linux = 
            pkgs.mkShell {
                buildInputs = with pkgs; [
                    python312
                    pythonPackages312.tensorflow
                    pythonPackages312.numpy
                    pythonPackages312.flask
                    pythonPackages312.nltk
                    gcc
                ];
            }
    };
}