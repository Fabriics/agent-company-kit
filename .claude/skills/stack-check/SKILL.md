---
name: stack-check
description: Verifica sul web tool, API, MCP e free tier per il tuo stack, con verdetti ADOTTA / ALTERNATIVA / EVITA e fonti. Da lanciare all'inizio e poi una volta al mese.
argument-hint: [domini opzionali, es. "pagamenti, email"]
disable-model-invocation: true
---

I free tier e i tool cambiano di continuo: niente scelte "a memoria". Domini richiesti: **$ARGUMENTS** (se vuoto usa quelli sotto).

## Domini predefiniti
1. **sviluppo** — hosting/deploy, database, repo e CI, error monitoring.
2. **qualità** — test e2e e browser, accessibilità, performance.
3. **crescita** — analytics, email transazionali e marketing, pagamenti, social scheduling.
4. **ai** — modelli e API AI (solo se il prodotto usa AI).
5. **verticale** — 1 dominio specifico del prodotto, ricavato da `CLAUDE.md` §Azienda.

Salta i domini irrilevanti per la fase o lo stack (es. niente "crescita" in fase idea, salvo landing/waitlist).

## Esecuzione
- Lancia un agente `researcher` per dominio, max 3 in parallelo. Brief: profilo dell'azienda in 3 righe (stack, budget, fase), dominio, la data di oggi, "verifica lo stato ATTUALE sul web, non installare nulla, scrivi `docs/research/<dominio>.md`, max ~100 righe, chiudi con tabella `voce | verdetto | costo e free tier | fonte`".
- Criteri di verdetto: ufficiale e mantenuto, free tier sufficiente per la fase, poco costo di contesto (una CLI spesso costa meno token di un server MCP equivalente).

## Sintesi
Scrivi `docs/research/STACK.md` (max ~40 righe): una tabella unica con i verdetti e la data. Poi:
- handoff a `tech-lead` per aggiornare `company/TECH.md`;
- handoff a `finance` per i costi in `company/FINANCE.md`;
- installazioni di MCP o servizi a pagamento → chiedi al founder.

Report finale in max 8 righe.
