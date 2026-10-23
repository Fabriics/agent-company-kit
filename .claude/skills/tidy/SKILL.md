---
name: tidy
description: Pulizia della memoria del team - archivia il vecchio, compatta le lezioni, tiene i file corti per risparmiare token. Da lanciare una volta a settimana.
disable-model-invocation: true
---

Mantieni la memoria del team piccola e utile. Prima misura (`wc -l`) `CLAUDE.md`, `team/*.md`, `company/*.md`.

1. **`team/BOARD.md`** (obiettivo ≤ 60 righe): sposta le voci "Fatto" oltre le ultime 10 e le righe Inbox 🟢 chiuse in `team/archive/<AAAA-MM>.md` (append, con intestazione della data). Rimuovi dalla coda ciò che non è più rilevante, segnalandolo.
2. **`team/LEARNINGS.md`** (≤ 10 righe per sezione): unisci i duplicati, riscrivi in una riga le lezioni prolisse, archivia quelle superate. Non perdere lezioni ancora valide.
3. **`team/DECISIONS.md`**: oltre 60 righe → archivia le più vecchie, tieni le ultime 30.
4. **`CLAUDE.md`**: oltre ~100 righe → proponi al founder cosa spostare in `docs/` (non modificarlo da solo, salvo la sezione Azienda).
5. **`company/*.md`**: oltre ~60 righe → aggiungi una riga all'Inbox per il proprietario: "sintetizza".
6. Verifica che nessun file contenga segreti (chiavi, token, password): se ne trovi, segnalalo subito al founder.

Report (max 6 righe): righe prima → dopo per ogni file toccato, cosa è stato archiviato, eventuali azioni per il founder.
