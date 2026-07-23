# Team di Subagent per {{COMPANY}} — template

> Compila i `{{PLACEHOLDER}}` (vedi `SETUP.md` §2), poi tieni solo i ruoli che ti servono.
> `{{PRODUCT_ONELINER}}` · Stack: `{{STACK}}` · Vincoli: `{{CONSTRAINTS}}`.

## Come leggere questo documento
Per ogni ruolo: *Di cosa si occupa · Perché (leva) · Skill · MCP/API · Modello*.
- **Skill** = verifica quali esistono su disco (`~/.claude/skills`) o nell'ecosistema pubblico (vedi lo sciame); se manca → **[DA COSTRUIRE]**.
- **MCP/API** = da **verificare con lo sciame di ricerca** (`docs/research/SWARM.md`) — NON fidarti di suggerimenti a memoria.
- **Modello** = `primario → fallback economico` secondo la rubrica di `AGENT_OPS.md` §6.

---

## Menu completo dei ruoli (41) — scegli la tua squadra

Attiva solo ciò che ti serve ora. **Ondata 1 consigliata (12, zero skill da costruire)** in **grassetto**.

### 1. Engineering Core
- **1.1 Frontend** — componenti, UI, design system. `sonnet`.
- **1.2 Backend** — server, dati, auth, sicurezza applicativa. `sonnet`.
- 1.3 DB/Migration — schema, migration additive/reversibili. `sonnet`.
- 1.4 Performance — Core Web Vitals, bundle, regressioni. `sonnet`.
- _<agente di dominio 1: il cuore tecnico del tuo prodotto, es. Map/Geo, Realtime, ML…>_

### 2. Engineering Platform & Quality
- 2.1 AI/Feature-core — la feature "wow" del prodotto (se AI-driven). vision/`sonnet`.
- 2.2 DevOps — deploy, env, preview, incident response. `haiku` → sonnet.
- **2.3 QA/Test** — gate `typecheck+test+build`, unit/funzionale. `sonnet`.
- **2.4 Security** — superfici sensibili, OWASP, threat modeling. `opus`.
- **2.5 E2E Journey** — flussi critici completi su browser + a11y. `sonnet`.
- **2.6 Code Quality** — debito, dead code, dipendenze, `health`. `sonnet`.
- **2.7 Bug Hunter** — caccia esplorativa avversariale. `sonnet`.
- 2.8 Mobile — app nativa (dorme finché non serve). `opus`.

### 3. Product & Design
- 3.1 Product/Roadmap · 3.2 UX Research · 3.3 UI Design · 3.4 Design System · 3.5 Copy · 3.6 Motion.

### 4. Data & Growth
- 4.1 Analytics/BI · 4.2 Investor Metrics · **4.3 SEO/Local** · 4.4 Content/Social · 4.5 Lifecycle/CRM · 4.6 Performance Marketing · 4.7 Brand/PR.

### 5. GTM & Ops
- **5.1 Acquisition** (lato offerta/domanda della tua marketplace o funnel) · 5.2 Activation · 5.3 Partnership · 5.4 Support · 5.5 Moderation.

### 6. Finance, Legal & Strategy
- 6.1 Pricing/Monetization · 6.2 Unit Economics · 6.3 GDPR/Privacy · 6.4 Terms/Liability · **6.5 Founder/CEO strategy**.
- 6.6 Competitive Intelligence.

### 7. Meta & Orchestrazione
- **7.1 Orchestrator/Chief-of-Staff** — routing, memoria, standup. `fable`.
- **7.2 R&D/Innovation** — radar tecnologico, benchmark, costruisce le skill mancanti. `opus`.

---

## Schede dettagliate (esempio — duplica il pattern per ogni ruolo attivo)

### 1.1 Frontend
- **Di cosa si occupa:** componenti e UI in `{{STACK}}`, coerenza col design system, stati empty/loading/error, responsive, a11y di base. Testi in `{{LANG}}`.
- **Perché:** l'interfaccia è il primo contatto; le trappole del framework (`{{CRITICAL_TRAPS}}`) si fissano una volta.
- **Skill:** `design-review`, `qa`, `investigate`, `codex` (+ native `simplify`/`code-review`).
- **MCP/API:** _da verificare con lo sciame_.
- **Modello:** sonnet → haiku.

### 2.4 Security
- **Di cosa si occupa:** superfici sensibili di `{{COMPANY}}` (`{{DOMAIN_SURFACES}}`), segreti, OWASP, threat modeling.
- **Perché:** un founder solo non può permettersi buchi.
- **Skill:** `cso`, `codex`, `review`, `guard`.
- **MCP/API:** _da verificare_ (tipicamente: secret scanning, error monitoring).
- **Modello:** opus → sonnet (+ Codex avversariale).

> Completa le altre schede prendendo a modello l'istanza Araund (`~/Desktop/araund/docs/AGENT_TEAM.md`),
> che le ha tutte compilate.

---

## Appendice — rollout consigliato
**Ondata 1** (subito, zero skill da costruire): i 12 ruoli in grassetto sopra + i tuoi 1-2 agenti di dominio se
hanno già skill/MCP. Attiva **Orchestrator per primo** (instrada tutti) e **R&D** (costruisce le skill mancanti).
**Ondate 2+** man mano che R&D costruisce/forka le skill e installi lo stack verificato dallo sciame.
