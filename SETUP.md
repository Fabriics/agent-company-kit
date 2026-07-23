# SETUP — istanziare il kit su una nuova azienda

> Da zero a "team operativo" in ~un pomeriggio. Riferimento concreto: l'istanza Araund.

## 0. Prerequisiti
- Un repo git per la nuova azienda (anche solo `git init`).
- Claude Code installato (terminale o estensione VS Code / JetBrains).
- Un'idea chiara di: cosa fa il prodotto, lo stack tecnico, i vincoli (budget, lingua, tempo).

## 1. Copia lo strato agnostico nel repo della nuova azienda
```bash
cp AGENT_OPS.md            <nuovo-repo>/docs/AGENT_OPS.md
cp -r docs/team            <nuovo-repo>/docs/team
cp -r .claude/agents       <nuovo-repo>/.claude/agents
cp AGENT_TEAM.template.md  <nuovo-repo>/docs/AGENT_TEAM.md
```

## 2. Compila i placeholder
In `docs/AGENT_TEAM.md` e nei file `.claude/agents/*.md` sostituisci:

| Placeholder | Significato | Esempio (Araund) |
|---|---|---|
| `{{COMPANY}}` | nome azienda/prodotto | Araund |
| `{{PRODUCT_ONELINER}}` | una riga su cosa fa | web app map-events per la Puglia |
| `{{STACK}}` | stack tecnico | Next.js 16, React 19, Tailwind 4, Supabase, Vercel, MapLibre |
| `{{CONSTRAINTS}}` | vincoli trasversali | founder solo, budget ~0, UI in italiano |
| `{{LANG}}` | lingua di UI/testi | italiano |
| `{{CRITICAL_TRAPS}}` | trappole note dello stack | SSR `window`, service-role bypassa RLS, `params` Promise |
| `{{DOMAIN_SURFACES}}` | superfici sensibili di sicurezza | upload, auth magic-link, redirect `next`, `/admin` |
| `{{PILOT_STRATEGY}}` | strategia go-to-market | saturare una città-pilota, distribuzione dentro il prodotto |

Suggerimento: apri una sessione Claude Code e chiedi *"compila tutti i placeholder di questi file con il
contesto della mia azienda: <descrizione>"*.

## 3. Scegli i ruoli attivi (menu → squadra)
`AGENT_TEAM.template.md` elenca i **41 ruoli possibili**. Non attivarli tutti: parti dall'**Ondata 1** (12
agenti a zero skill da costruire). Cancella dal documento i ruoli che non ti servono e aggiungi quelli di
dominio tuoi (es. per Araund: map-geo, data-ingestion, venue-acquisition, seo-local).

## 4. Rilancia lo sciame di ricerca (IL passo che non puoi saltare)
Segui `docs/research/SWARM.md`: lancia gli agenti di ricerca web in parallelo per **verificare** MCP server,
API e skill adatti al TUO stack e ai TUOI free tier. Non copiare lo stack di Araund: alcune scelte sono
sue (ECT Puglia, Ticketmaster eventi), i free tier cambiano. Output → `docs/research/*.md`.

## 5. Materializza l'Ondata 1
Gli 8 agenti generici sono già in `.claude/agents/`. Aggiungi i tuoi agenti di dominio (frontend/backend
adattati + gli specifici del tuo prodotto) usando gli stessi file come modello. Riempi la tabella di spawn
in `AGENT_OPS.md` §7 con la tua squadra.

## 6. Primo giro
```bash
# nel repo della nuova azienda
claude
> usa l'agente orchestrator: leggi docs/AGENT_TEAM.md e docs/AGENT_OPS.md,
  poi proponi i primi 3 task e instradali.
```
L'orchestrator aggiorna `docs/team/STATE.md` e parte.

## 7. Ondate successive
Man mano che l'agente **rnd** costruisce le skill mancanti (o le forka dall'ecosistema pubblico), attivi gli
agenti delle ondate 2+. Regola d'oro: **un agente si materializza solo quando le sue skill/MCP esistono** —
un agente senza strumenti è teatro.

---

### Checklist finale
- [ ] `docs/AGENT_OPS.md`, `docs/AGENT_TEAM.md`, `docs/team/`, `.claude/agents/` nel repo
- [ ] tutti i `{{PLACEHOLDER}}` sostituiti
- [ ] ruoli non necessari rimossi, agenti di dominio aggiunti
- [ ] sciame di ricerca rilanciato → `docs/research/` popolato per il tuo stack
- [ ] tabella spawn `AGENT_OPS.md` §7 aggiornata
- [ ] primo giro dell'orchestrator eseguito
