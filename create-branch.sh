#!/bin/bash

# Configuration
REMOTE="origin"
BASE_BRANCH="main"

# 1. Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
    echo -e "\n❌ Error: You have uncommitted changes."
    while true; do
        read -p "Would you like to stash (s), commit (c), or abort (a)? " choice
        case $choice in
            s)
                git stash
                break
                ;;
            c)
                read -p "Enter commit message: " msg
                git add .
                git commit -m "$msg"
                break
                ;;
            a)
                exit 1
                ;;
            *)
                echo "❌ Please enter s/c/a."
                ;;
        esac
    done
fi

# 2. Verify Git is installed and configured
if ! command -v git &> /dev/null; then
    echo "❌ Error: Git is not installed or not in PATH"
    exit 1
fi

# 3. Get the branch name from the user
read -p "Enter the new branch name (e.g., feat/login-system): " BRANCH_NAME

if [ -z "$BRANCH_NAME" ]; then
    echo "❌ Error: Branch name cannot be empty."
    exit 1
fi

# 4. Verify internet connectivity before proceeding
echo "🔄 Checking internet connectivity..."
if ! ping -q -c1 google.com &> /dev/null; then
    echo "❌ Error: No internet connection detected"
    exit 1
fi

# 5. Update the local base branch
echo "🔄 Updating $BASE_BRANCH..."
git checkout "$BASE_BRANCH" || \
    (echo "❌ Failed to checkout $BASE_BRANCH"; exit 1)

git pull "$REMOTE" "$BASE_BRANCH" || \
    (echo "❌ Failed to update $BASE_BRANCH"; exit 1)

# 6. Create and push the new branch
echo -e "\n🚀 Creating branch '$BRANCH_NAME'..."
git checkout -b "$BRANCH_NAME" || \
    (echo "❌ Failed to create branch '$BRANCH_NAME'"; exit 1)

echo "📤 Pushing to $REMOTE..."
git push -u "$REMOTE" "$BRANCH_NAME" || \
    (echo "❌ Failed to push branch to remote"; exit 1)

# 7. Verify final state
if ! git branch --list "$BRANCH_NAME" &> /dev/null; then
    echo "❌ Error: Branch '$BRANCH_NAME' does not exist locally"
    exit 1
fi

if ! git ls-remote --heads "$REMOTE" "$BRANCH_NAME" &> /dev/null; then
    echo "❌ Error: Branch '$BRANCH_NAME' was not pushed successfully"
    exit 1
fi

# Success message with color formatting
echo -e "\n✅ \033[1mSuccess!\033[0m You are now on branch '$BRANCH_NAME'.\n"
echo -e "💡 Next steps:"
echo -e "- Start working on your new feature/fix"
echo -e "- Use 'git push' to sync changes"
echo -e "- When done, create a pull request from this branch\n"

# Optional: Open the branch in GitHub (requires hub CLI)
read -p "Would you like to open this branch in GitHub? (y/n) " open_github
if [ "$open_github" = "y" ]; then
    if command -v hub &> /dev/null; then
        hub browse -- "$BRANCH_NAME"
    else
        echo "💡 Install 'hub' CLI for better Git integration: https://github.com/github/hub"
    fi
fi
