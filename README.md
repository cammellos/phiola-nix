# phiola-nix

A Nix flake to package [Phiola](https://github.com/stsaz/phiola), a fast audio player, recorder, and converter for Windows, Linux, and Android.

This repository provides a Nix-based setup to build and use Phiola, leveraging Nix flakes for a reproducible environment.

## Features

- Packages the latest version of Phiola (v2.2.5) for Linux.
- Provides a development shell with all dependencies required for building and running Phiola.

## Requirements

- [Nix](https://nixos.org/download.html) with flakes enabled. Follow the [Nix Flakes guide](https://nixos.wiki/wiki/Flakes) for instructions on enabling flakes.

## Usage

### Open a Development Shell

To open a development shell with all necessary dependencies:

```bash
nix develop
```

This will provide you with a shell environment where Phiola is available.

### Run Phiola

Once inside the development shell, you can run Phiola using the following command:

```bash
phiola
```

### Install Phiola

To install Phiola into your system or user profile, run:

```bash
nix profile install github:cammellos/phiola-nix
```

## Repository Structure

- **`flake.nix`**: Defines the Nix flake setup, including the devShell.
- **`default.nix`**: The Phiola derivation for building and installing the software.


## Learn More

- [Phiola on GitHub](https://github.com/stsaz/phiola)
- [Nix Flakes Documentation](https://nixos.wiki/wiki/Flakes)

## License

This repository is licensed under the MIT License. See [LICENSE](LICENSE) for details.
