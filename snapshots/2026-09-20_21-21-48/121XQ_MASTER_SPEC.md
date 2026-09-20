# 121XQ — MASTER SPECIFICATION
**Version:** 1.0
**Owner:** Rashad Khan (CEO, One to One Solutions USA)
**Author:** @CTO (Yasmine Amira Ison)
**Date:** 2026-09-20
**Status:** AUTHORITATIVE — supersedes all prior 121XQ and 121XQAI specs

---

## 1. PRODUCT VISION

121XQ is the AI-native intelligence platform for the One to One Group. It combines a **visual graph brain map** (CRUD knowledge graph), **AI agent dashboards**, and a **multi-tenant platform** for clients. All AI traffic routes transparently through 121CostwiseEngine.

**Core promise:** One unified platform where knowledge, agents, data, and AI work together — visually, interactively, at One to One speed.

---

## 2. CONSOLIDATED ARCHITECTURE

```
121XQ.com
├── Graph Brain Map (Graphify)       ← PRIORITY 1 — preserve from 121XQ
├── Executive Dashboard              ← preserve from 121XQAI
├── Agent Management Console         ← preserve from 121XQAI
├── 121CostwiseEngine Router         ← NEW integration layer
├── REST API + WebSocket Server      ← Node.js/TypeScript
├── Database Layer                   ← MySQL + PostgreSQL
└── Auth + Multi-tenancy             ← JWT, role-based
```

**Deployment target:** 121xq.com on HostArmada (172.241.29.6, port 19199)
**Stack:** Node.js / TypeScript (API), React (frontend), MySQL/PostgreSQL (data), Redis (cache)

---

## 3. FEATURE SPECIFICATION

### 3.1 GRAPH BRAIN MAP (Graphify) — MUST PRESERVE

**Description:** Obsidian-style CRUD graph interface for objects and relationships.

**Core model:**
- **Nodes** = Objects (entities: people, companies, concepts, events, assets, etc.)
- **Edges** = Attributes and relationships between nodes
- **Cache layer** = Edits held in memory until user presses Update
- **Update button** = Single action to persist all pending changes to data store

**Interaction model:**
| Action | Behaviour |
|--------|-----------|
| Click node | Open node detail panel — view/edit fields |
| Drag node | Reposition on canvas |
| Double-click canvas | Create new node |
| Click + drag node to node | Create edge (relationship) |
| Right-click edge | Label/edit/delete relationship |
| Search bar | Filter nodes by label, type, or field value |
| Update button | Flush cache → persist to data store |

**Input model agnostic:** Graph data can be backed by:
- NTFS file system (JSON files)
- Google Drive (JSON in Drive)
- Unix/Linux filesystem
- Database (MySQL/PostgreSQL)
- Future: SharePoint, S3

**Visual features:**
- Force-directed layout (auto-arrange)
- Manual layout (pin nodes, drag to organise)
- Zoom in/out, pan
- Node types shown by colour/icon
- Edge labels visible on hover
- Full-text search with highlight

**Confirmed use cases (RK):**
1. **Knowledge graph / brain map** — general purpose object mapping for 121XQ
2. **Genealogy / family tree** — integrates with Shajra.121.us and NADRA data
   - Nodes = persons (name, DOB, place of birth, CNIC, relationships)
   - Edges = family relationships (parent, spouse, sibling, child)
   - Source: NADRA API (existing agreement with RK), Shajra.121.us existing data

---

### 3.2 EXECUTIVE DASHBOARD

Preserved from 121XQAI. Dark theme, blue/purple gradient.

**Dashboard modules:**
- Token Account (usage, spend, budget)
- Performance Monitoring (response times, error rates)
- User Analytics (active users, sessions, retention)
- Billing Dashboard (costs, invoices, projections)
- Vertical Performance (per-product metrics)
- Agent Management (agent status, task queues)
- Compliance & Audit (GDPR, ISO, SOC2 status)
- GRAFI Visualisations (graph-based data views)

**Responsiveness:** Desktop first, mobile-compatible.

---

### 3.3 AGENT MANAGEMENT CONSOLE

- List all deployed agents with status (active/idle/error)
- Agent memory viewer (read MEMORY.md files)
- Task queue viewer
- Agent assignment to projects
- Token budget per agent

---

### 3.4 121COSTWISEENGINE INTEGRATION

All AI calls from 121XQ route through the CostwiseEngine proxy — transparent to users.

**Routing logic:**
- Peak hours (06:00–22:00 UTC): Claude Sonnet 4.6
- Off-peak OR prompts >8,000 chars: DeepSeek
- Fallback chain: primary → secondary → tertiary backend

**Integration method:**
- 121XQ API calls CostwiseEngine endpoint (internal)
- CostwiseEngine returns AI response + routing metadata
- 121XQ logs cost, model used, latency per request

**CostwiseEngine endpoint:** `http://172.241.29.6:19199/v1/chat` (internal)

---

### 3.5 API SPECIFICATION

**Base URL:** `https://121xq.com/api/v1`

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/graph/nodes` | GET | List all nodes |
| `/graph/nodes` | POST | Create node |
| `/graph/nodes/:id` | GET/PUT/DELETE | CRUD single node |
| `/graph/edges` | GET/POST | List/create edges |
| `/graph/edges/:id` | PUT/DELETE | Update/delete edge |
| `/graph/cache` | POST | Push cache state |
| `/graph/cache/flush` | POST | Persist cache to store |
| `/dashboard/metrics` | GET | All dashboard metrics |
| `/agents` | GET | List agents |
| `/agents/:id/memory` | GET | Read agent memory |
| `/ai/chat` | POST | CostwiseEngine proxied AI call |
| `/auth/login` | POST | JWT login |
| `/auth/refresh` | POST | Refresh token |

**WebSocket:** `wss://121xq.com/api/live` — real-time dashboard updates

---

### 3.6 DATABASE SCHEMA (KEY TABLES)

```sql
-- Graph nodes
CREATE TABLE nodes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  type VARCHAR(100) NOT NULL,
  label VARCHAR(500),
  fields JSONB,
  tenant_id UUID,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Graph edges
CREATE TABLE edges (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  source_id UUID REFERENCES nodes(id),
  target_id UUID REFERENCES nodes(id),
  relationship VARCHAR(200),
  weight FLOAT DEFAULT 1.0,
  fields JSONB,
  tenant_id UUID,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Graph cache (pre-persist staging)
CREATE TABLE graph_cache (
  session_id UUID,
  node_id UUID,
  edge_id UUID,
  operation VARCHAR(10), -- INSERT/UPDATE/DELETE
  payload JSONB,
  cached_at TIMESTAMP DEFAULT NOW()
);

-- Tenants (multi-tenant)
CREATE TABLE tenants (
  id UUID PRIMARY KEY,
  name VARCHAR(200),
  plan VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW()
);
```

---

## 4. TECHNOLOGY STACK

| Layer | Technology |
|-------|-----------|
| Frontend | React 18, TypeScript, CSS Variables (dark/light theme) |
| API | Node.js 20 LTS, Express / Fastify, TypeScript |
| Graph engine | D3.js (force-directed) + custom canvas layer |
| Database | PostgreSQL (primary), MySQL (legacy compat) |
| Cache | Redis 7 |
| Auth | JWT (httpOnly cookies) — no hardcoded secrets |
| Deployment | HostArmada VPS, PM2, Nginx reverse proxy |
| CI/CD | GitHub Actions → 121solutions/121costwiseengine infra |
| AI routing | 121CostwiseEngine (FastAPI + LiteLLM) |
| Monitoring | DataDog / health endpoints |

---

## 5. WHAT GETS MERGED (FROM 121XQ + 121XQAI)

### KEEP from 121XQ:
- Graphify agent (index.ts, OBJECT_MAPPING.md, INTEGRATION.md) — CORE
- Graph canvas and node/edge rendering
- ROBOTS.txt, README

### KEEP from 121XQAI:
- Dashboard UI (dark theme, all 8 modules)
- DEPLOY_PACKAGE (setup.sh, database_setup.sh)
- DEPLOYMENT.md, HOSTARMADA_DEPLOYMENT.md
- QA_TESTING_PROCEDURES.md
- docker-compose.yml
- Browser shell / kernel bridge (src/browser/)
- package.json

### PARK (do not merge yet):
- 121XMLSilicon (hardware emulator) — separate project, not part of 121XQ platform
- 121XQ Phase 2.MD — review separately for Phase 2 roadmap

---

## 6. PHASE PLAN

### Phase 1 — MVP (Target: Oct 2026)
- Graph brain map: CRUD nodes + edges, cache + Update button ✅
- Dashboard: Executive + Performance modules ✅
- API: graph CRUD + auth ✅
- CostwiseEngine integration ✅
- Deploy to 121xq.com ✅

### Phase 2 — Q1 2027
- Genealogy use case: NADRA integration, family tree schema
- Shajra.121.us data import into graph
- Multi-tenant: client onboarding, isolated graph spaces
- Mobile-responsive graph view
- Agent management console

### Phase 3 — Q2 2027
- Subscription model (121Updates microsite integration)
- Public API (third-party graph data import)
- 121MetaVerse spatial view layer integration
- Advanced analytics on graph data

---

## 7. NON-FUNCTIONAL REQUIREMENTS

| Requirement | Target |
|-------------|--------|
| API response time | <200ms p95 |
| Graph render (1,000 nodes) | <2s |
| Uptime | 99.9% |
| Test coverage | ≥85% |
| Auth | JWT httpOnly, no secrets in code |
| GDPR | Data isolation per tenant, right to erasure |
| Code quality | 2+ PR approvals, SAST on every pipeline |

---

## 8. DEPLOYMENT (HOSTARMADA)

**Target:** dal2.hostclusters.com:19199 (same server as 121CostwiseEngine)
**Domain:** 121xq.com (already live — preserve uptime during migration)
**Process:**
1. Build React frontend → `npm run build`
2. Bundle API → `npm run build` (TypeScript → dist/)
3. scp to HostArmada, extract to `/var/www/121xqai/`
4. Run `database_setup.sh` for schema migrations
5. Start via PM2: `pm2 start app.js -i max --name 121xqai`
6. Nginx config: static → `/var/www/121xqai/public`, API → `localhost:8080`
7. Health check: `curl https://121xq.com/api/v1/health`

**RK approval required before any production deployment.**

---

## 9. OPEN ITEMS FOR RK DECISION

| Item | Question |
|------|----------|
| Graph data backend default | Start with PostgreSQL or keep MySQL? Recommend PostgreSQL. |
| Shajra.121.us | Migrate existing data into 121XQ graph, or keep separate? |
| NADRA integration | Which NADRA API endpoints to prioritise for genealogy? |
| Multi-tenant Phase 1 | Single tenant first (faster) or multi-tenant from day 1? Recommend single first. |

---

*Produced by @CTO — 2026-09-20*
*Next deliverable: 121XQ_REGENERATION_PROMPT.md*
