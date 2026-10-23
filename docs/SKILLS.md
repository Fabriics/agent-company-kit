# Catalogo skill aggiuntive

> Letto da `/add-skills`. Le skill di terze parti **non sono incluse nel kit**: si installano dalla fonte originale,
> così restano aggiornate e ognuna mantiene la sua licenza. Verificato il 2026-10-23.

**Regola token:** ogni skill installata aggiunge la sua descrizione al contesto di ogni sessione (il listino ha un tetto
di circa l'1% del contesto: oltre, Claude scarta le descrizioni meno usate). Installa solo le skill degli agenti attivi.
Per un plugin, `claude plugin details <nome>` mostra il costo in token stimato.

## Come si installano
| Tipo | Comando (dalla cartella del progetto) |
|---|---|
| **skill** (da repo) | `npx skills add <repo> -s <skill...> -a claude-code -y --copy` · richiede Node ≥ 22.20 |
| **plugin** (marketplace) | `claude plugin marketplace add <repo> --scope project` poi `claude plugin install <plugin>@<marketplace> --scope project` |
| **plugin ufficiale** | `claude plugin install <plugin>@claude-plugins-official --scope project` |
| **incluso** | già nel kit o in Claude Code, niente da installare |

Rimozione: `npx skills remove <skill>` · `claude plugin uninstall <plugin>`. Dopo ogni installazione: riavvia la sessione.

## 🎨 Design e UI/UX → `designer`, `frontend`
| Skill | Tipo | A cosa serve | Fonte · licenza |
|---|---|---|---|
| `ui-ux-pro-max` | plugin · marketplace `ui-ux-pro-max-skill` | stili, palette, font, regole UX, design system per stack | `nextlevelbuilder/ui-ux-pro-max-skill` · MIT · richiede Python 3 |
| `frontend-design` | plugin ufficiale | interfacce curate, non "generiche da AI" | Anthropic |
| `remotion-best-practices` | skill | video e animazioni in React: demo prodotto, intro, reel | `remotion-dev/skills` · Remotion gratis per privati e aziende ≤ 3 dipendenti, oltre serve licenza |

> `ui-ux-pro-max` va installato come **plugin**: i suoi script usano il percorso del plugin e con `npx skills` non funzionano.

## 📣 Marketing e crescita → fonte `coreyhaines31/marketingskills` · MIT · 52 skill, installa solo queste
| Agente | Skill |
|---|---|
| `marketing` | `product-marketing` (prima di tutte: crea il contesto condiviso) · `copywriting` · `content-strategy` · `seo-audit` · `ai-seo` · `launch` · `emails` |
| `sales` | `cold-email` · `prospecting` · `sales-enablement` · `competitors` |
| `customer-success` | `onboarding` · `churn-prevention` · `customer-research` |
| `data-analyst` | `analytics` · `ab-testing` · `conversion-tracking` |
| `finance` | `pricing` · `offers` |
| `researcher` | `customer-research` · `competitor-profiling` |

Le skill di marketing leggono `.agents/product-marketing.md`: generalo con `product-marketing` partendo da `company/STRATEGY.md` e `company/GTM.md`, così non ti rifanno le stesse domande.

## 📱 Instagram e TikTok → `marketing`
| Skill | Tipo | A cosa serve | Fonte |
|---|---|---|---|
| `social` | skill | post, caroselli, script e hook per Reels/TikTok/Shorts, calendario, social listening | `coreyhaines31/marketingskills` · MIT |
| `video` | skill | produzione video: AI video, avatar, screen recording, Remotion | `coreyhaines31/marketingskills` · MIT |
| `remotion-best-practices` | skill | renderizzare i reel in codice (sottotitoli, template ripetibili) | `remotion-dev/skills` |
| `postiz` | plugin ufficiale | programmare la pubblicazione su Instagram, TikTok e altri social | richiede un account Postiz |

> Oggi non esiste una skill dedicata solo a Instagram/TikTok abbastanza matura: `social` + `video` coprono script, formati e strategia per entrambe le piattaforme.

## 🛡️ Sicurezza → `security`, `backend`
| Skill | Tipo | A cosa serve | Fonte · licenza |
|---|---|---|---|
| `/security-review` | incluso in Claude Code | review di sicurezza delle modifiche in corso | Anthropic |
| `security-guidance` | plugin ufficiale | avvisi automatici sui pattern insicuri mentre il codice viene scritto | Anthropic |
| `insecure-defaults` | plugin · marketplace `trailofbits` | credenziali hardcoded, segreti di fallback, config insicure | `trailofbits/skills` · CC-BY-SA-4.0 |
| `supply-chain-risk-auditor` | plugin · marketplace `trailofbits` | rischio delle dipendenze npm, PyPI, Go | `trailofbits/skills` |
| `differential-review` | plugin · marketplace `trailofbits` | review di sicurezza di un diff con impatto | `trailofbits/skills` |
| `static-analysis` | plugin · marketplace `trailofbits` | Semgrep e CodeQL guidati | `trailofbits/skills` |

## 🚀 CI/CD e DevOps → `devops`, `qa`
| Skill | Tipo | A cosa serve | Fonte |
|---|---|---|---|
| `ci-setup` | incluso nel kit | GitHub Actions con il gate, Dependabot, deploy di anteprima, protezione di `main` | questo kit · MIT |
| `/install-github-app` | incluso in Claude Code | Claude che revisiona le PR su GitHub | Anthropic |
| `agentic-actions-auditor` | plugin · marketplace `trailofbits` | sicurezza dei workflow GitHub Actions | `trailofbits/skills` |
| plugin dell'hosting | plugin ufficiale | `vercel` · `render` · `railway` · `supabase` · `sentry`: solo quelli del tuo stack | ufficiali |

## Pacchetti per fase (usati da `/add-skills` senza argomenti)
| Fase | Pacchetto |
|---|---|
| idea | `product-marketing` · `copywriting` · `customer-research` · `competitor-profiling` · `pricing` · `ui-ux-pro-max` |
| mvp | idea + `frontend-design` · `security-guidance` · plugin dell'hosting |
| lancio | mvp + `launch` · `emails` · `onboarding` · `analytics` · `cold-email` · `seo-audit` · `social` · `video` · `remotion-best-practices` |
| crescita | lancio + `ab-testing` · `conversion-tracking` · `churn-prevention` · `ai-seo` · `prospecting` · `sales-enablement` · `offers` · plugin Trail of Bits |
