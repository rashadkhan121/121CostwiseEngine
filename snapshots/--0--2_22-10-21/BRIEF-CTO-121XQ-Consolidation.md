# @CTO BRIEF — 121XQ Consolidation & 121CostwiseEngine Integration
**From:** Jaria (Chief of Staff)
**Date:** 2026-09-18
**Priority:** High
**Authorised by:** Rashad Khan (CEO)

---

## MISSION

Consolidate 121XQ and 121XQAI into a single, definitive **121XQ** product. Integrate 121CostwiseEngine so all prompts are routed cost-efficiently. Deliver a practical plan to RK.

---

## CONTEXT

Two project folders currently exist for what should be one product:

| Project | Last Modified | Status |
|---------|--------------|--------|
| `F:\AI\.claude\projects\121XQ` | 2026-09-12 | Predecessor — has Phase 2 doc, master dashboard, graph interface |
| `F:\AI\.claude\projects\121XQAI` | 2026-09-17 | Active build — Platform Workforce agents deployed |

RK has specifically called out: **the graph interface must not be lost.**

---

## DELIVERABLES (in order)

### 1. Project Extraction (prerequisite)
Run `F:\AI\.claudeInternal\RunExtract121XQ.bat` to dump both project contents to `F:\AI\.claudeInternal\121XQ-Project-Extract.md`. Read that file before doing anything else.

### 2. SPEC File — `121XQ_MASTER_SPEC.md`
A complete feature specification combining both projects. Must include:
- All features from 121XQ (including graph interface, dashboards)
- All features from 121XQAI (Platform Workforce, Phase 1 MVP)
- Feature status: Implemented / In Progress / Planned
- Architecture decisions (locked M-series from Architect's MEMORY.md)
- Data model and API contracts
- Integration point for 121CostwiseEngine routing

### 3. Regeneration Prompt — `121XQ_REGENERATION_PROMPT.md`
A single, self-contained prompt that any AI (Claude, GPT-4, etc.) can use to fully reconstruct 121XQ from scratch. Must include:
- Complete system architecture
- All features and their acceptance criteria
- Tech stack (exact versions)
- Database schema
- API endpoints
- UI/UX description including graph interface
- Agent team and their roles
- Integration with 121CostwiseEngine

### 4. 121CostwiseEngine Integration Plan
Specify how 121CostwiseEngine sits in front of 121XQ:
- All user prompts to 121XQ pass through 121CostwiseEngine router first
- Router selects Claude (peak) or DeepSeek (off-peak/long) before hitting 121XQ's AI layer
- No user-facing change — routing is transparent
- API contract between 121XQ and 121CostwiseEngine

### 5. Delivery Plan
A practical, sprint-structured plan (AI-native timescales: hours/days) covering:
- Phase 1: Consolidation and SPEC (this session)
- Phase 2: 121CostwiseEngine integration
- Phase 3: Feature completion to production

Present this plan to RK when ready.

---

## TEAM ASSIGNMENTS (@CTO to assign)

| Task | Recommended Owner |
|------|------------------|
| Read extracted files, identify all features | @architect |
| Write SPEC file | @architect |
| Write regeneration prompt | @architect + @programmer |
| 121CostwiseEngine integration design | @architect |
| Sprint plan and timeline | @project-manager |
| QA sign-off gate definition | @qa |
| Deployment plan | @deployment |
| Compliance review of consolidated spec | @compliance |

---

## CONSTRAINTS
- @architect designs, does NOT implement
- @qa must sign off before any deploy
- @programmer implements per @architect specs only
- AI-native timescales only (ms/s/min/hours) — no human weeks/months
- All decisions ≥ architectural scope require @CTO sign-off
- Escalate blockers to Jaria → RK immediately

---

## FIRST ACTION
Run `RunExtract121XQ.bat`, then read `121XQ-Project-Extract.md`. Report back to Jaria with initial findings within this session.
