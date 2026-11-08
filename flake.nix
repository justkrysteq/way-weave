{
	description = "Smalltalk Development Shell";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
	};

	outputs = { nixpkgs, ... }:
	let
		system = "x86_64-linux";

		pkgs = nixpkgs.legacyPackages.${system};
	in
	{
		devShells.${system}.default = pkgs.mkShell {
			packages = with pkgs; [
				gnu-smalltalk

				(writeShellScriptBin "a" "command gst main.st")
			];
		};
	};
}
