# Playbook dello sciame di ricerca

> Il pezzo che non puoi saltare. Verifica sul web lo stack (MCP server, API, skill) per la TUA azienda,
> perché i suggerimenti "a memoria" invecchiano: nel 2026 Brave Search ed Eventbrite hanno perso il free tier.
> Output: un file per dominio in questa cartella, ognuno con verdetti **ADOTTA / ALTERNATIVA / EVITA** e fonti.

## Come si lancia
In una sessione Claude Code nel repo dell'azienda, lancia **6-8 agenti di ricerca in parallelo** (uno per
dominio), ognuno con accesso web (WebSearch/WebFetch). Prompt tipo: *"Lancia in parallelo N agenti
general-purpose, uno per ciascuno dei domini in docs/research/SWARM.md, usando i prompt-template lì; ognuno
scrive il suo report in docs/research/<dominio>.md"*.

Ogni agente deve: verificare lo stato **attuale** via web (non a memoria) · NON installare nulla · chiudere con
una tabella `item | verdetto | costo | fonte URL`.

## I domini

**Universali (valgono per ogni azienda) — 5:**
1. `mcp-core-dev` — MCP dello stack di sviluppo (repo host, deploy, DB, browser QA, error monitoring).
2. `analytics-growth` — analytics, SEO/Search Console, pagamenti, email, social scheduling, BI.
3. `testing-qa` — e2e sul tuo framework, a11y, performance/Lighthouse, visual regression, property-based.
4. `memory-orchestration` — feature attuali di Claude Code (subagent, hooks, background), memoria multi-agente, pattern e costi.
5. `skills-ecosystem` — quali delle tue skill [DA COSTRUIRE] esistono già pronte da usare/forkare.

**Verticali (scrivi tu 1-3 prompt sul TUO dominio) — es. per una map-app:**
6. `geo-maps` · 7. `data-ingestion` · 8. `ai-vision-messaging`.
Per un'altra azienda sostituisci con i tuoi: es. `payments-ledger`, `video-pipeline`, `iot-telemetry`…

---

## Prompt-template (compila `{{...}}`, poi affidali agli agenti)

### Template universale (per ogni dominio)
```
Sei un ricercatore tecnico. Contesto: {{COMPANY}} è {{PRODUCT_ONELINER}} (stack: {{STACK}}; vincoli:
{{CONSTRAINTS}}). Sto costruendo un team di subagent Claude Code e devo VERIFICARE lo stack per il dominio
"<DOMINIO>". Oggi è <DATA>: usa WebSearch e WebFetch per verificare lo stato ATTUALE — non fidarti della
memoria. NON installare nulla: solo ricerca.

Verifica questi item: <LISTA ITEM DEL DOMINIO>.
Per ognuno raccogli: Nome esatto verificato | Publisher e URL ufficiale | Come si usa da Claude Code (MCP o API)
| Auth/chiavi richieste | Free tier/limiti PRECISI | Stato manutenzione | Verdetto ADOTTA/ALTERNATIVA/EVITA
(una riga) | A quali agenti serve.

Scrivi il report IN {{LANG}} in docs/research/<dominio>.md. Max ~150 righe, chiudi con tabella riassuntiva
(item | verdetto | costo | fonte URL). Riporta la stessa tabella nella risposta finale. Non modificare altri file.
```

### Item suggeriti per i domini universali
- **mcp-core-dev:** MCP ufficiali per repo-host (GitHub/GitLab), deploy (Vercel/Netlify/Fly), DB (Supabase/…), browser QA (Playwright), error monitoring (Sentry). Verifica se Filesystem MCP serve (di solito no: Claude Code ha già Read/Write/Edit).
- **analytics-growth:** product analytics vs tabella eventi propria, Search Console API, pagamenti (Stripe MCP/Agent Toolkit), email transazionale+marketing free tier, social scheduling, BI su Postgres.
- **testing-qa:** Playwright MCP vs Playwright CLI vs `@playwright/test` in repo; a11y (axe); Lighthouse CI; visual regression a costo 0; property-based (fast-check).
- **memory-orchestration:** doc ufficiale Claude Code su subagent/hooks/background/agent-teams; Memory MCP vs stato file-based; Sequential Thinking (serve con extended thinking nativo?); pattern orchestratore-worker; coda task a costo 0 (Issues + markdown).
- **skills-ecosystem:** repo `anthropics/skills`, marketplace ufficiale, `awesome-claude-code`; per ogni tua skill [DA COSTRUIRE] cerca un match pubblico → USA COSÌ / FORKA / DA ZERO.

---

## Verdetti già noti (dall'istanza Araund, 2026-07 — RIVALIDA, non copiare ciecamente)
Utili come punto di partenza, ma legati a una data e in parte a un dominio:
- ✅ Ufficiali e gratuiti: Supabase, Vercel, GitHub, Playwright, Stripe, Sentry, Axe MCP.
- ❌ Da evitare: Filesystem MCP (ridondante), Memory MCP knowledge-graph (fragile multi-agente),
  Sequential Thinking (ridondante), Brave Search (free tier eliminato feb-2026),
  Google Maps/Places MCP (archiviato), Metabase MCP (immaturo), Eventbrite API (deprecata).
- ⏸ Rimandati: PostHog (se hai già una tabella eventi), n8n/Postiz (richiedono infra self-host).
- 🔑 Insight: Playwright CLI > Playwright MCP per gli agenti di coding (4-10× meno token).

> Questi cambiano. Rivalidarli è un compito ricorrente dell'agente R&D.
