---
name: add-skills
description: Installa le skill aggiuntive consigliate (design, marketing, Instagram/TikTok, sicurezza, CI/CD) solo per i reparti attivi, scegliendo dal catalogo del kit.
argument-hint: [fase | reparto | nome skill]
disable-model-invocation: true
---

Richiesta: **$ARGUMENTS** (se vuota: il pacchetto consigliato per la fase attuale).

1. **Contesto** — leggi `docs/SKILLS.md`. Controlla la fase in `CLAUDE.md`, gli agenti attivi (`ls .claude/agents`) e cosa è già installato (`ls .claude/skills`, `claude plugin list`).
2. **Proposta** — max ~12 skill, solo per agenti attivi e per la fase, il reparto o il nome richiesto. Mostra una tabella: skill · agente · tipo · licenza o nota (es. Remotion, account Postiz). Ricorda in una riga che ogni skill aggiunge la sua descrizione al contesto di ogni sessione.
3. **Conferma** — chiedi l'ok al founder: è codice di terze parti che gira con i permessi dell'agente. Non installare nulla senza un sì.
4. **Installa** — usa esattamente i comandi del catalogo, sempre a livello di progetto (mai `-g`; plugin e marketplace con `--scope project`). Raggruppa le skill dello stesso repo in un solo comando `npx skills add`. Prerequisiti: Node ≥ 22.20 per `npx skills`, Python 3 per `ui-ux-pro-max`. Se un comando fallisce mostra l'errore e prosegui con gli altri.
5. **Collega** — se hai installato skill di marketing e manca `.agents/product-marketing.md`, crealo con la skill `product-marketing` partendo da `company/STRATEGY.md` e `company/GTM.md`.
6. **Chiudi** (max 8 righe) — installate / fallite / saltate. Append in `team/DECISIONS.md`: `<oggi> · skill installate: <elenco> · add-skills · chief-of-staff`. Ricorda di riavviare la sessione (`/exit`, poi `claude`) e come rimuoverle (`npx skills remove <skill>`, `claude plugin uninstall <plugin>`).
