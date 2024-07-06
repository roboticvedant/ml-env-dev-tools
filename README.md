# ML Environment Development Tools (ml-env-dev-tools)

This repository contains scripts to manage your Conda environments and Git operations effectively. These tools help you create, update, export, and force-update Conda environments from YAML files, as well as manage your Git branches and updates. This project aims to streamline development workflows for machine learning projects.

## Features

- Export Conda environment to a YAML file
- Import Conda environment from a YAML file
- Force update Conda environment from a YAML file
- Manage Git branches and updates

## Getting Started

### Prerequisites

- [Anaconda](https://www.anaconda.com/products/individual) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html) installed
- Git installed and configured

### Cloning the Repository and Initializing Submodules

1. **Clone the repository**:
   ```sh
   git clone https://github.com/roboticvedant/ml-env-dev-tools.git
   cd ml-env-dev-tools
   ```

2. **Add the `utils-scripts` as a submodule**:
   ```sh
   git submodule add https://github.com/roboticvedant/utils-scripts.git utils
   git submodule init
   git submodule update
   ```

### Directory Structure

```
your working dir
│
├── utils
|   └── scripts
│       └── move-to-working-dir
|             └── setup-env.sh 
│       ├── export-conda-env.sh
│       ├── setup-conda-env.sh
│       └── manage-git.sh
│
├── YOUR FILES
├── environment.yml
├── setup-env.sh
├── .gitmodules
└── README.md
```

### Usage Instructions

- **Copy `setup-env.sh` to your main working directory**:
   ```sh
   cp setup-env.sh /path/to/your/main/project/directory
   cd /path/to/your/main/project/directory
   ```

-  **Export Conda Environment**:
   - This script exports your Conda environment to a YAML file.
   - **Command**:
     ```sh
     ./setup-env.sh --export-env
     ```

- **Import Conda Environment**:
   - This script imports a Conda environment from a YAML file.
   - **Command**:
     ```sh
     ./setup-env.sh --import-env-yaml
     ```

- **Force Update Conda Environment**:
   - This script forcefully updates your Conda environment according to the YAML file.
   - **Command**:
     ```sh
     ./setup-env.sh --force-env-yaml
     ```

- **Manage Git Operations**:
   - This script fetches, pulls, and manages your Git branches.
   - **Command**:
     ```sh
     ./setup-env.sh
     ```

## Reporting Issues and Feature Requests

If you encounter any issues or have ideas for new features, please open an issue on the [GitHub Issues](https://github.com/roboticvedant/ml-env-dev-tools/issues) page.

## Collaboration

We welcome contributions to make this project better and richer. If you would like to contribute, please fork the repository and submit a pull request with your changes. We appreciate your collaboration in making these open-source development tools better for everyone.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Feel free to reach out for any questions or help. Let's build a better development environment together!

--- 
### Reporting Issues and Feature Requests

- Open an issue on the [GitHub Issues](https://github.com/roboticvedant/ml-env-dev-tools/issues) page.

### Collaboration

- Fork the repository, make your changes, and submit a pull request.

By following these instructions, users will be able to set up and use the tools effectively, report issues, and contribute to the project.
