# {{COMPANY}} — Operazioni del Team di Agenti (v1)

> Come funziona davvero il team di agenti: sessioni, memoria, protocolli, modelli, spawn.
> Pattern **orchestratore-worker** (raccomandato da Anthropic), memoria **file-based in repo**,
> agent teams nativi experimental da NON usare come infrastruttura.
> Questo file governa il COME; `docs/AGENT_TEAM.md` il CHI e il PERCHÉ.

---

## 1. Architettura: orchestratore-worker

- Il founder di norma parla con l'**Orchestrator** (`.claude/agents/orchestrator.md`); per un task puntuale può
  invocare direttamente un worker — ammesso, ma l'esito va comunque riportato nello stato condiviso.
- L'Orchestrator: decompone gli obiettivi → sceglie agente e modello → prepara il brief → lancia i worker →
  raccoglie i risultati → aggiorna lo stato.
- **I worker non spawnano altri worker** (evita l'esplosione dei costi): se un task sconfina in un altro dominio,
  il worker chiude con una proposta di *handoff* e l'Orchestrator decide.
- Parallelismo: **max 3-4 worker attivi**; ricerca/QA/monitoraggio in background; edit sullo stesso repo →
  sequenziali oppure `isolation: worktree`.
- Agent teams nativi di Claude Code: experimental (~7× il costo, non sopravvivono a `/resume`) → vietati come
  infrastruttura; consentiti solo per esperimenti one-off decisi da R&D.

## 2. Come si materializza un agente

- Definizione = un file `.claude/agents/<nome>.md`: frontmatter (`name`, `description`, `model`) + corpo che è il
  system prompt (missione, responsabilità, confini, skill, protocollo).
- Invocazione, tre modi:
  1. **Subagent** nella sessione corrente (auto-delega in base alla `description`, o esplicita: "usa l'agente X");
  2. **Sessione dedicata** Claude Code nel repo, aprendo col nome dell'agente;
  3. **Schedulata** per i ricorrenti (skill `/schedule` o cron): R&D settimanale, security mensile, ecc.
- Aggiungi il file di un agente SOLO quando skill/MCP necessari esistono (check su `AGENT_TEAM.md` + `docs/research/`).

## 3. Sessioni

- **1 task = 1 sessione.** Task piccoli e finibili (≤ mezza giornata di lavoro agente); più grandi → l'Orchestrator spezza.
- Continuità: a fine sessione `context-save`; alla ripresa `context-restore` (funziona anche cross-workspace).
- Long-running (build, monitor, sync): background task con notifica, non sessioni interattive aperte.
- Lavori paralleli sullo stesso repo: `isolation: worktree`.
- Branch di lavoro: `agent/<nome>/<slug-task>`.

## 4. Memoria — tutto file-based in repo (Memory MCP sconsigliato: fragile multi-agente)

| Livello | File | Chi scrive | Contenuto |
|---|---|---|---|
| Convenzioni | `CLAUDE.md` / `AGENTS.md` | founder | regole di progetto e di codice |
| Stato condiviso | `docs/team/STATE.md` | **solo Orchestrator** | cosa è in corso, chi ce l'ha, cosa è bloccato |
| Decisioni | `docs/team/DECISIONS.md` | Orchestrator + Founder-strategy | decision log **append-only** (data, decisione, perché) |
| Apprendimenti | `docs/team/LEARNINGS.md` | tutti, **append-only, ognuno nella propria sezione** | pattern di bug, trappole note, prompt vincenti |
| Standup | `docs/team/STANDUP.md` | Orchestrator (sovrascrive) | ultimo standup: fatto / in corso / bloccato / prossimo |
| Ricerca | `docs/research/` | R&D | verifiche web, free tier, release |

**Regola anti-conflitto:** ogni file ha UN proprietario di scrittura; gli altri leggono. È questo che sostituisce
il Memory MCP. La skill `learn` è il meccanismo automatico; LEARNINGS.md è il distillato curato. **Mai segreti
nei file di stato.**

## 5. Protocolli

### 5.1 Ciclo di vita del task
`intake → route (agente+modello) → brief (obiettivo, file, DoD, vincoli) → execute → gate → report → STATE.md`

### 5.2 Definition of Done (universale per il codice)
Gate del progetto verde (adatta ai comandi del tuo stack, es. `typecheck && test && build`) + review del diff.
In più: feature UI → verifica browser/screenshot; migration → additiva e reversibile, skill `guard`;
superfici di sicurezza → second-opinion `codex`.

### 5.3 Flusso bug
scoperta (chiunque) → repro minimo (**Bug Hunter**) → fix (**agente di dominio**) → regression test (**QA/E2E**)
→ entry in LEARNINGS.md. Nessun fix senza root cause (skill `investigate`).

### 5.4 Escalation al founder — SOLO per:
decisioni di prodotto/scope · qualsiasi spesa > 0€ · azioni irreversibili (migration distruttive, invii massivi,
pubblicazioni, delete) · output legale (sempre e solo bozze) · credenziali e accessi.
Tutto il resto si decide e si documenta in DECISIONS.md.

### 5.5 Formato report di fine sessione (ogni worker)
1) outcome in 1-3 righe · 2) file toccati · 3) verifiche eseguite (comandi/risultati) · 4) rischi aperti ·
5) eventuale handoff proposto.

## 6. Modelli (rubrica operativa)

| Modello | Chi lo usa |
|---|---|
| `fable` | Orchestrator, Founder-strategy (strategia, bassa frequenza) |
| `opus` | Security, R&D (valutazioni), legale, architettura una-tantum |
| `sonnet` | tutti i worker di esecuzione (default) |
| `haiku` | run ricorrenti ad alto volume: deploy, triage, monitoraggio, sync |
| Modello vision (API) | immagini/multimodale dentro i worker |
| Codex (skill) | second-opinion avversariale on-demand |

Regole: si può **declassare** il modello per un task banale, mai upgradare senza motivo; per i task ricorrenti
lanciare `benchmark-models` una-tantum e fissare il modello più economico sufficiente.

## 7. Spawn — quando e come (compila con la TUA squadra)

| Agente | Trigger | Cadenza | Modalità | Modello |
|---|---|---|---|---|
| orchestrator | inizio di ogni sessione di lavoro | quotidiana | interattiva | fable |
| founder-strategy | decisioni di scope, "vale la pena?" | settimanale / on-demand | interattiva | fable |
| rnd | radar release + costruzione skill | settimanale (schedulata) | background | opus (haiku per il monitor) |
| security | nuove superfici sensibili + audit mensile | event-driven + mensile | background | opus |
| qa-test | ogni PR / pre-merge | event-driven | background | sonnet |
| code-quality | report `health` settimanale | settimanale | background | sonnet |
| bug-hunter | caccia settimanale + dopo feature grosse | settimanale + event-driven | background | sonnet |
| frontend / backend | feature/fix di dominio | on-demand | interattiva / worktree | sonnet |
| _<i tuoi agenti di dominio>_ | ... | ... | ... | ... |

## 8. Controllo costi

1. Fable/Opus solo a bassa frequenza (§6); il volume gira su sonnet/haiku.
2. Max 3-4 worker paralleli; ricerca e QA in background, non interattive.
3. Niente agent teams experimental.
4. Sessioni lunghe sullo stesso contesto > tante sessioni brevi ripetute (prompt caching).
5. Gli agenti dormienti restano senza file in `.claude/agents/`: un agente non materializzato costa 0.
