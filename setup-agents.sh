#!/bin/bash

# Claude Amplify Agents Setup Script
# Installs 24 specialized Claude Code subagents for AWS Amplify development
# Repository: https://github.com/NicholasCain570/claude-amplify-agents

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
REPO_URL="https://raw.githubusercontent.com/NicholasCain570/claude-amplify-agents/main"
TEMP_DIR="/tmp/claude-amplify-agents-$$"
PROJECT_AGENTS_DIR=".claude/agents"
USER_AGENTS_DIR="$HOME/.claude/agents"

# Agent files to download
AGENTS=(
    "amplify-auth.md"
    "amplify-cli.md"
    "amplify-devops.md"
    "amplify-frontend.md"
    "amplify-integration-tester.md"
    "amplify-schema.md"
    "amplify-storage.md"
    "auth-flow-tester.md"
    "aws-infrastructure.md"
    "chrome-extension-developer.md"
    "chrome-extension-tester.md"
    "code-reviewer.md"
    "context-manager.md"
    "deployment-manager.md"
    "dynamodb-expert.md"
    "graphql-client.md"
    "graphql-schema.md"
    "performance-tester.md"
    "playwright-tester.md"
    "react-developer.md"
    "security-auditor.md"
    "test-automation-orchestrator.md"
    "test-data-manager.md"
    "visual-tester.md"
)

# Helper functions
print_header() {
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║               Claude Amplify Agents Setup                   ║"
    echo "║          24 AI Subagents for AWS Amplify Development        ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_step() {
    echo -e "${BLUE}▶ $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

check_dependencies() {
    print_step "Checking dependencies..."
    
    # Check for curl or wget
    if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
        print_error "Either curl or wget is required to download agents"
        exit 1
    fi
    
    # Check for Claude Code (optional check)
    if command -v claude >/dev/null 2>&1; then
        print_success "Claude Code detected"
    else
        print_warning "Claude Code not found in PATH. Make sure it's installed."
    fi
}

download_file() {
    local url="$1"
    local output="$2"
    
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$url" -o "$output"
    elif command -v wget >/dev/null 2>&1; then
        wget -q "$url" -O "$output"
    else
        print_error "No download tool available"
        return 1
    fi
}

create_temp_dir() {
    print_step "Creating temporary directory..."
    mkdir -p "$TEMP_DIR"
    print_success "Temporary directory created: $TEMP_DIR"
}

download_agents() {
    print_step "Downloading agents from GitHub..."
    local downloaded=0
    local failed=0
    
    for agent in "${AGENTS[@]}"; do
        echo -n "  Downloading $agent... "
        if download_file "$REPO_URL/$agent" "$TEMP_DIR/$agent"; then
            echo -e "${GREEN}✓${NC}"
            ((downloaded++))
        else
            echo -e "${RED}✗${NC}"
            ((failed++))
        fi
    done
    
    if [ $failed -eq 0 ]; then
        print_success "All $downloaded agents downloaded successfully"
    else
        print_warning "$downloaded agents downloaded, $failed failed"
        if [ $downloaded -eq 0 ]; then
            print_error "No agents were downloaded. Check your internet connection."
            exit 1
        fi
    fi
}

install_agents() {
    local target_dir="$1"
    local context="$2"
    
    print_step "Installing agents to $context ($target_dir)..."
    
    # Create target directory
    mkdir -p "$target_dir"
    
    # Copy agents
    local installed=0
    for agent in "$TEMP_DIR"/*.md; do
        if [ -f "$agent" ]; then
            cp "$agent" "$target_dir/"
            ((installed++))
        fi
    done
    
    print_success "$installed agents installed to $target_dir"
}

cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
        print_step "Cleaned up temporary files"
    fi
}

show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -p, --project    Install to project level (.claude/agents/)"
    echo "  -u, --user       Install to user level (~/.claude/agents/)"
    echo "  -b, --both       Install to both levels"
    echo "  -h, --help       Show this help message"
    echo ""
    echo "If no option is specified, you'll be prompted to choose."
}

prompt_installation_type() {
    echo ""
    echo -e "${YELLOW}Choose installation type:${NC}"
    echo "1) Project level (.claude/agents/) - Recommended for team projects"
    echo "2) User level (~/.claude/agents/) - Available across all projects"
    echo "3) Both levels"
    echo "4) Cancel"
    echo ""
    
    while true; do
        read -p "Enter your choice (1-4): " choice
        case $choice in
            1)
                return 1  # Project level
                ;;
            2)
                return 2  # User level
                ;;
            3)
                return 3  # Both
                ;;
            4)
                print_step "Installation cancelled"
                exit 0
                ;;
            *)
                echo "Please enter 1, 2, 3, or 4"
                ;;
        esac
    done
}

verify_installation() {
    local dir="$1"
    local context="$2"
    
    if [ -d "$dir" ] && [ "$(ls -A "$dir"/*.md 2>/dev/null | wc -l)" -gt 0 ]; then
        local count=$(ls -1 "$dir"/*.md 2>/dev/null | wc -l)
        print_success "$context: $count agent files found"
        return 0
    else
        print_warning "$context: No agent files found"
        return 1
    fi
}

show_next_steps() {
    echo ""
    echo -e "${CYAN}🚀 Installation Complete!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Verify agents are loaded:"
    echo -e "   ${BLUE}claude code /agents${NC}"
    echo ""
    echo "2. Test an agent:"
    echo -e "   ${BLUE}Use the react-developer subagent to create a login component${NC}"
    echo ""
    echo "3. View documentation:"
    echo "   https://github.com/NicholasCain570/claude-amplify-agents"
    echo ""
    echo "Available agents:"
    echo "• 12 Development agents (React, Amplify, GraphQL, etc.)"
    echo "• 7 Testing agents (Playwright, Visual, Performance, etc.)"
    echo "• 2 DevOps agents (Deployment, CI/CD)"
    echo "• 3 Specialist agents (Security, Code Review, Context)"
    echo ""
    echo -e "${GREEN}Happy coding with your AI development team! 🎉${NC}"
}

# Main execution
main() {
    print_header
    
    # Parse command line arguments
    INSTALL_TYPE=""
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            -p|--project)
                INSTALL_TYPE="project"
                shift
                ;;
            -u|--user)
                INSTALL_TYPE="user"
                shift
                ;;
            -b|--both)
                INSTALL_TYPE="both"
                shift
                ;;
            -h|--help)
                show_usage
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                show_usage
                exit 1
                ;;
        esac
    done
    
    # Determine installation type
    if [ -z "$INSTALL_TYPE" ]; then
        prompt_installation_type
        case $? in
            1) INSTALL_TYPE="project" ;;
            2) INSTALL_TYPE="user" ;;
            3) INSTALL_TYPE="both" ;;
        esac
    fi
    
    # Set up error handling
    trap cleanup EXIT
    
    # Execute installation steps
    check_dependencies
    create_temp_dir
    download_agents
    
    # Install based on type
    case $INSTALL_TYPE in
        "project")
            install_agents "$PROJECT_AGENTS_DIR" "project level"
            ;;
        "user")
            install_agents "$USER_AGENTS_DIR" "user level"
            ;;
        "both")
            install_agents "$PROJECT_AGENTS_DIR" "project level"
            install_agents "$USER_AGENTS_DIR" "user level"
            ;;
    esac
    
    # Verify installation
    echo ""
    print_step "Verifying installation..."
    case $INSTALL_TYPE in
        "project")
            verify_installation "$PROJECT_AGENTS_DIR" "Project level"
            ;;
        "user")
            verify_installation "$USER_AGENTS_DIR" "User level"
            ;;
        "both")
            verify_installation "$PROJECT_AGENTS_DIR" "Project level"
            verify_installation "$USER_AGENTS_DIR" "User level"
            ;;
    esac
    
    show_next_steps
}

# Run main function with all arguments
main "$@"