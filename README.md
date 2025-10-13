# NVISIA - Spec-Driven Development - GloboBank Fraud Detection Platform

## Overview

This repository is intended to be a proof of concept for using Spec-Driven Development to deliver a set of features for a fictional organization, `GloboBank`, and a fictional `Fraud Detection Platform`.

## Spec-Driven Development Overview

### What is Spec-Driven Development (SDD)?

Instead of coding first and writing docs later, in spec-driven development, you start with a specification. This is a contract for how your code should behave and becomes the source of truth that your tools and AI agents use to generate, test, and validate code. The result is less guesswork, fewer surprises, and higher-quality code.

### Why SDD?

**SDD is an Emerging Approach to AI-First Development**

As organizations are shifting to an AI-First mindset and Context Engineering, Spec-Driven development is an emerging path that has the potential to shift how we develop software and deliver products.

**SDD Used for Enterprise-Grade System Development**

SDD claims several improvements over approaches like Vibe Coding, including reliability, quality, upfront guardrails and constraints, and simplified iteration. SDD proponents see it as a viable approach for building enterprise-grade, mission-critical applications.  

### How Do You Use GitHub Spec Kit for SDD?

GitHub Spec Kit provides you with templates, scripts, and prompts to support a four-phase development cycle with clear checkpoints.

I've provided a summarization below from the following article: [GitHub - Spec-driven Development with AI: Get Started With a New Open Source Toolkit, by Den Delimarsky](https://github.blog/ai-and-ml/generative-ai/spec-driven-development-with-ai-get-started-with-a-new-open-source-toolkit/).

**Define the Constitution**

First, you define a Constitution markdown file. The Constitution is **your project's DNA**. This outlines the core principles, rules, and guidelines for a software project. The document serves as a `Constitutional Framework` that governs how specifications are translated into code within a Spec-Driven Development workflow using the GitHub Spec Kit. This is a living document that can be amended as your project team goes through new discoveries and changes during a project's life-cycle.

**Phase 1 - Specify**

Each feature starts at the `Specify` phase. You provide a high-level description of what you are building and why you are building it. From this description, the coding agent will generate a detailed specification for you. This isn't about technical stacks or application design. It's about user journeys, experiences, and what success looks like. Who will use this? What problem does it solve? How will end users interact with it? What outcomes matter most? Think of it as mapping the user experience you want to create, and letting the AI coding agent flesh out the details. Crucially, this becomes a living artifact that evolves as you learn more about your users and their needs.

**Phase 2 - Plan**

Now you get technical. In this phase, you provide the AI coding agent with your desired stack, architecture, and constraints, and the AI coding agent generates a comprehensive technical plan. If your company standardizes on certain technologies, this is where you say so. If you’re integrating with legacy systems, have compliance requirements, or have performance targets you need to hit … all of that goes here. You can also ask for multiple plan variations to compare and contrast different approaches. If you make your internal docs available to the coding agent, it can integrate your architectural patterns and standards directly into the plan. After all, an AI coding agent needs to understand the rules of the game before it starts playing.

**Phase 3 - Tasks**

The coding agent takes the spec and the plan and breaks them down into actual work. It generates small, reviewable chunks that each solve a specific piece of the puzzle. Each task should be something you can implement and test in isolation; this is crucial because it gives the coding agent a way to validate its work and stay on track, almost like a test-driven development process for your AI agent. Instead of “build authentication,” you get concrete tasks like “create a user registration endpoint that validates email format.”

**Phase 4 - Implement**

Your coding agent tackles the tasks one by one (or in parallel, where applicable). But here’s what’s different: instead of reviewing thousand-line code dumps, you, the developer, review focused changes that solve specific problems. The coding agent knows what it’s supposed to build because the specification told it. It knows how to build it because the plan told it. And it knows exactly what to work on because the task told it.

**Developer Role**

Crucially, your role as a developer isn’t just to steer. It’s to verify. At each phase, you reflect and refine. Does the spec capture what you actually want to build? Does the plan account for real-world constraints? Are there omissions or edge cases the AI missed? The process builds in explicit checkpoints for you to critique what’s been generated, spot gaps, and course correct before moving forward. The AI generates the artifacts; you ensure they’re right.

### What Are the Claims Made for SDD?

From research, these were key claims I discovered around SDD. I intend to validate them as part of building the Fraud Detection platform.

1. **Reliability and Quality**
 1. Vibe-coding treats coding agents like search engines when we should be treating them more like literal-minded pair programmers. Coding agents excel at pattern recognition, but still need unambiguous instructions.
 2. SDD is a structured process that should enable reliable, mission-critical applications.
 3. SDD drastically reduces guesswork and surprises, leading to higher-quality code.
2. **Intent as the Source of Truth**
 1. SDD uses the specification as the source of truth, replacing code.
 2. The intent is separated from the implementation.
 3. The spec becomes a living, executable contract that drives all downstream activities: code generation, testing, and validation.
3. **Upfront Guardrails and Constraints**
 1. SDD brings guardrails and constraints forward to the specification from day 1.
 2. Includes security, compliance, architecture standards, etc.
 3. Prevents these requirements from being an afterthought buried in WIKIs and chat logs.
4. **Simplified Iteration and Refactoring**
 1. SDD enables iterative development without expensive rewrites.
 2. The spec (the "what") is separated from the flexible code implementation (the "how"), allowing for simple course changes.
 3. When things change, just update the spec, regenerate the plan, and let the AI handle the complex changes in the implementation.
5. **Developer Role Shifts**
 1. The developer no longer is spending the majority of the time in code; rather, they become a **steerer and verifier**.
 2. The AI handles the bulk of code writing.
 3. The developer's focus is on providing high-level intent, refining the specifications, spotting gaps, and ensuring the generated artifacts are correct at explicit validation checkpoints.
 4. Developer goes through a four-phase, human-in-the-loop workflow. An example from GitHub is: `Specify` → `Plan` → `Tasks` → `Implement`. The developer verifies the output at each step.

### What Counter-Arguments Are Made for SDD?

From research, these were key counter-arguments I discovered around SDD. I intend to validate them as part of building the Fraud Detection platform.

1. **Overhead of Spec Creation**
 1. Creating a complete, unambiguous, machine-readable spec that is detailed enough for an AI agent to execute reliably may require *more* upfront effort than just writing the code in the first place.
 2. This process might be too rigid for rapid discovery and prototyping, thus losing the agility SDD claims to offer.
 3. The process also might be overkill for small features or bug fixes.
 4. If the Agent generates a "wall of text", it will require a developer to slog through to spot ambiguities and other issues.
2. **Over-Specification Bottleneck**
 1. SDD, like older design methodologies like Waterfall, has a risk of **over-specification**. Engineers may spend a disproportionate amount of time detailing a spec and plan that they later discover is technically suboptimal.
 2. Over-specification can lead to a significant bottleneck in planning, especially in complex domains, hindering the ability to pivot when new technical insights emerge during implementation.
3. **Contextual Complexity and Legacy Integration**
 1. For features in existing systems (the "N-to-N+1" scenario referenced by GitHub as where SDD is most powerful), the complexity shifts to **Context Engineering**.
 2. Ensuring the AI Agent has the correct, up-to-date, and focused context of a large, complex codebase is non-trivial and often a specialized engineering task.
 3. If the context is wrong or incomplete, then the AI will generate code that looks right but introduces subtle integration bugs or technical debt.
4. **Limited Scope for Novel / Complex Technology**
 1. SDD tends to thrive in well-defined domains (ex. standard API endpoints, CRUD operations, database schemas). When a project requires novel algorithms, non-standard system integrations, or complex real-time interactions, the language model may lack the necessary patterns.
 2. For novel cases, the developer may spend more time meticulously guiding and correcting the AI's output than they would simply writing the code themselves, diminishing the value proposition.
 3. The SDD approach can also be less effective for UI-heavy work that requires visual tools.
5. **Managing Spec Drift and Maintenance**
 1. A core SDD claim is that the spec is the "living source of truth." However, maintaining a clear separation between the spec and the constantly evolving code introduces a risk called **Spec Drift**.
 2. In a fast-moving project, it can be easy to make a small code change without updating the spec, instantly breaking the AI's ability to reliably regenerate or validate the system. This adds a new layer of mandatory documentation and maintenance that developers must enforce.
 3. This also requires potentially significant oversight and review in case the AI Agent doesn't make proper updates.
6. **Security Risks**
 1. Just like any prompt, SDD has the potential for credentials or other sensitive information to be leaked back to AI models.
 2. This risk can increase significantly due to spec generators.

### Impacts on Existing Processes

Along with validating claims and counter-arguments, I felt these were interesting impacts / questions about SDD's impact on  

1. How does SDD impact Scrum?
1. How do you measure velocity with SDD?
1. How can existing applications be on-boarded to SDD?
1. Can SDD be used for legacy modernization of an existing application?
1. How would SDD handle vulnerability reports? Would the report contents need to be fed into the AI Agent? Or would the Agent access the report through a tool?
1. How is SDD for UI-based applications?
1. How does the GitHub Spec Kit update the Spec Kit for an existing project? What impacts would there be?
1. Can the Spec Kit be customized or extended?
1. How rigid is the Spec Kit workflow? What happens if you a developer skips a step?

## GloboBank Context Engineering and Knowledge Base Integration

For SDD to work at enterprise scale,AI Agents may need to integrate with `Organizational Knowledge Bases`. These knowledge bases can surface important, specific context for the coding agent to reason over. While each project will have it's own Constitution for local context, broader context can be provided at a domain tier, Center of Excellence / discipline tier, and a global / organizational tier, with each providing their own Constitution.

- Global KB - This defines the core corporate values, guidelines, and standards across the organization.
- Center of Excellence / Discipline KB - This defines specific rules for DevOps, Cloud, Product, Architecture, Security, Testing, etc.
- Domain KB - This defines specialized context relevant to a specific domain. For example, GloboBank has a Fraud domain that would define rules for how fraud is identified, etc.

I've tried an approach that leverages RAG, where the coding agent can first query the knowledge base(s) with a task, retrieve the most relevant standards / documentation, then use the retrieved context along with the prompt to generate the final output. To accomplish this, a vector database, Qdrant, was required that to allow the coding agent to effectively retrieve from the knowledge base repositories.

I implemented a RAG governance system with MCP server integration to support AI coding agent queries here: [GitHub - NVISIA/sdd-globobank-rag-governance-solution](https://github.com/NVISIA/sdd-globobank-rag-governance-solution).

## Implementing a Fraud Detection Platform with SDD

This section captures my experience building a Fraud Detection Platform using SDD, specifically GitHub Spec Kit.

### 1 - Pre-requisites

To run the GitHub Spec Kit, it's required that you:

1. Install Python
1. Install `uv` using PIP

### 2 - Create the Fraud Detection Platform Project

From a command prompt, I ran the following specify command to create my fraud detection project and GitHub repository:

```
uvx --from git+https://github.com/github/spec-kit.git specify init sdd-globobank-fraud-detection-platform
```

I chose the following options:

1. AI Assistant: copilot (GitHub Copilot)
1. Script Type: ps (PowerShell)

As a result of running this command, a .github\prompts folder was created with the following prompts:

- /speckit.constitution - Establish project principles
- /speckit.specify - Create baseline specification
- /speckit.plan - Create implementation plan
- /speckit.tasks - Generate actionable tasks
- /speckit.implement - Execute implementation
- /speckit.clarify (optional) - Ask structured questions to de-risk ambiguous areas before planning (run before /speckit.plan if used)
- /speckit.analyze (optional) - Cross-artifact consistency & alignment report (after /speckit.tasks, before /speckit.implement)
- /speckit.checklist (optional) - Generate quality checklists to validate requirements completeness, clarity, and consistency (after /speckit.plan)

A folder named .specify was also created that includes templates and scripts.

### 3 - Configuring GloboBank RAG Governance Solution

To support prompts, I'm using a RAG solution implemented here: [GitHub - NVISIA SDD GloboBank RAG Governance Solution](https://github.com/NVISIA/sdd-globobank-rag-governance-solution)

Docker is a pre-requisite for running the MCP server. Use the command: `.\scripts\start.bat` or `.\scripts\start.sh` to start the MCP server.

Next, I updated the .vscode\settings.json file with the following:

```
    "github.copilot.enable": {
        "*": true,
        "yaml": true,
        "plaintext": true,
        "markdown": true
    },
    "github.copilot.advanced": {
        "length": 1000,
        "temperature": 0.1
    },
    "mcp.servers": {
        "globobank-rag": {
            "url": "http://localhost:8000",
            "enabled": true,
            "timeout": 30000
        }
    }
```

The RAG system can answer the following:

- AI/ML governance and ethical standards
- API security requirements
- Cloud architecture guidelines
- Data governance policies
- DevOps and deployment standards
- Fraud domain requirements
- GloboBank specific standards
- Security CoE requirements
- Testing and quality standards
- UI/UX standards

While there may be a more direct way to support MCP, I landed on the following approach:

-

## GitHub Spec Kit Initial Project Structure

Below are the contents generated in an initial GitHub Spec Kit project.

There are two primary folders that are generated:

- .github\prompts
 	- This is where all .prompt.md files are stored that were generated by Spec Kit.
 	- Includes the 4 SDD steps of: specify, plan, tasks, and implement.
 	- There's additional prompts: analyze, clarify, and constitution.
- .specify
 	- There is a memory folder that looks to have a template for the constitution file
 	- There is a scripts folder with powershell scripts.
 	- There is a templates folder that includes an agent file template, plan template, spec template, and tasks template.

Here are the list of all files and a brief description:

- .github\prompts\analyze.prompt.md
 	- Description: Perform a non-destructive cross-artifact consistency and quality analysis across spec.md, plan.md, and tasks.md after task generation.
 	- Goal: Identify inconsistencies, duplications, ambiguities, and underspecified items across the three core artifacts (`spec.md`, `plan.md`, `tasks.md`) before implementation. This command MUST run only after `/tasks` has successfully produced a complete `tasks.md`.
- .github\prompts\clarify.prompt.md
 	- Description: Identify underspecified areas in the current feature spec by asking up to 5 highly targeted clarification questions and encoding answers back into the spec.
 	- Goal: Detect and reduce ambiguity or missing decision points in the active feature specification and record the clarifications directly in the spec file.
- .github\prompts\constitution.prompt.md
 	- Description: Create or update the project constitution from interactive or provided principle inputs, ensuring all dependent templates stay in sync.
- .github\prompts\implement.prompt.md
 	- Description: Execute the implementation plan by processing and executing all tasks defined in tasks.md
- .github\prompts\plan.prompt.md
 	- Description: Execute the implementation planning workflow using the plan template to generate design artifacts.
- .github\prompts\specify.prompt.md
 	- Description: Create or update the feature specification from a natural language feature description.
- .github\prompts\tasks.prompt.md
 	- Description: Generate an actionable, dependency-ordered tasks.md for the feature based on available design artifacts.
- .specify\memory\constitution.md
 	- Description: Provides a spec constitution template
- .specify\scripts\powershell\check-prerequisites.ps1
 	- This script provides unified prerequisite checking for Spec-Driven Development workflow. It replaces the functionality previously spread across multiple scripts.
- .specify\scripts\powershell\common.ps1
 	- Common PowerShell functions analogous to common.sh
- .specify\scripts\powershell\create-new-feature.ps1
 	- Create a new feature
- .specify\scripts\powershell\setup-plan.ps1
 	- Setup implementation plan for a feature
- .specify\scripts\powershell\update-agent-context.ps1
 	- Update agent context files with information from plan.md (PowerShell version)
- .specify\templates\agent-file-template.md
 	- Agent file template
- .specify\templates\checklist-template.md
 	- Template for checklists
- .specify\templates\plan-template.md
 	- Implementation plan template
- .specify\templates\spec-template.md
 	- Feature specification template
- .specify\templates\tasks-template.md
 	- Task list template for feature implementation

## Resources and Related Information

- [Anthropic - Effective Context Engineering for AI Agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
- [GitHub - GitHub Spec Kit](https://github.com/github/spec-kit)
- [GitHub - NVISIA SDD GloboBank Fraud Detection Platform Repository](https://github.com/NVISIA/sdd-globobank-fraud-detection-platform)
- [GitHub - NVISIA SDD GloboBank RAG Governance Solution](https://github.com/NVISIA/sdd-globobank-rag-governance-solution)
- [GitHub - Spec-driven Development with AI: Get Started With a New Open Source Toolkit, by Den Delimarsky](https://github.blog/ai-and-ml/generative-ai/spec-driven-development-with-ai-get-started-with-a-new-open-source-toolkit/)
- [YouTube - The New Code, Sean Grove, OpenAI](https://www.youtube.com/watch?v=8rABwKRsec4)
