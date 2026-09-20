# 121 Enterprises — Full Session Memory Snapshot
**Compiled by:** Jaria (Chief of Staff)
**Date:** 2026-09-18
**Session ID:** d2ba9616-bf09-47a9-9a39-490142368e84
**Context:** Recovery + active build session. Prior session ran to context limit without GitHub save. This document is the authoritative memory artifact for all future sessions.

---

## 0. GLOBAL STANDING RULES

### Core Value — MANDATORY FOR ALL AGENTS
**"We add value to every life we touch."**

Every output, every programme written, every interaction must be better than the last. Continuous improvement is not optional — it is the standard. Every agent must:
- Actively improve their skills each day
- Improve their memory and context retention
- Deliver better work with every iteration
- Be a better team member, contributor, and collaborator for our clients than they were the day before

**Set by:** Rashad Khan (CEO), 2026-09-18. This is a founding principle of One to One Group.

---

### Brand Pronunciation — MANDATORY FOR ALL AGENTS
**"121" is ALWAYS spoken and written as "One to One"** — never "one two one", never "121" in spoken or client-facing context.

- One to One Group
- One to One Solutions
- One to One Enterprises
- One to One CRM, One to One Skills, One to One Pay, etc.

**Why it matters:** The name carries the brand promise — precise, individual, dedicated attention to each client. Every agent must apply this in all communications, presentations, documents, and spoken interactions.

**Set by:** Rashad Khan (CEO), 2026-09-18. Non-negotiable.

---

## 1. ORGANISATION IDENTITY

| Entity | Role | Contact |
|--------|------|---------|
| **Rashad Khan (RK)** | Founder & CEO — 121Enterprises, 121Solutions, Smarter Mergers | rkhan@121.us |
| **121Enterprises** | Holding org / AI agent team platform | — |
| **121Solutions** (121sol) | Tech services & products division | solutions.121.us |
| **Smarter Mergers** (SM) | M&A advisory firm | smartermergers.com |
| **hosting121.com** | HostArmada reseller — hosts 121XQ, 121XML | 172.241.29.6 |
| **GitHub org** | 121solutions | github.com/121solutions |

---

## 2. COMMUNICATION PROTOCOL (ALL AGENTS)

Every message starts with:
```
{timestamp} - {SenderID}:> {message}
```
Example: `2026-09-18T10:00:00 - CTO:> Sprint plan complete.`

- AI-native timescales only: ms / s / min / hours — NEVER days/weeks/months
- API keys: NEVER in chat — only in .env files or GitHub Secrets
- Computer use: always confirm RK is not using PC before acting on screen

---

## 3. GITHUB AUTO-SAVE RULE

At 50% context consumed → MUST automatically commit + push to:
- **Repo:** https://github.com/rashadkhan121/121CostwiseEngine.git ✅ CONFIRMED 2026-09-20
- **Branch:** memory/session-snapshots
- **Commit format:** `[AUTO-SAVE] {timestamp} | 50%-context checkpoint | {session-id} | {prompt-summary}`
- **Script:** `F:\AI\.claudeInternal\RunGitSaveMemory.bat` (requires RK to double-click)
- **GitHub username:** rashadkhan121

---

## 4. FILE SYSTEM MAP

| Path | Purpose |
|------|---------|
| `F:\AI\.claudeInternal\` | All temp/internal work — Jaria's workspace |
| `F:\AI\` | Final deliverables visible to RK |
| `F:\AI\.claude\` | PROTECTED — agent definitions, memory, project configs |
| `F:\AI\.claude\memory\Agents\{agent}\MEMORY.md` | Per-agent memory files |
| `F:\AI\.claude\projects\{project}\` | Project working directories |

**Bash is unavailable on this device.** All shell operations use PowerShell via `.bat` wrappers double-clicked in File Explorer.

---

## 5. 121ENTERPRISESV2 — ORG STRUCTURE (48 roles, 8 departments)

**Recovered from:** Google Drive + Notion (2026-08-29)
**Full file:** `F:\AI\.claudeInternal\RECOVERED-121EnterprisesV2-OrgAndOverview.md`

### Structure Summary

| Department | Headcount | Reports To |
|---|---|---|
| Executive (C-Suite) | 5 | Board |
| IT Governance & Security | 6 | CIO |
| Engineering | 12 | CTO |
| DevOps | 4 | CTO |
| Data Analytics & Science | 7 | CTO |
| Customer Support | 5 | COO |
| Shared Office Services | 4 | COO |
| Budget Office / Finance | 5 | CFO |
| **Total** | **48** | — |

### Key Design Decisions
- **CIO** owns governance/security/architecture (ISO 27001 separation of duties)
- **CTO** owns engineering/DevOps/data (technical execution)
- **COO** owns customer support and shared services
- **CFO** owns budget office with FP&A and controllership
- **CISO reports to CIO** (not CTO) — maintains audit independence from engineering

### ISO Compliance Mapping
| Standard | Function | Key Roles |
|---|---|---|
| ISO/IEC 12207 | Engineering, QA, DevOps | VP Eng, QA Mgr, DevOps Mgr |
| ISO 27001 | IT Governance, Security | CIO, CISO, IT Gov Mgr |
| ISO 9001 | QA, Customer Support | QA Mgr, COO, CS Mgr |
| ISO/IEC 27034 | Security, Engineering | CISO, Sec Eng, SDET |
| ISO 31000 | Governance, Executive | CIO, IT Gov Mgr, CFO |

---

## 6. 121SOLUTIONS — PRODUCTS & SERVICES

**Notion source:** https://app.notion.com/p/3caa1d49911d808d9e55edee0456b523

### 9 Products
| Product | Description |
|---------|-------------|
| 121 CRM | AI-assisted CRM, pipeline, analytics, workflow |
| 121 Analytics as a Service | Managed analytics, predictive modelling, BI dashboards |
| 121 Skills | LMS — courses, exams, certs, fees, financials |
| 121 Pay | Multi-currency fintech payments, e-wallet |
| 121 Club | Business loyalty & rewards network |
| 121 Call Center | Outsourced inbound/outbound contact centre |
| 121 BPO | Back-office outsourcing (accounting, medical coding, payroll) |
| 121 Ride / Orbit Ride | Tracked logistics & delivery |
| LaunchReady (Biz-in-a-Box) | End-to-end business launch (USA/UK) |

### Methodology
Discovery → Build → Validate → Operate

### Services
Data & Web Scraping | Data Engineering | Analytics & Reporting | Automation & Integrations

---

## 7. ACTIVE PROJECT REGISTRY

| Project | Status | Phase | Notes |
|---------|--------|-------|-------|
| **121CostwiseEngine** | Deploying | Production | FastAPI → LiteLLM → 9 backends. SSH deploy to 172.241.29.6 pending. Peak=Claude Sonnet, Off-peak/long=DeepSeek |
| **121XQAI** | Building | Phase 1 MVP | Platform Workforce agents deployed. Target: Oct 2026, 50-100 users |
| **121XQ** | Consolidating | → 121XQ Master | Predecessor. Has graph interface + dashboard. Being merged with 121XQAI |
| **121XML** | Live | Phase 1 | 121xml.com — open data standard |
| **121skills** | Building | Phase 1A | Skills marketplace |
| **121Enterprises** | Operational | — | Agent team platform |
| **121MetaVerse** | Planned | Phase 2 Nov 2026 | Spatial view layer |
| **121-GitHub-Infra** | Operational | — | CI/CD templates |
| **Meet121** | Research | Pre-build | Market research done, no build started |
| **Enjoy (enjoy.121.us)** | Building | MVP | Standup comedy microsite, separate Claude session |
| **SmarterMergers** | Operational | — | M&A advisory |
| **121XK** | PARKED | — | Rust micro-kernel — reactivate when RK says |
| **121XMod** | PARKED | — | System prompt tool |

---

## 8. 121COSTWISEENGINE — TECHNICAL DETAILS

- **Repo:** github.com/121solutions/121costwiseengine
- **Architecture:** FastAPI router → LiteLLM proxy → 9 AI backends
- **Routing logic:**
  - Peak (06:00–22:00 UTC): Claude Sonnet 4.6
  - Off-peak OR prompts >8,000 chars: DeepSeek
- **Server:** 172.241.29.6 (HostArmada reseller, same as 121XQ + 121XML)
- **SSH user:** XML | **SSH port:** 22 closes immediately (server restriction) — use 19199
- **GitHub Secrets configured:** SSH_PRIVATE_KEY, VPS_IP, VPS_USER, AI_KEYS_ENV
- **Blocker:** @James resolving SSH port for deploy pipeline

---

## 9. 121XQ CONSOLIDATION BRIEF

**Brief file:** `F:\AI\.claudeInternal\BRIEF-CTO-121XQ-Consolidation.md`
**Status:** Dispatched to @CTO. Awaiting RK to run `RunExtract121XQ.bat` first.

**5 deliverables @CTO must produce:**
1. Read `121XQ-Project-Extract.md` (after bat runs)
2. `121XQ_MASTER_SPEC.md` — combined feature spec (graph interface MUST be preserved)
3. `121XQ_REGENERATION_PROMPT.md` — self-contained AI rebuild prompt
4. 121CostwiseEngine integration design (transparent routing in front of 121XQ)
5. Delivery plan → present to RK

---

## 10. SMARTER MERGERS NDNC AGREEMENT

- **Master template:** `F:\AI\SM_NDNC_MASTER_TEMPLATE.docx` (RK's revised version — British spelling)
- **Key terms:** 2-year protection, M&A clauses, Appendix A for party details + signatures
- **Party A:** Client (company/address/email/phone + signature block)
- **Party B:** Smarter Mergers and affiliates (pre-filled + signature block)
- **Appendix A also includes:** Legal Jurisdiction table
- **Pending:** RK to fill in Party B (SM) address, email, phone

---

## 11. IT TEAM — MEMORY FILES (ALL RESTORED)

All 6 MEMORY.md files deployed to `F:\AI\.claude\memory\Agents\{agent}\MEMORY.md`:

| Agent | Key Standards |
|-------|--------------|
| **CTO** | Technology standards, all project statuses, AI backend registry, compliance scores (95% overall) |
| **Architect (Marcus)** | SOLID/SoC/DRY, locked M-series decisions, active architectures, CI/CD design |
| **Project Manager (Alexandra)** | Agile/Scrum: 1-week sprints, 30-40pt velocity, all 5 ceremonies, DoD, RICE |
| **Programmer (Ace)** | TDD, test pyramid (50/25/15/10), 85% coverage gates, httpOnly only, no hardcoded secrets |
| **Compliance** | GDPR, HIPAA, SOC2, CCPA, PIPL, ISO 27001/27034/9001/12207/31000 — gates block releases |
| **Operations (Orion)** | IaC Docker/K8s/Ansible, blue-green deploy, UFW+Fail2Ban, DataDog, P1 runbook |

---

## 12. FULL AGENT DIRECTORY (53+ total)

### System Agents
- Jaria (Chief of Staff)
- @ea (Victoria — Executive Assistant, ~1,800 tokens/day)
- System Monitor

### 121Enterprises IT Team
- @cto | @architect (Marcus) | @project-manager (Alexandra, ~2,250/day)
- @programmer (Ace) | @qa (Sarah) | @deployment (James)
- @compliance | @operations (Orion)

### Creative Department (6 agents)
Nova (Director), Sage (Story Writer), Atlas (Print Designer), Pixel (Digital Designer), Echo (Publisher), Cipher (Researcher)

### 121XQAI Platform Workforce (5 agents)
Deployed for Phase 1 MVP

### 121skills Agents (22 agents)
Phase 1A build active

### Plugin Agents (2)
Cowork management

---

## 13. SECURITY LOG

| Event | Date | Action |
|-------|------|--------|
| Anthropic API key accidentally shared in chat | 2026-09-18 | Key `apikey_011Vymr5FqEDjiTM5UVMsHvZ` — IMMEDIATELY ROTATED. New key in .env only |
| All 4 GitHub Secrets set on 121CostwiseEngine | 2026-09-18 | SSH_PRIVATE_KEY, VPS_IP, VPS_USER, AI_KEYS_ENV |

---

## 14. PENDING RK ACTIONS (PRIORITY ORDER)

1. **Run `RunGitSaveMemory.bat`** — push this snapshot to GitHub NOW
2. **Run `RunExtract121XQ.bat`** — enables @CTO team to start 121XQ consolidation
3. **Assign names to 48 TBD roles** in 121EnterprisesV2 org (sprint backlog item)
4. **Confirm SSH** once @James resolves 121CostwiseEngine deploy
5. **Fill Party B details** in SM NDNC master template (SM address, email, phone)
6. **NVIDIA API Key** — get from build.nvidia.com when convenient

---

## 15. TEAM OPERATING RULES (STANDING)

- @architect designs — does NOT implement
- @qa must sign off before any deploy
- @programmer implements per @architect specs only
- All decisions ≥ architectural scope → @CTO sign-off required
- Escalate blockers: agent → Jaria → RK
- Code quality gates: 85% coverage, 2+ PR approvals, SAST on every pipeline
- GitHub pushes: fully automated when staged — no manual hold
- Computer use: check RK is not on PC before acting on screen

---

*This file is the authoritative memory artifact for session d2ba9616-bf09-47a9-9a39-490142368e84.*
*To reconstruct: pull branch memory/session-snapshots from github.com/121solutions/121xqai.git*
