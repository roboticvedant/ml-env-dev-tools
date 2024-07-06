# utils/scripts/setup-conda-env.sh
#!/bin/bash

# Function to initialize Conda
initialize_conda() {
    if [ ! -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        echo "Conda not initialized. Running 'conda init'."
        conda init bash
        source "$HOME/.bashrc"
    else
        source "$HOME/anaconda3/etc/profile.d/conda.sh"
    fi
}

# Function to set up and activate the Conda environment
setup_conda_env() {
    local env_name=$1
    local yaml_file=$2

    # Initialize Conda
    initialize_conda

    # Check if the environment already exists
    if conda info --envs | grep -q "$env_name"; then
        echo "Environment $env_name already exists. Activating..."
        conda activate "$env_name"
    else
        echo "Creating new environment $env_name from $yaml_file..."
        conda env create -f "$yaml_file"
        conda activate "$env_name"
    fi
}

# Function to set up and activate the Conda environment from YAML without prompts
import_conda_env_from_yaml() {
    local yaml_file=$1

    # Extract environment name from YAML file
    local env_name=$(grep -E '^name: ' "$yaml_file" | awk '{print $2}')

    # Initialize Conda
    initialize_conda

    # Check if the environment already exists
    if conda info --envs | grep -q "$env_name"; then
        echo "Environment $env_name already exists. Activating..."
        conda activate "$env_name"
    else
        echo "Creating new environment from $yaml_file..."
        conda env create -f "$yaml_file"
        source "$HOME/anaconda3/etc/profile.d/conda.sh"
        conda activate "$env_name"
        echo "Environment created and activated from $yaml_file."
    fi
}

# Function to forcefully set up the Conda environment from YAML
force_conda_env_from_yaml() {
    local yaml_file=$1

    # Extract environment name from YAML file
    local env_name=$(grep -E '^name: ' "$yaml_file" | awk '{print $2}')

    # Initialize Conda
    initialize_conda

    # Check if the environment already exists and remove it if it does
    if conda info --envs | grep -q "$env_name"; then
        echo "Environment $env_name already exists. Forcing configuration..."
        conda env remove --name "$env_name"
    fi

    echo "Creating new environment from $yaml_file..."
    conda env create -f "$yaml_file"
    source "$HOME/anaconda3/etc/profile.d/conda.sh"
    conda activate "$env_name"
    echo "Environment created and activated from $yaml_file."
}

# Check if script is being sourced or executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Please source this script rather than executing it directly."
fi
