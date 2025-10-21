---
description: Create or update the business capability specification from a natural language capability description for the Platform Specification Repository (PSR).
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

The text the user typed after `/speckit.specify` in the triggering message **is** the business capability description. Assume you always have it available in this conversation even if `$ARGUMENTS` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

Given that capability description, do this:

1. Run the script `.specify/scripts/powershell/create-new-feature.ps1 -Json "$ARGUMENTS"` from repo root and parse its JSON output for BRANCH_NAME and SPEC_FILE. All file paths must be absolute.
  **IMPORTANT** You must only ever run this script once. The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").
2. Load `.specify/templates/spec-template.md` to understand required sections.

3. Follow this execution flow:

    1. Parse capability description from Input
       If empty: ERROR "No business capability description provided"
    2. Extract key business concepts from description
       Identify: business actors, business processes, business data, business constraints, business value
    3. For unclear business aspects:
       - Make informed guesses based on fraud detection context and financial services standards
       - Only mark with [NEEDS CLARIFICATION: specific business question] if:
         - The choice significantly impacts business capability scope or customer experience
         - Multiple reasonable business interpretations exist with different implications
         - No reasonable business default exists
       - **LIMIT: Maximum 3 [NEEDS CLARIFICATION] markers total**
       - Prioritize clarifications by business impact: scope > regulatory/compliance > customer experience > operational details
    4. Fill Business Capability Scenarios & Testing section
       If no clear business capability flow: ERROR "Cannot determine business capability scenarios"
    5. Generate Business Contract Requirements
       Each requirement must be business-testable and technology-agnostic
       Use reasonable defaults for unspecified business details (document assumptions in Business Context section)
    6. Define Business Success Criteria
       Create measurable, business-outcome focused criteria
       Include both quantitative business metrics (fraud reduction, accuracy, throughput) and qualitative measures (customer satisfaction, regulatory compliance)
       Each criterion must be verifiable through business outcomes without implementation details
    7. Identify Key Business Entities (if business data involved)
    8. Return: SUCCESS (business capability specification ready for platform planning)

4. Write the business capability specification to SPEC_FILE using the template structure, replacing placeholders with concrete business details derived from the capability description (arguments) while preserving section order and headings.

5. **Business Capability Specification Quality Validation**: After writing the initial spec, validate it against PSR quality criteria:

   a. **Create Business Capability Quality Checklist**: Generate a checklist file at `SPEC_DIR/checklists/business-requirements.md` using the checklist template structure with these validation items:
   
      ```markdown
      # Business Capability Specification Quality Checklist: [CAPABILITY NAME]
      
      **Purpose**: Validate business capability specification completeness and quality before proceeding to platform planning
      **Created**: [DATE]
      **Capability**: [Link to spec.md]
      
      ## Business Content Quality
      
      - [ ] No implementation details (technologies, frameworks, APIs)
      - [ ] Focused on business value and capability outcomes
      - [ ] Written for business stakeholders and platform consumers
      - [ ] All mandatory sections completed
      - [ ] Constitutional compliance addressed
      
      ## Business Requirement Completeness
      
      - [ ] No [NEEDS CLARIFICATION] markers remain
      - [ ] Business requirements are measurable and unambiguous
      - [ ] Business success criteria are measurable
      - [ ] Business success criteria are business-outcome focused (no implementation details)
      - [ ] All business acceptance scenarios are defined
      - [ ] Business edge cases are identified
      - [ ] Business capability scope is clearly bounded
      - [ ] Platform dependencies and business assumptions identified
      
      ## Platform Contract Readiness
      
      - [ ] All business contract requirements have clear acceptance criteria
      - [ ] Business capability scenarios cover primary business flows
      - [ ] Capability meets measurable business outcomes defined in Success Criteria
      - [ ] No implementation details leak into business specification
      - [ ] Contract versioning and dependencies clearly defined
      - [ ] Integration points with other platform capabilities identified
      
      ## Constitutional Compliance Validation
      
      - [ ] Security-first development requirements addressed
      - [ ] Real-time processing requirements specified (if applicable)
      - [ ] AI/ML governance requirements included (if applicable)
      - [ ] Regulatory compliance requirements documented
      
      ## Notes
      
      - Items marked incomplete require spec updates before `/speckit.clarify` or `/speckit.plan`
      ```
   
   b. **Run Business Validation Check**: Review the spec against each checklist item:
      - For each item, determine if it passes or fails
      - Document specific issues found (quote relevant spec sections)
   
   c. **Handle Validation Results**:
      
      - **If all items pass**: Mark checklist complete and proceed to step 6
      
      - **If items fail (excluding [NEEDS CLARIFICATION])**:
        1. List the failing items and specific issues
        2. Update the spec to address each issue
        3. Re-run validation until all items pass (max 3 iterations)
        4. If still failing after 3 iterations, document remaining issues in checklist notes and warn user
      
      - **If [NEEDS CLARIFICATION] markers remain**:
        1. Extract all [NEEDS CLARIFICATION: ...] markers from the spec
        2. **LIMIT CHECK**: If more than 3 markers exist, keep only the 3 most critical (by business impact/scope/regulatory impact) and make informed guesses for the rest
        3. For each clarification needed (max 3), present options to user in this format:
        
           ```markdown
           ## Business Question [N]: [Business Topic]
           
           **Business Context**: [Quote relevant spec section]
           
           **What we need to know**: [Specific business question from NEEDS CLARIFICATION marker]
           
           **Suggested Business Answers**:
           
           | Option | Business Answer | Business Implications |
           |--------|--------|--------------|
           | A      | [First suggested business answer] | [What this means for the business capability] |
           | B      | [Second suggested business answer] | [What this means for the business capability] |
           | C      | [Third suggested business answer] | [What this means for the business capability] |
           | Custom | Provide your own business answer | [Explain how to provide custom business input] |
           
           **Your choice**: _[Wait for user response]_
           ```
        
        4. **CRITICAL - Table Formatting**: Ensure markdown tables are properly formatted:
           - Use consistent spacing with pipes aligned
           - Each cell should have spaces around content: `| Content |` not `|Content|`
           - Header separator must have at least 3 dashes: `|--------|`
           - Test that the table renders correctly in markdown preview
        5. Number questions sequentially (Q1, Q2, Q3 - max 3 total)
        6. Present all questions together before waiting for responses
        7. Wait for user to respond with their choices for all questions (e.g., "Q1: A, Q2: Custom - [details], Q3: B")
        8. Update the spec by replacing each [NEEDS CLARIFICATION] marker with the user's selected or provided answer
        9. Re-run validation after all clarifications are resolved
   
   d. **Update Checklist**: After each validation iteration, update the checklist file with current pass/fail status

6. Report completion with branch name, spec file path, checklist results, and readiness for the next phase (`/speckit.clarify` or `/speckit.plan`).

**NOTE:** The script creates and checks out the new branch and initializes the spec file before writing.

## General Guidelines

## Quick Guidelines

- Focus on **WHAT** the business capability needs and **WHY** it provides value.
- Avoid HOW to implement (no tech stack, APIs, code structure).
- Written for business stakeholders and platform capability consumers.
- DO NOT create any checklists that are embedded in the spec. That will be a separate command.

### Section Requirements

- **Mandatory sections**: Must be completed for every business capability
- **Optional sections**: Include only when relevant to the capability
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation in PSR Context

When creating this business capability specification from a user prompt:

1. **Make informed business guesses**: Use fraud detection context, financial services standards, and platform patterns to fill gaps
2. **Document business assumptions**: Record reasonable business defaults in the Business Context section
3. **Limit business clarifications**: Maximum 3 [NEEDS CLARIFICATION] markers - use only for critical business decisions that:
   - Significantly impact business capability scope or customer experience
   - Have multiple reasonable business interpretations with different implications
   - Lack any reasonable business default
4. **Prioritize business clarifications**: scope > regulatory/compliance > customer experience > operational details
5. **Think like a business tester**: Every vague business requirement should fail the "measurable and unambiguous" checklist item
6. **Common business areas needing clarification** (only if no reasonable business default exists):
   - Business capability scope and boundaries (include/exclude specific business use cases)
   - Business user types and roles (if multiple conflicting business interpretations possible)
   - Regulatory/compliance requirements (when legally/financially significant for the business)
   
**Examples of reasonable business defaults** (don't ask about these):

- Business data retention: Financial services standard practices for fraud detection domain
- Business performance targets: Standard fraud detection expectations unless specified
- Business error handling: Customer-friendly business processes with appropriate business fallbacks
- Business authentication method: Standard enterprise fraud detection patterns
- Business integration patterns: Event-driven business capability integration unless specified otherwise

### Business Success Criteria Guidelines

Business success criteria must be:

1. **Measurable**: Include specific business metrics (fraud reduction percentage, accuracy rate, processing time, business volume)
2. **Business-outcome focused**: No mention of technologies, implementations, or technical details
3. **Customer/Business-focused**: Describe outcomes from business and customer perspective, not technical system internals
4. **Verifiable**: Can be tested/validated through business outcomes without knowing implementation details

**Good business examples**:

- "Reduce fraudulent transaction losses by 25%"
- "Achieve >95% fraud detection accuracy"
- "Process risk scoring decisions within 200ms"
- "Maintain <2% false positive rate for customer transactions"

**Bad examples** (implementation-focused):

- "API response time is under 200ms" (too technical, use "Business decisions available instantly")
- "Database can handle 1000 TPS" (implementation detail, use business transaction volume metric)
- "React components render efficiently" (technology-specific)
- "Redis cache hit rate above 80%" (technology-specific)
