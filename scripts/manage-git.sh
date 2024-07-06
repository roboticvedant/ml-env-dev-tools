# utils/scripts/manage-git.sh
#!/bin/bash

# Function to handle git operations
manage_git() {
    local repo_dir=$1

    # Change to the repository directory
    cd "$repo_dir" || exit

    # Fetch and pull the latest changes
    git fetch
    git pull

    # Display all remote and local branches
    echo "Remote branches:"
    git branch -r
    echo "Local branches:"
    git branch

    # Ask the user to select a branch
    echo "Enter the branch you want to switch to (press Enter to stay on the current branch):"
    read -r branch

    # If the user presses Enter, stay on the current branch
    if [ -z "$branch" ]; then
        branch=$(git symbolic-ref --short HEAD)
        echo "Staying on the current branch: $branch"
    else
        git checkout "$branch"
    fi
}

# Check if script is being sourced or executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Please source this script rather than executing it directly."
fi
