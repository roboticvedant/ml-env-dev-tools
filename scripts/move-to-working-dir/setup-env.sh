# setup-env.sh
#!/bin/bash

# Define the path to the utility scripts
UTILS_DIR="utils/scripts"

# Source the utility scripts
source "$UTILS_DIR/export-conda-env.sh"
source "$UTILS_DIR/setup-conda-env.sh"
source "$UTILS_DIR/manage-git.sh"

# Function to parse command line arguments
parse_args() {
    export_env=false
    import_env_yaml=false
    force_env_yaml=false

    while [[ $# -gt 0 ]]; do
        case $1 in
            --export-env)
                export_env=true
                shift
                ;;
            --import-env-yaml)
                import_env_yaml=true
                shift
                ;;
            --force-env-yaml)
                force_env_yaml=true
                shift
                ;;
            *)
                echo "Unknown option: $1"
                exit 1
                ;;
        esac
    done
}

# Function to check if Conda is installed
check_conda_installed() {
    if ! command -v conda &> /dev/null; then
        echo "Conda is not installed. Proceeding with git operations only."
        return 1
    else
        return 0
    fi
}

# Function to list Conda environments and prompt user to select one
select_conda_env() {
    echo "Available Conda environments:"
    conda env list | grep -v "#" | awk '{print $1}' | tail -n +3
    echo "Enter the name of the environment you want to activate (press Enter to use the current environment):"
    read -r env_name

    # If the user presses Enter, use the current environment
    if [ -z "$env_name" ]; then
        env_name=$(conda info --envs | grep '*' | awk '{print $1}')
        echo "Using current environment: $env_name"
    fi
}

# Main script execution
main() {
    local yaml_file="environment.yml"  # Define your YAML file
    local repo_dir="$PWD"              # Default to current directory, or set to your repo path

    # Parse command line arguments
    parse_args "$@"

    # Check if Conda is installed
    if check_conda_installed; then
        if [ "$export_env" = true ]; then
            select_conda_env
            export_conda_env "$env_name" "$yaml_file"
            exit 0
        fi

        if [ "$import_env_yaml" = true ]; then
            import_conda_env_from_yaml "$yaml_file"
            exit 0
        fi

        if [ "$force_env_yaml" = true ]; then
            force_conda_env_from_yaml "$yaml_file"
            exit 0
        fi

        # If no specific flags, proceed with default behavior
        select_conda_env
        setup_conda_env "$env_name" "$yaml_file"
    fi

    # Manage git operations
    manage_git "$repo_dir"

    echo "Development environment is ready."
}

# Execute the main function
main "$@"
