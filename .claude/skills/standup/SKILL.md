---
name: standup
description: Standup in 30 secondi - cosa è fatto, in corso, bloccato e cosa fare adesso. Leggero, da lanciare a inizio giornata.
model: haiku
disable-model-invocation: true
---

Produci lo standup del team leggendo SOLO:
- `team/BOARD.md`
- le ultime 15 righe di `team/DECISIONS.md` (es. `tail -n 15`)

Non aprire altri file e non lanciare agenti.

Rispondi in max 12 righe, in questo formato:
**✅ Fatto** · **🔄 In corso** · **🚧 Bloccato / serve il founder** · **📨 Inbox aperta** (chi → chi, in una riga ciascuno) · **👉 Le 3 cose da fare oggi** (in ordine di impatto, con l'agente).

Se la board è vuota o non configurata, suggerisci `/kickoff`. Se supera ~60 righe, suggerisci `/tidy`.
Chiudi chiedendo: "Parto dalla prima?"
