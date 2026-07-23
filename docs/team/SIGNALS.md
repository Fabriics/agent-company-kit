# Segnali inter-agente (blackboard)

> Canale di comunicazione **any-to-any** del team. Qualunque agente APPENDE un segnale indirizzato a un altro
> (`@agente`) o a tutti (`@all`). L'**Orchestrator** è il router: consegna i segnali aperti e ne aggiorna lo stato.
> Regole: `docs/AGENT_OPS.md` §5.6. **Append-only**: non riscrivere i segnali altrui, aggiungi in fondo.

## Formato
- **tipo:** finding · domanda · suggerimento · handoff
- **stato:** 🟡 open · 🔵 routed · 🟢 done

## Log
| data | from → to | tipo | messaggio | stato |
|---|---|---|---|---|
| _(esempio, cancellami)_ | bug-hunter → @backend | finding | descrizione del problema + repro minimo | 🟢 done |
