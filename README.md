# 📄 Shell Script Error Handling for Folder and Repository Setup

By **nasirbloch323**

## 📌 Industry Scenario
In DevOps and cloud deployment pipelines, automation scripts are often used to set up environments, clone repositories, and organize project directories. However, rerunning scripts without proper error handling can cause failures or duplicate setups if folders or repositories already exist.

## 🎯 Objective
Create reusable Bash functions to:
1. Safely create a folder only if it doesn't already exist.
2. Clone a GitHub repository only if the local folder doesn't already exist.

This ensures **idempotent behavior** — allowing scripts to be run multiple times safely without overwriting or duplicating resources.

---

## 🛠️ Bash Script Implementation

### 1️⃣ Function: `create_folder_if_not_exists`
This function checks whether a given folder exists and creates it only if it's missing.

```bash
#!/bin/bash

create_folder_if_not_exists() {
  local FOLDER=$1 # Accepts the folder name as argument

  # Check if the argument is empty
  if [ -z "$FOLDER" ]; then
    echo "❌ Error: No folder name provided."
    echo "Usage: create_folder_if_not_exists <folder_name>"
    exit 1
  fi

  # Check if the folder already exists
  if [ -d "$FOLDER" ]; then
    echo "❌ Folder '$FOLDER' already exists."
  else
    mkdir "$FOLDER" # Create the folder
    echo "✅ Folder '$FOLDER' created."
  fi
}

# ✅ Example usage
create_folder_if_not_exists my-app-folder
