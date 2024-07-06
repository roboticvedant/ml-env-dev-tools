# utils/scripts/export-conda-env.sh
#!/bin/bash

# Function to export Conda environment without prefix
export_conda_env() {
    local env_name=$1
    local yaml_file=$2

    # Export the environment
    conda env export --name "$env_name" > "$yaml_file"

    # Remove the prefix line
    sed -i '/^prefix: /d' "$yaml_file"

    echo "Environment exported to $yaml_file without prefix."
}

# Check if script is being sourced or executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Please source this script rather than executing it directly."
fi
