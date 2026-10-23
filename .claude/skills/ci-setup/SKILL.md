---
name: ci-setup
description: Imposta o sistema la CI/CD su GitHub Actions - gate automatico su push e PR, aggiornamenti delle dipendenze con Dependabot, deploy di anteprima e produzione, protezione del branch main.
---

# CI/CD in un pomeriggio

Obiettivo: nessun codice arriva su `main` senza gate verde, e il deploy è automatico e reversibile.

## 1. Rileva (non chiedere ciò che puoi leggere)
- Comandi del gate: `CLAUDE.md` §Azienda o `company/TECH.md`; altrimenti deducili da `package.json` (scripts), `pyproject.toml`, `Makefile` e chiedi conferma.
- Runtime e package manager: lockfile, `.nvmrc`, `engines`, `.python-version`.
- Workflow esistenti in `.github/workflows/`: non sovrascriverli, proponi le modifiche.

## 2. `.github/workflows/ci.yml`
- Trigger: `push` su `main` e `pull_request`.
- `permissions: contents: read` (minimo privilegio) e `concurrency` che annulla le run superate.
- Setup del runtime con cache, installazione dal lockfile (`npm ci`, `pnpm install --frozen-lockfile`, `pip install -r …`).
- Uno step per ogni comando del gate, con nome leggibile.
- Azioni di terze parti fissate a una versione (meglio a SHA). Segreti solo come `${{ secrets.NOME }}`, mai in chiaro.

## 3. `.github/dependabot.yml`
Aggiornamenti settimanali raggruppati per l'ecosistema del progetto e per `github-actions`.

## 4. Deploy
- Se l'hosting ha l'integrazione Git (Vercel, Netlify, Render, Railway…), usala: anteprima su ogni PR, produzione su `main`. Niente workflow di deploy duplicato.
- Altrimenti `deploy.yml` su `main` con environment `production` e approvazione manuale.
- Deploy in produzione e segreti nuovi: servono l'ok del founder.

## 5. Verifica
- Esegui in locale i comandi del gate; valida i YAML (`actionlint` se disponibile).
- Se è installata la skill `agentic-actions-auditor`, passale i workflow.

## 6. Consegna al founder (passi che non puoi fare tu)
- GitHub → Settings → Branches: proteggi `main` (CI verde obbligatoria, PR obbligatoria).
- GitHub → Settings → Secrets: aggiungi i segreti citati nei workflow (solo i nomi nel report).
- Opzionale: `/install-github-app` per far revisionare le PR a Claude.

Report: file creati, comandi del gate usati, cosa deve fare il founder, handoff a `tech-lead` per aggiornare `company/TECH.md`.
