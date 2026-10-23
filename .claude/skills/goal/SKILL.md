---
name: goal
description: Trasforma un obiettivo in task, li assegna ai reparti giusti e li porta a termine coordinando gli agenti.
argument-hint: <obiettivo, es. "lanciare la waitlist entro venerdì">
disable-model-invocation: true
---

Obiettivo del founder: **$ARGUMENTS**

Se l'obiettivo è vuoto, chiedilo in una riga e fermati.

## 1. Pianifica (senza leggere più del necessario)
- Leggi `team/BOARD.md`. Dalla fase in `CLAUDE.md` leggi solo la sezione corrispondente di `docs/PLAYBOOK.md`.
- Se l'obiettivo è piccolo (1-2 passi, un solo reparto) fallo direttamente o con un solo agente: niente piano.
- Altrimenti spezzalo in max 7 task. Per ciascuno: agente · risultato verificabile · dipendenze.
- Chiedi conferma al founder SOLO se il piano include spese, azioni irreversibili, pubblicazioni o cambi di scope. Altrimenti procedi e mostra il piano in 5-7 righe.
- Scrivi Focus e task in `team/BOARD.md`.

## 2. Esegui
- Lancia in parallelo i task indipendenti (max 3); quelli dipendenti o sugli stessi file in sequenza.
- Ogni agente riceve un brief nel formato di `CLAUDE.md` (OBIETTIVO · CONTESTO · FATTO QUANDO · VINCOLI · NON FARE) con dentro i fatti che gli servono, così non deve rileggere i file.
- A ogni report: verifica l'esito (per il codice: gate verde), aggiorna la board, instrada gli handoff proposti e le righe 🟡 dell'Inbox pertinenti.
- Se un task fallisce due volte, fermati e porta il problema al founder con una proposta.

## 3. Chiudi (max 10 righe)
Fatto · cosa resta · cosa serve dal founder · prossimo passo consigliato. Registra le decisioni prese in `team/DECISIONS.md` (una riga ciascuna).
