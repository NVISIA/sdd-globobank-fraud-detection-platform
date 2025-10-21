# GloboBank Fraud Detection Platform - Specification Repository# GloboBank Fraud Detection Platform - Specification Repository

[![Platform Version](https://img.shields.io/badge/version-v1.0.0-blue)](https://github.com/NVISIA/sdd-globobank-fraud-detection-platform/releases)[![Platform Version](https://img.shields.io/badge/version-v1.0.0-blue)](https://github.com/NVISIA/sdd-globobank-fraud-detection-platform/releases)

[![Specification Status](https://img.shields.io/badge/specifications-validated-green)](https://github.com/NVISIA/sdd-globobank-fraud-detection-platform/actions)[![Specification Status](https://img.shields.io/badge/specifications-validated-green)](https://github.com/NVISIA/sdd-globobank-fraud-detection-platform/actions)

[![Constitutional Compliance](https://img.shields.io/badge/constitution-compliant-green)](.specify/memory/constitution.md)[![Constitutional Compliance](https://img.shields.io/badge/constitution-compliant-green)](.specify/memory/constitution.md)

## 🏛️ Platform Specification Repository (PSR)## 🏛️ Platform Specification Repository (PSR)

This repository serves as the **authoritative source of truth** for business capability specifications in the GloboBank Fraud Detection Platform. It implements the Platform Specification Repository (PSR) pattern, providing validated business contracts that serve as the foundation for component repository implementations.This repository serves as the **authoritative source of truth** for business capability specifications in the GloboBank Fraud Detection Platform. It implements the Platform Specification Repository (PSR) pattern, providing validated business contracts that serve as the foundation for component repository implementations.

### 🎯 Purpose### 🎯 Purpose

- **Business Contract Management**: Define and version business capability specifications- **Business Contract Management**: Define and version business capability specifications

- **Cross-Repository Governance**: Provide consistent business requirements across component repositories  - **Cross-Repository Governance**: Provide consistent business requirements across component repositories  

- **Quality Assurance**: Ensure all specifications meet constitutional and quality standards- **Quality Assurance**: Ensure all specifications meet constitutional and quality standards

- **Regulatory Compliance**: Maintain audit trails and compliance documentation for all business capabilities- **Regulatory Compliance**: Maintain audit trails and compliance documentation for all business capabilities

## 📋 Repository Structure## Spec-Driven Development Overview

```### What is Spec-Driven Development (SDD)?

specifications/                    # Business capability specifications

├── risk-scoring/                  # Risk scoring business capabilityInstead of coding first and writing docs later, in spec-driven development, you start with a specification. This is a contract for how your code should behave and becomes the source of truth that your tools and AI agents use to generate, test, and validate code. The result is less guesswork, fewer surprises, and higher-quality code.

│   └── v1.0/                     # Version 1.0 of the capability

│       ├── spec.md               # Business capability specification### Why SDD?

│       └── checklists/           # Quality validation checklists

├── transaction-monitoring/        # Transaction monitoring capability**SDD is an Emerging Approach to AI-First Development**

│   └── v1.0/

└── fraud-alerting/               # Fraud alerting capabilityAs organizations are shifting to an AI-First mindset and Context Engineering, Spec-Driven development is an emerging path that has the potential to shift how we develop software and deliver products.

    └── v1.0/

**SDD Used for Enterprise-Grade System Development**

.specify/                          # Spec-driven development configuration

├── memory/SDD claims several improvements over approaches like Vibe Coding, including reliability, quality, upfront guardrails and constraints, and simplified iteration. SDD proponents see it as a viable approach for building enterprise-grade, mission-critical applications.  

│   └── constitution.md           # Platform constitutional principles

├── templates/### How Do You Use GitHub Spec Kit for SDD?

│   └── spec-template.md          # Business capability specification template

└── scripts/GitHub Spec Kit provides you with templates, scripts, and prompts to support a four-phase development cycle with clear checkpoints.

    └── powershell/               # PSR automation scripts

I've provided a summarization below from the following article: [GitHub - Spec-driven Development with AI: Get Started With a New Open Source Toolkit, by Den Delimarsky](https://github.blog/ai-and-ml/generative-ai/spec-driven-development-with-ai-get-started-with-a-new-open-source-toolkit/).

.github/

├── workflows/**Define the Constitution**

│   ├── psr-validation.yml        # Specification validation pipeline

│   └── psr-release.yml           # Release and tagging automationFirst, you define a Constitution markdown file. The Constitution is **your project's DNA**. This outlines the core principles, rules, and guidelines for a software project. The document serves as a `Constitutional Framework` that governs how specifications are translated into code within a Spec-Driven Development workflow using the GitHub Spec Kit. This is a living document that can be amended as your project team goes through new discoveries and changes during a project's life-cycle.

└── prompts/

    └── speckit.specify.prompt.md # Custom specify prompt for PSR**Phase 1 - Specify**

```

Each feature starts at the `Specify` phase. You provide a high-level description of what you are building and why you are building it. From this description, the coding agent will generate a detailed specification for you. This isn't about technical stacks or application design. It's about user journeys, experiences, and what success looks like. Who will use this? What problem does it solve? How will end users interact with it? What outcomes matter most? Think of it as mapping the user experience you want to create, and letting the AI coding agent flesh out the details. Crucially, this becomes a living artifact that evolves as you learn more about your users and their needs.

## 🚀 Quick Start

**Phase 2 - Plan**

### Creating a New Business Capability Specification

Now you get technical. In this phase, you provide the AI coding agent with your desired stack, architecture, and constraints, and the AI coding agent generates a comprehensive technical plan. If your company standardizes on certain technologies, this is where you say so. If you’re integrating with legacy systems, have compliance requirements, or have performance targets you need to hit … all of that goes here. You can also ask for multiple plan variations to compare and contrast different approaches. If you make your internal docs available to the coding agent, it can integrate your architectural patterns and standards directly into the plan. After all, an AI coding agent needs to understand the rules of the game before it starts playing.

1. **Use the Spec Kit Agent**:

   ```**Phase 3 - Tasks**

   /speckit.specify Real-time transaction risk scoring with ML-based fraud detection

   ```The coding agent takes the spec and the plan and breaks them down into actual work. It generates small, reviewable chunks that each solve a specific piece of the puzzle. Each task should be something you can implement and test in isolation; this is crucial because it gives the coding agent a way to validate its work and stay on track, almost like a test-driven development process for your AI agent. Instead of “build authentication,” you get concrete tasks like “create a user registration endpoint that validates email format.”



2. **The agent will**:**Phase 4 - Implement**

   - Create a new specification branch

   - Generate the business capability specificationYour coding agent tackles the tasks one by one (or in parallel, where applicable). But here’s what’s different: instead of reviewing thousand-line code dumps, you, the developer, review focused changes that solve specific problems. The coding agent knows what it’s supposed to build because the specification told it. It knows how to build it because the plan told it. And it knows exactly what to work on because the task told it.

   - Validate against constitutional compliance

   - Provide quality assurance checklist**Developer Role**

3. **Review and Refine**:Crucially, your role as a developer isn’t just to steer. It’s to verify. At each phase, you reflect and refine. Does the spec capture what you actually want to build? Does the plan account for real-world constraints? Are there omissions or edge cases the AI missed? The process builds in explicit checkpoints for you to critique what’s been generated, spot gaps, and course correct before moving forward. The AI generates the artifacts; you ensure they’re right.

   - Address any clarification questions

   - Ensure business requirements are complete### What Are the Claims Made for SDD?

   - Validate constitutional compliance

From research, these were key claims I discovered around SDD. I intend to validate them as part of building the Fraud Detection platform.

4. **Submit for Review**:

   - Create pull request1. **Reliability and Quality**

   - Automated validation runs1. Vibe-coding treats coding agents like search engines when we should be treating them more like literal-minded pair programmers. Coding agents excel at pattern recognition, but still need unambiguous instructions.

   - Constitutional compliance check2. SDD is a structured process that should enable reliable, mission-critical applications.

   - Quality assurance validation3. SDD drastically reduces guesswork and surprises, leading to higher-quality code.

2. **Intent as the Source of Truth**

### Consuming Specifications from Component Repositories1. SDD uses the specification as the source of truth, replacing code

2. The intent is separated from the implementation.

Component repositories reference this PSR for their business requirements:3. The spec becomes a living, executable contract that drives all downstream activities: code generation, testing, and validation.

3. **Upfront Guardrails and Constraints**

```yaml1. SDD brings guardrails and constraints forward to the specification from day 1.

# In component repository configuration2. Includes security, compliance, architecture standards, etc.

platform_specification_repository: "NVISIA/sdd-globobank-fraud-detection-platform"3. Prevents these requirements from being an afterthought buried in WIKIs and chat logs.

platform_specification_version: "v1.2.5"4. **Simplified Iteration and Refactoring**

capability_specification: "risk-scoring/v1.0"1. SDD enables iterative development without expensive rewrites.

```2. The spec (the "what") is separated from the flexible code implementation (the "how"), allowing for simple course changes.

3. When things change, just update the spec, regenerate the plan, and let the AI handle the complex changes in the implementation.

## 🏗️ Specification Versioning5. **Developer Role Shifts**

1. The developer no longer is spending the majority of the time in code; rather, they become a **steerer and verifier**.

### Platform-Level Versioning2. The AI handles the bulk of code writing.

- **Git Tags**: Platform releases tagged as `v1.2.5` (semantic versioning)3. The developer's focus is on providing high-level intent, refining the specifications, spotting gaps, and ensuring the generated artifacts are correct at explicit validation checkpoints.

- **Major**: Breaking changes to business capability contracts4. Developer goes through a four-phase, human-in-the-loop workflow. An example from GitHub is: `Specify` → `Plan` → `Tasks` → `Implement`. The developer verifies the output at each step.

- **Minor**: New business capabilities or enhanced functionality

- **Patch**: Bug fixes, clarifications, non-breaking updates### What Counter-Arguments Are Made for SDD?



### Capability-Level VersioningFrom research, these were key counter-arguments I discovered around SDD. I intend to validate them as part of building the Fraud Detection platform.

- **Folder Structure**: `specifications/capability-name/v1.0/`

- **Specification Tags**: `risk-scoring-v1.0-20251021`1. **Overhead of Spec Creation**

- **Contract Evolution**: New versions for significant capability changes1. Creating a complete, unambiguous, machine-readable spec that is detailed enough for an AI agent to execute reliably may require *more* upfront effort than just writing the code in the first place.

2. This process might be too rigid for rapid discovery and prototyping, thus losing the agility SDD claims to offer.

## 📜 Constitutional Compliance3. The process also might be overkill for small features or bug fixes.

4. If the Agent generates a "wall of text", it will require a developer to slog through to spot ambiguities and other issues.

All business capability specifications must comply with the [GloboBank Fraud Detection Platform Constitution](.specify/memory/constitution.md):2. **Over-Specification Bottleneck**

1. SDD, like older design methodologies like Waterfall, has a risk of **over-specification**. Engineers may spend a disproportionate amount of time detailing a spec and plan that they later discover is technically suboptimal.

### Core Principles (NON-NEGOTIABLE)2. Over-specification can lead to a significant bottleneck in planning, especially in complex domains, hindering the ability to pivot when new technical insights emerge during implementation.

- **Security-First Development**: Zero-trust architecture, defense-in-depth3. **Contextual Complexity and Legacy Integration**

- **Real-Time Processing**: Sub-200ms response times, event-driven architecture1. For features in existing systems (the "N-to-N+1" scenario referenced by GitHub as where SDD is most powerful), the complexity shifts to **Context Engineering**.

- **AI/ML Model Governance**: Rigorous validation, bias testing, regulatory compliance2. Ensuring the AI Agent has the correct, up-to-date, and focused context of a large, complex codebase is non-trivial and often a specialized engineering task.

- **Regulatory Compliance**: BSA/AML, FFIEC, Fair Credit Reporting Act compliance3. If the context is wrong or incomplete, then the AI will generate code that looks right but introduces subtle integration bugs or technical debt.

- **Data Governance**: Privacy by design, data quality management4. **Limited Scope for Novel / Complex Technology**

- **Model Risk Management**: Three-tier validation, continuous monitoring1. SDD tends to thrive in well-defined domains (ex. standard API endpoints, CRUD operations, database schemas). When a project requires novel algorithms, non-standard system integrations, or complex real-time interactions, the language model may lack the necessary patterns.

2. For novel cases, the developer may spend more time meticulously guiding and correcting the AI's output than they would simply writing the code themselves, diminishing the value proposition.

## 🔄 CI/CD Pipeline3. The SDD approach can also be less effective for UI-heavy work that requires visual tools.

5. **Managing Spec Drift and Maintenance**

### Pull Request Validation1. A core SDD claim is that the spec is the "living source of truth." However, maintaining a clear separation between the spec and the constantly evolving code introduces a risk called **Spec Drift**.

- **Constitutional Compliance Check**: Validates adherence to platform principles2. In a fast-moving project, it can be easy to make a small code change without updating the spec, instantly breaking the AI's ability to reliably regenerate or validate the system. This adds a new layer of mandatory documentation and maintenance that developers must enforce.

- **Specification Quality Validation**: Ensures completeness and clarity3. This also requires potentially significant oversight and review in case the AI Agent doesn't make proper updates.

- **Business Contract Structure**: Validates required sections and metadata6. **Security Risks**

- **Cross-Specification Consistency**: Checks for conflicts with existing specifications1. Just like any prompt, SDD has the potential for credentials or other sensitive information to be leaked back to AI models.

2. This risk can increase significantly due to spec generators.

### Release Automation

- **Automatic Tagging**: Platform and capability-specific tags on merge### Impacts on Existing Processes

- **Release Notes Generation**: Automated documentation of changes

- **Breaking Change Detection**: Identifies major version requirementsAlong with validating claims and counter-arguments, I felt these were interesting impacts / questions about SDD's impact on  

- **Documentation Updates**: Maintains current version information

1. How does SDD impact Scrum?

## 🤝 Integration with Component Repositories1. How do you measure velocity with SDD?

1. How can existing applications be on-boarded to SDD?

### Spec Kit Agent Configuration1. Can SDD be used for legacy modernization of an existing application?

1. How would SDD handle vulnerability reports? Would the report contents need to be fed into the AI Agent? Or would the Agent access the report through a tool?

Component repositories configure their Spec Kit agents to reference this PSR:1. How is SDD for UI-based applications?

1. How does the GitHub Spec Kit update the Spec Kit for an existing project? What impacts would there be?

```markdown1. Can the Spec Kit be customized or extended?

# In component repository .specify/memory/constitution.md1. How rigid is the Spec Kit workflow? What happens if you a developer skips a step?



## Platform Specification Repository## GloboBank Context Engineering and Knowledge Base Integration



**Governing Repository**: NVISIA/sdd-globobank-fraud-detection-platformFor SDD to work at enterprise scale,AI Agents may need to integrate with `Organizational Knowledge Bases`. These knowledge bases can surface important, specific context for the coding agent to reason over. While each project will have it's own Constitution for local context, broader context can be provided at a domain tier, Center of Excellence / discipline tier, and a global / organizational tier, with each providing their own Constitution.

**Platform Version**: v1.2.5

**Constitutional Authority**: This repository's constitution extends from the platform constitution- Global KB - This defines the core corporate values, guidelines, and standards across the organization.

- Center of Excellence / Discipline KB - This defines specific rules for DevOps, Cloud, Product, Architecture, Security, Testing, etc.

### Implementation Guidelines- Domain KB - This defines specialized context relevant to a specific domain. For example, GloboBank has a Fraud domain that would define rules for how fraud is identified, etc.



When implementing features in this component repository:I've tried an approach that leverages RAG, where the coding agent can first query the knowledge base(s) with a task, retrieve the most relevant standards / documentation, then use the retrieved context along with the prompt to generate the final output. To accomplish this, a vector database, Qdrant, was required that to allow the coding agent to effectively retrieve from the knowledge base repositories.

1. Reference the platform specification repository at the tagged version

2. Ensure all implementations satisfy the business capability contractsI implemented a RAG governance system with MCP server integration to support AI coding agent queries here: [GitHub - NVISIA/sdd-globobank-rag-governance-solution](https://github.com/NVISIA/sdd-globobank-rag-governance-solution).

3. Maintain traceability from business requirements to implementation

4. Validate against both platform and component constitutional principles## Implementing a Fraud Detection Platform with SDD

```

This section captures my experience building a Fraud Detection Platform using SDD, specifically GitHub Spec Kit.

### Example Implementation Prompt

### 1 - Pre-requisites

```

Implement the Risk Scoring API as defined in the fraud-detection-platform-spec To run the GitHub Spec Kit, it's required that you:

repository at tag v1.2.5, specifically the risk-scoring capability v1.0 specification.

1. Install Python

Ensure implementation satisfies all business contract requirements and maintains1. Install `uv` using PIP

constitutional compliance with security-first development principles.

```### 2 - Create the Fraud Detection Platform Project



## 📊 Quality MetricsFrom a command prompt, I ran the following specify command to create my fraud detection project and GitHub repository:



### Specification Quality Indicators```

- **Constitutional Compliance**: 100% of specifications must pass constitutional validationuvx --from git+https://github.com/github/spec-kit.git specify init sdd-globobank-fraud-detection-platform

- **Business Contract Completeness**: All mandatory sections completed```

- **Clarity and Testability**: Requirements must be measurable and unambiguous

- **Cross-Repository Consistency**: No conflicting business entity definitionsI chose the following options:



### Platform Health Metrics1. AI Assistant: copilot (GitHub Copilot)

- **Specification Coverage**: Percentage of platform capabilities with validated specifications1. Script Type: ps (PowerShell)

- **Version Currency**: Age of specifications relative to business capability evolution

- **Compliance Score**: Adherence to constitutional principles across all specificationsAs a result of running this command, a .github\prompts folder was created with the following prompts:

- **Integration Success**: Component repository adoption and implementation success rate

- /speckit.constitution - Establish project principles

## 🛡️ Security and Compliance- /speckit.specify - Create baseline specification

- /speckit.plan - Create implementation plan

### Regulatory Compliance Framework- /speckit.tasks - Generate actionable tasks

- **BSA/AML Compliance**: Anti-money laundering and Bank Secrecy Act requirements- /speckit.implement - Execute implementation

- **FFIEC Guidelines**: Federal Financial Institutions Examination Council standards- /speckit.clarify (optional) - Ask structured questions to de-risk ambiguous areas before planning (run before /speckit.plan if used)

- **Fair Credit Reporting Act**: Consumer reporting and privacy protections- /speckit.analyze (optional) - Cross-artifact consistency & alignment report (after /speckit.tasks, before /speckit.implement)

- **Data Governance**: GDPR Article 25 privacy by design implementation- /speckit.checklist (optional) - Generate quality checklists to validate requirements completeness, clarity, and consistency (after /speckit.plan)



### Security StandardsA folder named .specify was also created that includes templates and scripts.

- **Zero-Trust Architecture**: All business capabilities assume breach scenarios

- **Defense-in-Depth**: Multiple security layers across all specifications### 3 - Configuring GloboBank RAG Governance Solution

- **Real-Time Monitoring**: Continuous security validation and threat detection

- **Audit Trail Management**: Complete audit trails for all business decisionsTo support prompts, I'm using a RAG solution implemented here: [GitHub - NVISIA SDD GloboBank RAG Governance Solution](https://github.com/NVISIA/sdd-globobank-rag-governance-solution)



## 📖 Documentation and ResourcesDocker is a pre-requisite for running the MCP server. Use the command: `.\scripts\start.bat` or `.\scripts\start.sh` to start the MCP server.



### Key DocumentsNext, I updated the .vscode\settings.json file with the following:

- [Platform Constitution](.specify/memory/constitution.md) - Core principles and standards

- [Specification Template](.specify/templates/spec-template.md) - Business capability specification format```

- [Quality Checklists](specifications/README.md) - Validation criteria and standards    "github.copilot.enable": {

        "*": true,

### Training and Onboarding        "yaml": true,

- **Business Analysts**: How to create effective business capability specifications        "plaintext": true,

- **Product Owners**: Translating business needs into specification requirements        "markdown": true

- **Development Teams**: Interpreting and implementing business capability contracts    },

- **Compliance Teams**: Ensuring regulatory requirements are properly specified    "github.copilot.advanced": {

        "length": 1000,

## 🎯 Governance and Decision Making        "temperature": 0.1

    },

### Specification Review Board    "mcp.servers": {

- **Business Capability Owners**: Domain experts for each business area        "globobank-rag": {

- **Product Management**: Prioritization and business value assessment            "url": "http://localhost:8000",

- **Compliance Officers**: Regulatory requirement validation            "enabled": true,

- **Architecture Council**: Technical feasibility and integration review            "timeout": 30000

        }

### Change Management Process    }

1. **Business Need Identification**: Stakeholder request for new/changed capability```

2. **Specification Development**: Business analyst creates specification using Spec Kit

3. **Constitutional Review**: Automated and manual compliance validationThe RAG system can answer the following:

4. **Stakeholder Review**: Business owners, compliance, and architecture review

5. **Approval and Release**: Formal approval and versioned release- AI/ML governance and ethical standards

6. **Implementation Coordination**: Component repository updates and implementations- API security requirements

- Cloud architecture guidelines

## 📈 Success Metrics- Data governance policies

- DevOps and deployment standards

### Business Outcomes- Fraud domain requirements

- **Fraud Detection Accuracy**: >95% accuracy across all platform capabilities- GloboBank specific standards

- **False Positive Reduction**: <2% false positive rate for customer transactions- Security CoE requirements

- **Processing Performance**: <200ms for real-time fraud scoring decisions- Testing and quality standards

- **Regulatory Compliance**: 100% compliance with all applicable regulations- UI/UX standards



### Platform EffectivenessWhile there may be a more direct way to support MCP, I landed on the following approach:

- **Specification Adoption**: Component repository utilization of PSR specifications

- **Implementation Consistency**: Cross-repository adherence to business contracts-

- **Quality Metrics**: Specification completeness and clarity measurements

- **Stakeholder Satisfaction**: Business and technical stakeholder feedback scores## GitHub Spec Kit Initial Project Structure



---Below are the contents generated in an initial GitHub Spec Kit project.



## 🚀 Getting StartedThere are two primary folders that are generated:



1. **Read the Constitution**: Understand the platform principles in [`.specify/memory/constitution.md`](.specify/memory/constitution.md)- .github\prompts

2. **Explore Existing Specifications**: Review specifications in the [`specifications/`](specifications/) directory  - This is where all .prompt.md files are stored that were generated by Spec Kit.

3. **Create Your First Specification**: Use `/speckit.specify` to generate a new business capability specification  - Includes the 4 SDD steps of: specify, plan, tasks, and implement.

4. **Join the Community**: Participate in specification reviews and contribute to platform evolution  - There's additional prompts: analyze, clarify, and constitution.

- .specify

## 📞 Support and Contact  - There is a memory folder that looks to have a template for the constitution file

  - There is a scripts folder with powershell scripts.

- **Platform Team**: Contact for constitutional questions and platform strategy  - There is a templates folder that includes an agent file template, plan template, spec template, and tasks template.

- **Business Analysis Team**: Support for specification development and quality

- **Compliance Team**: Regulatory requirement guidance and validationHere are the list of all files and a brief description:

- **Architecture Council**: Technical integration and feasibility consultation

- .github\prompts\analyze.prompt.md

---  - Description: Perform a non-destructive cross-artifact consistency and quality analysis across spec.md, plan.md, and tasks.md after task generation.

  - Goal: Identify inconsistencies, duplications, ambiguities, and underspecified items across the three core artifacts (`spec.md`, `plan.md`, `tasks.md`) before implementation. This command MUST run only after `/tasks` has successfully produced a complete `tasks.md`.

*This Platform Specification Repository implements the Spec-driven Development methodology with constitutional governance, ensuring high-quality business capability specifications that serve as the foundation for the GloboBank Fraud Detection Platform.*- .github\prompts\clarify.prompt.md
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
