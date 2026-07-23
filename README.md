# Agent Company Kit

> Un **sistema operativo riutilizzabile** per fondare e costruire un'azienda con un team di agenti Claude Code.
> Distillato da un caso reale (Araund, web app map-events; founder solo, budget ~0) tenendo **solo lo strato
> agnostico**: il metodo, non il contenuto di dominio.

## Cosa contiene

| File / cartella | Cos'è | Riutilizzo |
|---|---|---|
| `AGENT_OPS.md` | Il sistema operativo: orchestratore-worker, sessioni, memoria, protocolli, modelli, spawn, costi | **Copia così com'è** |
| `AGENT_TEAM.template.md` | Catalogo dei ruoli con `{{PLACEHOLDER}}` + menu completo dei 41 ruoli possibili | **Compila i placeholder** |
| `.claude/agents/*.md` | 8 agenti **generici** (orchestrator, founder-strategy, rnd, security, qa-test, code-quality, bug-hunter) + 2 template (frontend, backend) | Copia i generici; adatta i template |
| `docs/research/SWARM.md` | Il **playbook dello sciame di ricerca**: come verificare sul web lo stack MCP/API/skill per la tua azienda | **Rilancia per ogni azienda** |
| `docs/team/*.md` | I 4 file di stato condiviso (STATE, DECISIONS, LEARNINGS, STANDUP), vuoti | Copia così com'è |
| `SETUP.md` | Checklist passo-passo per istanziare il kit su una nuova azienda | Segui una volta per azienda |

## I due strati (perché il kit funziona)

1. **Strato riutilizzabile (qui dentro):** il modo in cui un team di agenti si organizza, ricorda, decide e
   controlla i costi. Non cambia tra un'azienda e l'altra.
2. **Strato di dominio (NON qui):** le trappole del tuo stack, gli agenti di business specifici, le scelte di
   API. Va reinstanziato ogni volta — ed è esattamente ciò che `SWARM.md` + `SETUP.md` ti guidano a fare.

> ⚠️ **Lo stack ha una data di scadenza.** I free tier cambiano di continuo (Brave Search ed Eventbrite sono
> caduti nel 2026). Non fidarti di uno stack "a memoria": rilancia sempre lo sciame di ricerca per la nuova azienda.

## Quick start

Leggi `SETUP.md`. In sintesi: copi il kit nel repo della nuova azienda → compili i placeholder di
`AGENT_TEAM.template.md` → rilanci lo sciame `SWARM.md` per verificare lo stack → materializzi gli agenti
dell'Ondata 1 in `.claude/agents/`.

## Riferimento vivo

L'istanza completa e funzionante di questo kit è **Araund** (`~/Desktop/araund/docs/AGENT_TEAM.md`,
`AGENT_OPS.md`, `.claude/agents/`). Quando un template qui è astratto, guarda lì come esempio concreto.
