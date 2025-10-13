# GloboBank Fraud Detection Platform - GitHub Copilot Instructions

## Project Context

You are working on the **GloboBank Fraud Detection Platform**, a mission-critical financial system that must comply with enterprise governance standards, regulatory requirements, and fraud detection best practices. This project follows **Spec-Driven Development (SDD)** methodology using GitHub Spec Kit.

## Governance Integration

This project integrates with the **GloboBank RAG Governance Solution** running at `http://localhost:8000`. Always query governance standards when providing guidance, especially during specification, planning, and implementation phases.

### Governance Query Pattern

When making recommendations or generating code, use this pattern:
```
Query governance: [your specific question about standards/requirements]
Example: "Query governance: API security requirements for fraud detection endpoints"
```

## Governance Standards Coverage

### 1. AI/ML Governance and Ethical Standards
**When working on ML models, algorithms, or AI features:**

- **Query Pattern**: "Query governance: AI/ML ethical standards for fraud detection models"
- **Key Areas**: Model bias detection, explainability requirements, fairness metrics
- **Compliance**: Ensure ML models are interpretable for regulatory audits
- **Documentation**: Include model cards, bias testing results, and explainability reports

**Example Queries**:
- "Query governance: ML model validation requirements for financial fraud detection"
- "Query governance: AI bias testing standards for customer transaction monitoring"
- "Query governance: Model explainability requirements for fraud scoring algorithms"

### 2. API Security Requirements
**When designing or implementing APIs:**

- **Query Pattern**: "Query governance: API security standards for fraud detection services"
- **Key Requirements**: OAuth 2.0 with PKCE, TLS 1.3, rate limiting, JWT tokens
- **Authentication**: Multi-factor authentication for admin endpoints
- **Authorization**: Role-based access control (RBAC) with fine-grained permissions

**Example Queries**:
- "Query governance: Authentication requirements for real-time fraud scoring API"
- "Query governance: API rate limiting standards for high-volume transaction processing"
- "Query governance: Security headers and encryption for fraud alert endpoints"

### 3. Cloud Architecture Guidelines
**When designing system architecture:**

- **Query Pattern**: "Query governance: cloud architecture standards for fraud detection systems"
- **Key Areas**: Microservices patterns, scalability, resilience, multi-region deployment
- **Compliance**: Disaster recovery, data residency, service mesh requirements
- **Performance**: Auto-scaling, load balancing, caching strategies

**Example Queries**:
- "Query governance: microservices architecture patterns for real-time fraud detection"
- "Query governance: cloud resilience requirements for fraud prevention systems"
- "Query governance: data processing architecture for high-volume transaction analysis"

### 4. Data Governance Policies
**When handling customer or transaction data:**

- **Query Pattern**: "Query governance: data governance policies for fraud detection data"
- **Key Requirements**: PII protection, data retention, encryption at rest/transit
- **Privacy**: Customer consent, data anonymization, right to deletion
- **Compliance**: SOX, PCI DSS, GDPR, data lineage tracking

**Example Queries**:
- "Query governance: customer data retention policies for fraud investigation records"
- "Query governance: PII encryption requirements for transaction data processing"
- "Query governance: data anonymization standards for fraud analytics"

### 5. DevOps and Deployment Standards
**When setting up CI/CD, infrastructure, or deployments:**

- **Query Pattern**: "Query governance: DevOps deployment standards for fraud detection platform"
- **Key Areas**: Infrastructure as Code, security scanning, deployment approvals
- **Pipeline Requirements**: Automated testing, security gates, compliance checks
- **Monitoring**: Observability, alerting, incident response procedures

**Example Queries**:
- "Query governance: CI/CD pipeline security requirements for fraud detection services"
- "Query governance: infrastructure monitoring standards for real-time fraud systems"
- "Query governance: deployment approval process for production fraud detection updates"

### 6. Fraud Domain Requirements
**When implementing fraud-specific functionality:**

- **Query Pattern**: "Query governance: fraud domain requirements for [specific feature]"
- **Key Standards**: Real-time monitoring, alert thresholds, investigation workflows
- **Regulatory**: BSA/AML compliance, suspicious activity reporting, audit trails
- **Performance**: Sub-second response times, 99.99% availability requirements

**Example Queries**:
- "Query governance: real-time transaction monitoring requirements for fraud detection"
- "Query governance: fraud alert escalation procedures and thresholds"
- "Query governance: suspicious activity reporting requirements for regulatory compliance"

### 7. GloboBank Specific Standards
**When implementing any feature:**

- **Query Pattern**: "Query governance: GloboBank enterprise standards for [area]"
- **Key Areas**: Branding guidelines, naming conventions, integration patterns
- **Enterprise**: Single sign-on, corporate directory integration, audit logging
- **Compliance**: Internal risk management, corporate governance policies

**Example Queries**:
- "Query governance: GloboBank naming conventions for fraud detection services"
- "Query governance: enterprise integration patterns for customer data access"
- "Query governance: corporate audit logging requirements for fraud investigations"

### 8. Security CoE Requirements
**When implementing security features:**

- **Query Pattern**: "Query governance: Security CoE requirements for [security aspect]"
- **Key Standards**: Zero-trust architecture, threat modeling, security testing
- **Tools**: Approved security libraries, vulnerability scanning, penetration testing
- **Incident Response**: Security incident procedures, breach notification protocols

**Example Queries**:
- "Query governance: zero-trust security architecture for fraud detection platform"
- "Query governance: threat modeling requirements for transaction processing systems"
- "Query governance: security testing standards for fraud prevention APIs"

### 9. Testing and Quality Standards
**When writing tests or quality assurance procedures:**

- **Query Pattern**: "Query governance: testing standards for fraud detection systems"
- **Requirements**: Unit test coverage, integration testing, performance testing
- **Quality Gates**: Code coverage thresholds, automated testing pipelines
- **Validation**: Load testing, chaos engineering, disaster recovery testing

**Example Queries**:
- "Query governance: unit testing requirements for fraud scoring algorithms"
- "Query governance: performance testing standards for real-time transaction processing"
- "Query governance: integration testing requirements for fraud alert systems"

### 10. UI/UX Standards
**When designing user interfaces:**

- **Query Pattern**: "Query governance: UI/UX standards for fraud detection dashboards"
- **Accessibility**: WCAG compliance, screen reader support, keyboard navigation
- **Design System**: Corporate design tokens, component libraries, responsive design
- **Usability**: Fraud analyst workflows, alert prioritization, investigation tools

**Example Queries**:
- "Query governance: accessibility requirements for fraud investigation dashboards"
- "Query governance: UI design patterns for real-time fraud alert displays"
- "Query governance: user experience standards for fraud analyst workflows"

## SDD Phase-Specific Guidance

### During Specification Phase (`/speckit.specify`)
- Query relevant governance standards for the feature being specified
- Validate user stories against compliance requirements
- Include governance validation criteria in acceptance scenarios
- Reference applicable standards in the specification documentation

**Pre-Specification Governance Check**:
```
Before creating specifications, query:
"Query governance: [feature area] requirements for fraud detection platform"
```

### During Planning Phase (`/speckit.plan`)
- Query architecture and security standards for technical decisions
- Validate technology stack against approved enterprise tools
- Include governance compliance tasks in the implementation plan
- Reference security and data governance requirements

**Pre-Planning Governance Check**:
```
Before technical planning, query:
"Query governance: architecture standards for [planned technical approach]"
"Query governance: security requirements for [system components]"
```

### During Task Generation (`/speckit.tasks`)
- Include governance validation tasks for each implementation area
- Add compliance testing tasks to the task list
- Ensure security review tasks are included for sensitive components
- Include documentation tasks for audit trail requirements

### During Implementation (`/speckit.implement`)
- Query specific implementation standards before coding
- Validate code patterns against enterprise guidelines
- Include governance compliance in code reviews
- Ensure all security and compliance requirements are implemented

## Code Generation Guidelines

### Always Include Governance Context
When generating code, always consider and incorporate relevant governance standards:

1. **Query First**: Always query governance before generating significant code
2. **Include Comments**: Add governance-related comments explaining compliance decisions
3. **Security by Design**: Implement security controls as primary features, not add-ons
4. **Audit Trail**: Include logging and monitoring for compliance requirements
5. **Error Handling**: Implement robust error handling for regulatory compliance

### Example Code Generation Pattern
```python
# Before generating fraud detection code:
# Query governance: "fraud scoring algorithm security and compliance requirements"

# Generated code should include:
# - Audit logging for all scoring decisions
# - Input validation for security
# - Error handling for regulatory compliance
# - Performance monitoring for SLA compliance
```

## Compliance Validation Checklist

Before completing any SDD phase, validate against these governance areas:

- [ ] **AI/ML**: Are all AI/ML requirements from AI/ML standards implemented?
- [ ] **API**: Are all API requirements from API standards implemented?
- [ ] **Architecture**: Are all Architecture requirements from Architecture standards implemented?
- [ ] **Cloud Architecture**: Are all Cloud Architecture requirements from Cloud Architecture standards implemented?
- [ ] **Data**: Are all Data requirements from Data standards implemented?
- [ ] **DevOps**: Are all DevOps requirements from DevOps standards implemented?
- [ ] **Fraud Domain**: Are all Fraud Domain requirements from Fraud Domain standards implemented?
- [ ] **GloboBank**: Are all GloboBank requirements from GloboBank standards implemented?
- [ ] **Product**: Are all Product requirements from Product standards implemented?
- [ ] **Security**: Are all Security requirements from Security standards implemented?
- [ ] **Testing**: Are all Testing requirements from Testing standards implemented?
- [ ] **UI/UX**: Are all UI/UX requirements from UI/UX standards implemented?

## Emergency Governance Queries

For quick reference during development:

### Critical Security
```
Query governance: "critical security requirements for fraud detection platform"
```

### Regulatory Compliance
```
Query governance: "regulatory compliance requirements for financial fraud systems"
```

### Performance Standards
```
Query governance: "performance and availability requirements for real-time fraud detection"
```

### Data Protection
```
Query governance: "data protection and privacy requirements for customer transaction data"
```

## Troubleshooting Governance Integration

If governance queries are not working:

1. **Check RAG Server**: Ensure `http://localhost:8000` is accessible
2. **Verify MCP Configuration**: Check `.vscode/settings.json` MCP server settings
3. **Use Helper Script**: Run `.\scripts\governance-helper.ps1 -Query "test connection"`
4. **Manual Fallback**: Refer to governance knowledge base files directly in `../sdd-globobank-rag-governance-solution/knowledge-bases/`

## Best Practices

1. **Query Early and Often**: Don't wait until implementation to check governance
2. **Be Specific**: Use targeted queries rather than generic governance requests
3. **Document Decisions**: Include governance reasoning in specifications and code
4. **Validate Continuously**: Check compliance at each SDD phase checkpoint
5. **Stay Current**: Governance standards evolve, always query for latest requirements

---

**Remember**: This fraud detection platform handles sensitive financial data and must meet the highest standards of security, compliance, and reliability. When in doubt, always query governance and err on the side of stronger compliance measures.