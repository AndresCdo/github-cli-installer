# GitHub CLI Installer Script

This repository contains a Bash script (`install_gh.sh`) designed to automate the installation of the GitHub CLI (Command Line Interface) on Linux systems. The script also handles the authentication process with GitHub, making it easier to start using the GitHub CLI right away.

## Prerequisites

- A Linux distribution that uses `apt` for package management (e.g., Debian, Ubuntu).
- `curl` must be installed on your system to download the GitHub CLI package.
- Root access is required to install packages and add repository keys.

## Getting Started

To use the installation script, follow these steps:

1. **Clone the Repository**

   Clone this repository to your local machine using the following command:

   ```bash
   git clone https://github.com/AndresCdo/github-cli-installer.git
   ```

2. **Navigate to the Repository**

   Change your current directory to the cloned repository:

   ```bash
   cd github-cli-installer
   ```

3. **Run the Installation Script**

   Execute the installation script using the following command:

   ```bash
   bash install_gh.sh
   ```

   The script will guide you through the installation process and prompt you to authenticate with GitHub.

4. **Start Using the GitHub CLI**

   Once the installation is complete, you can start using the GitHub CLI by running the `gh` command in your terminal.

## How It Works

The installation script automates the process of installing the GitHub CLI on Linux systems. Here's an overview of how it works:

- The script first checks if it is being run with root privileges, as these are required for package installation.
- It then detects your system's architecture to download the correct version of the GitHub CLI.
The GitHub CLI .deb package is downloaded and installed.
- The official GitHub CLI repository is added to your system's package sources, allowing for easy updates in the future.
- Finally, the script initiates the GitHub authentication process, allowing you to log in to your GitHub account via the CLI.

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

## Acknowledgements

- [GitHub CLI](https://cli.github.com/) - Official GitHub CLI website.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
