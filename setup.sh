#!/bin/bash
# ============================================
# LODE Media Website - One-Time Setup Script
# Run this once to get everything installed
# ============================================

echo ""
echo "🎬 LODE Media Website Setup"
echo "==========================="
echo ""

# Check for macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "⚠️  This script is designed for macOS. For Windows/Linux, ask Claude for help."
  exit 1
fi

# Step 1: Xcode Command Line Tools (includes Git)
echo "📦 Step 1/3: Checking for Git..."
if ! command -v git &> /dev/null; then
  echo "   Installing Xcode Command Line Tools (includes Git)..."
  echo "   👉 A popup will appear — click 'Install' and wait for it to finish."
  xcode-select --install
  echo ""
  echo "   ⏳ Once the install popup finishes, run this script again."
  exit 0
else
  echo "   ✅ Git is installed"
fi

# Step 2: Node.js
echo "📦 Step 2/3: Checking for Node.js..."
if ! command -v node &> /dev/null; then
  echo "   Node.js not found. Installing via Homebrew..."

  if ! command -v brew &> /dev/null; then
    echo "   Installing Homebrew first..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    fi
  fi

  brew install node
  echo "   ✅ Node.js installed"
else
  echo "   ✅ Node.js is installed ($(node --version))"
fi

# Step 3: Claude Code
echo "📦 Step 3/3: Checking for Claude Code..."
if ! command -v claude &> /dev/null; then
  echo "   Installing Claude Code..."
  npm install -g @anthropic-ai/claude-code
  echo "   ✅ Claude Code installed"
else
  echo "   ✅ Claude Code is installed"
fi

echo ""
echo "================================================"
echo "✅ All tools installed! Now run these commands:"
echo ""
echo "   cd lode-media-website"
echo "   claude"
echo ""
echo "Then just tell Claude what you want to change!"
echo "================================================"
echo ""
