---
name: kickoff
description: Configura il team di agenti per la tua azienda con un'intervista guidata di 5 minuti. Da lanciare una volta all'inizio (o per aggiornare il profilo).
disable-model-invocation: true
---

Configura l'Agent Company OS per l'azienda del founder. Sii rapido e concreto: una domanda alla volta è lenta, un modulo infinito pure.

## 1. Raccogli il contesto
- Guarda prima il repo (README, package.json o equivalenti, cartelle) per dedurre stack e comandi del gate: proponili, non chiederli.
- Se `CLAUDE.md` §Azienda è già compilato, mostra il profilo attuale e chiedi solo cosa cambiare.
- Altrimenti fai queste domande in UN solo messaggio (il founder può rispondere "non so": proporrai tu un default ragionevole):
  1. Nome e prodotto in una riga
  2. Per chi è (cliente ideale) e quale problema risolve
  3. Fase: idea · mvp · lancio · crescita
  4. Stack tecnico (o "no-code" / "non ancora deciso")
  5. Vincoli: budget mensile, ore a settimana, team umano
  6. Lingua del prodotto
  7. L'obiettivo più importante dei prossimi 30 giorni

## 2. Scrivi la memoria (solo le sezioni indicate, niente altro)
- `CLAUDE.md` → sostituisci i segnaposto della sezione `## Azienda`. Non toccare il resto del file.
- `company/STRATEGY.md` → Visione, Problema, ICP (bozza: segna con `(da validare)` ciò che è ipotesi).
- `company/TECH.md` → Stack e Gate, se noti.
- `team/BOARD.md` → Focus = obiettivo dei 30 giorni.
- `team/DECISIONS.md` → append: `<oggi> · Team configurato in fase <fase> · kickoff · chief-of-staff`.

## 3. Scegli la squadra (meno agenti attivi = meno token)
| Fase | Agenti attivi |
|---|---|
| idea | ceo, finance, researcher, product-manager, designer, marketing |
| mvp | idea + tech-lead, frontend, backend, devops, qa, security |
| lancio / crescita | tutti e 16 |

Se il prodotto è no-code o non software: tieni `tech-lead` (per i tool) e disattiva frontend, backend, devops, qa.
Mostra la proposta, chiedi conferma, poi sposta i file degli agenti esclusi in `.claude/agents-off/` (crea la cartella; usa `mv`, non cancellare).

## 4. Primo piano
- Leggi in `docs/PLAYBOOK.md` solo la sezione della fase scelta.
- Proponi 3-5 primi task concreti (agente + risultato atteso) e scrivili in `team/BOARD.md` → In coda.

## 5. Chiudi (max 8 righe)
Riassumi il profilo, la squadra attiva e i primi task. Ricorda al founder:
- se hai spostato agenti, **riavvia la sessione** (`/exit` e poi `claude`) perché la squadra viene caricata all'avvio;
- poi basta scrivere `/goal <obiettivo>` oppure parlare normalmente.
