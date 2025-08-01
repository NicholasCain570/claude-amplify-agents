# AWS Amplify Claude Code Subagents

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Subagents-blue.svg)](https://docs.anthropic.com/en/docs/claude-code)
[![AWS Amplify](https://img.shields.io/badge/AWS-Amplify-orange.svg)](https://aws.amazon.com/amplify/)

> 24 specialized Claude Code subagents for AWS Amplify development - React, GraphQL, DynamoDB, S3, Chrome extensions, and Playwright testing

A comprehensive collection of specialized AI subagents for Claude Code, designed specifically for AWS Amplify applications with React frontend, GraphQL API, DynamoDB, S3 storage, and Chrome extension integration.

## 🚀 Overview

Transform your development workflow with a complete AI-powered development team. These subagents provide specialized expertise for every aspect of modern full-stack development, from frontend React components to backend Amplify services, comprehensive testing with Playwright, and Chrome extension development.

## 🏗️ Architecture Coverage

This subagent collection is designed for applications with the following stack:

```
┌─────────────────┬──────────────────┐
│   Frontend      │   Extensions     │
│   React App     │   Chrome Ext     │
│                 │                  │
├─────────────────┼──────────────────┤
│         GraphQL API                │
│                                    │
├─────────────────┬──────────────────┤
│   Database      │   Storage        │
│   DynamoDB      │   S3 Buckets     │
│                 │                  │
└─────────────────┴──────────────────┘
│         Playwright Testing         │
└────────────────────────────────────┘
```

## 📦 What's Included

### 🔧 Development Subagents (12)
| Agent | Purpose | Key Technologies |
|-------|---------|------------------|
| `amplify-auth` | Authentication & user management | Cognito, MFA, Social Auth |
| `amplify-cli` | CLI operations & infrastructure | Amplify CLI, CloudFormation |
| `amplify-devops` | Environment & deployment management | Multi-env, CI/CD, Branch deploys |
| `amplify-frontend` | Amplify React integration | DataStore, Auth, Storage APIs |
| `amplify-schema` | GraphQL schema & transforms | @model, @auth, @connection |
| `amplify-storage` | File storage & CDN | S3, CloudFront, File uploads |
| `aws-infrastructure` | AWS services integration | IAM, CloudFormation, Security |
| `chrome-extension-developer` | Chrome extension development | Manifest V3, Content scripts, APIs |
| `dynamodb-expert` | Database design & optimization | Single-table design, GSI/LSI |
| `graphql-client` | Client-side GraphQL | Apollo Client, Caching, Queries |
| `graphql-schema` | GraphQL API design | Schema design, Resolvers, Security |
| `react-developer` | React frontend development | Hooks, State management, Performance |

### 🧪 Testing Subagents (7)
| Agent | Purpose | Testing Focus |
|-------|---------|---------------|
| `amplify-integration-tester` | Amplify services testing | Auth flows, DataStore sync, Storage |
| `auth-flow-tester` | Authentication testing | Login/logout, MFA, Social auth |
| `chrome-extension-tester` | Extension testing | Extension APIs, Web app integration |
| `performance-tester` | Performance validation | Load times, Query performance, Metrics |
| `playwright-tester` | End-to-end testing | User flows, Cross-browser, Mobile |
| `test-data-manager` | Test data lifecycle | Data seeding, Cleanup, Isolation |
| `visual-tester` | Visual regression testing | Screenshots, UI consistency, Responsive |

### 🚀 DevOps Subagents (2)
| Agent | Purpose | Focus Areas |
|-------|---------|-------------|
| `deployment-manager` | Release management | Build optimization, Environment config |
| `test-automation-orchestrator` | CI/CD testing | Pipeline integration, Parallel execution |

### 🎯 Specialist Subagents (3)
| Agent | Purpose | Expertise |
|-------|---------|----------|
| `code-reviewer` | Code quality assurance | Standards, Security, Best practices |
| `context-manager` | Workflow coordination | Cross-agent context, Task management |
| `security-auditor` | Security validation | Vulnerability assessment, Compliance |

## 🛠️ Installation

### Quick Setup
```bash
# Clone this repository
git clone https://github.com/NicholasCain570/claude-amplify-agents.git

# Copy agents to your project
cd your-amplify-project
mkdir -p .claude/agents
cp claude-amplify-agents/*.md .claude/agents/

# Verify installation
claude code /agents
```

### Automated Setup
```bash
# Download and run the setup script
curl -sSL https://raw.githubusercontent.com/NicholasCain570/claude-amplify-agents/main/setup-agents.sh | bash
```

### Manual Installation
1. Create the agents directory: `mkdir -p .claude/agents`
2. Copy all `.md` files from this repository to `.claude/agents/`
3. Restart Claude Code to load the new agents

## 🎯 Usage Examples

### Automatic Agent Selection (Recommended)
Claude Code automatically chooses the right agents based on your task:

```bash
# Authentication feature
> "Add user authentication with social login and MFA"
# → Automatically uses: amplify-auth, amplify-schema, react-developer

# Testing workflow  
> "Create comprehensive tests for the shopping cart feature"
# → Automatically uses: playwright-tester, visual-tester, performance-tester

# Chrome extension integration
> "Build an extension that syncs data with the web app"
# → Automatically uses: chrome-extension-developer, amplify-integration-tester
```

### Explicit Agent Usage
When you need specific expertise:

```bash
# Specific agent for precise control
> "Use the amplify-schema subagent to design a Comment model with real-time subscriptions"

> "Have the security-auditor subagent review the authentication implementation"

> "Ask the performance-tester subagent to analyze GraphQL query performance"
```

### Complex Workflow Orchestration
For multi-step features:

```bash
> "Build a real-time chat feature:
   1. Use amplify-schema subagent to design the message model
   2. Have react-developer subagent create the chat UI  
   3. Ask playwright-tester subagent to create real-time sync tests"
```

## 🔄 Common Workflows

### Feature Development
```bash
> "Add user profile feature with avatar upload"
# Coordinates: amplify-schema → react-developer → amplify-storage → playwright-tester
```

### Performance Optimization
```bash
> "Optimize application performance across all layers"
# Coordinates: performance-tester → dynamodb-expert → graphql-schema → react-developer
```

### Security Review
```bash
> "Conduct comprehensive security audit"
# Coordinates: security-auditor → auth-flow-tester → amplify-integration-tester
```

### Deployment Pipeline
```bash
> "Set up production deployment with full testing"
# Coordinates: test-automation-orchestrator → amplify-devops → deployment-manager
```

## 🏆 Benefits

- **🎯 Specialized Expertise**: Each agent is an expert in their specific domain
- **🤝 Team Consistency**: Shared knowledge across your development team
- **🚀 Faster Development**: AI agents handle routine tasks and provide expert guidance
- **🧪 Comprehensive Testing**: Full coverage from unit to end-to-end testing
- **🔒 Built-in Security**: Security best practices integrated into every workflow
- **📈 Scalable Architecture**: Easily extensible for new technologies and patterns

## 🔧 Customization

### Adding Project-Specific Knowledge
Modify agent descriptions to include your specific patterns:

```markdown
---
name: amplify-schema
description: Expert in our company's GraphQL schema patterns, including our specific @auth rules and custom resolvers for the e-commerce domain.
---
```

### Creating Custom Agents
Use the existing agents as templates:

```bash
# Copy an existing agent
cp .claude/agents/react-developer.md .claude/agents/nextjs-developer.md
# Modify for your specific needs
```

## 📊 Project Structure

```
.claude/agents/
├── Development/
│   ├── amplify-auth.md
│   ├── amplify-frontend.md
│   ├── react-developer.md
│   └── ...
├── Testing/
│   ├── playwright-tester.md
│   ├── visual-tester.md
│   └── ...
├── DevOps/
│   ├── amplify-devops.md
│   └── deployment-manager.md
└── Specialists/
    ├── security-auditor.md
    └── code-reviewer.md
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Adding New Agents
1. Follow the existing agent format with YAML frontmatter
2. Include comprehensive descriptions with trigger keywords
3. Specify appropriate tools for the agent's domain
4. Add usage examples and test the agent

### Improving Existing Agents
1. Enhance system prompts based on real-world usage
2. Add new capabilities while maintaining focus
3. Update tool permissions as needed
4. Test compatibility with existing workflows

## 📝 Requirements

- **Claude Code**: Latest version with subagent support
- **Playwright MCP Server**: For testing agents (optional but recommended)
- **AWS Amplify CLI**: For Amplify-specific agents
- **Node.js & npm**: For frontend development

## 🐛 Troubleshooting

### Agents Not Appearing
```bash
# Check agent directory
ls -la .claude/agents/

# Verify Claude Code can see agents
claude code /agents

# Restart Claude Code
claude code --restart
```

### Agent Not Being Selected
- Add more specific keywords to agent descriptions
- Use explicit agent calls: `"Use the amplify-schema subagent to..."`
- Check for conflicting agent names

## 📜 License

MIT License - see [LICENSE](LICENSE) for details.

## 🙏 Acknowledgments

- Built for the Claude Code agentic coding platform by Anthropic
- Inspired by real-world AWS Amplify development patterns
- Community-driven development and testing

## 🔗 Related Resources

- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- [AWS Amplify Documentation](https://docs.amplify.aws/)
- [Playwright Testing Framework](https://playwright.dev/)
- [Chrome Extension Development](https://developer.chrome.com/docs/extensions/)

---

**Ready to supercharge your AWS Amplify development with AI-powered expertise!** 🚀

Star ⭐ this repository if it helps your development workflow!

## 📁 Repository Structure

```
claude-amplify-agents/
├── README.md                    # Comprehensive setup guide
├── CONTRIBUTING.md              # Contribution guidelines  
├── LICENSE                      # MIT License
├── setup-agents.sh             # Automated installation script
├── agents/                     # All 24 agent files
│   ├── amplify-auth.md
│   ├── amplify-cli.md
│   ├── react-developer.md
│   └── ... (21 more agents)
├── examples/                   # Usage examples
│   ├── basic-workflows.md
│   └── advanced-patterns.md
└── .github/
    └── workflows/
        └── validate-agents.yml
```
