# VSCode Extensions Settings Package

This package provides an automated way to set up Visual Studio Code with predefined extensions and settings according to the company's standards. It simplifies the onboarding process for new employees by ensuring consistent development environments.

## Getting Started

To use this package for setting up VSCode:

### Installation

1. Clone this repository or add it as a dependency in your project.
2. Run the following command to install the package and set up VSCode automatically:
```
npm install vscode_extensions_settings
```
  
The post-installation script included in package.json will handle the installation of recommended extensions listed in extensions/extensions.json and apply the predefined settings from settings/settings.json automatically.

## Package Structure

The package contains the following files and directories:

* extensions/: Includes the extensions.json file listing recommended VSCode extensions.
* settings/: Holds the settings.json file containing predefined VSCode settings.
* README.md: Instructions for using the package.
* package.json: Configuration file for the package.


## Contributing

Contributions are welcome! If you have suggestions or improvements for this package, feel free to open an issue or create a pull request.

## License

This project is licensed under MIT License, which means you're free to use, modify, and distribute this package.
