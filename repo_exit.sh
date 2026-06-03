#!/bin/bash

clone_if_not_exists() {
  local REPO_URL=$1 # Accepts the GitHub repo URL

  # Validate input
  if [ -z "$REPO_URL" ]; then
    echo "❌ Error: Repository URL not provided."
    echo "Usage: clone_if_not_exists <repo_url>"
    return 1
  fi

  # Extract folder name from repo URL (e.g., repo.git → repo)
  local FOLDER_NAME=$(basename "$REPO_URL" .git)

  # Check if the folder exists already
  if [ -d "$FOLDER_NAME" ]; then
    echo "📁 The folder '$FOLDER_NAME' already exists. Skipping clone."
  else
    echo "🔄 Cloning '$REPO_URL' into '$FOLDER_NAME'..."
    git clone "$REPO_URL" || {
      echo "❌ Failed to clone repository."
      return 1
    }
    echo "✅ Clone completed."
  fi
}

# -----------------------------------
# Main Script Execution
# -----------------------------------

# Prompt the user for the repository URL
read -p "Enter the GitHub repository URL to clone: " USER_INPUT

# Call the function using the user's input
clone_if_not_exists "$USER_INPUT"