# Playbook — cosa fa ogni reparto in ogni fase

> Letto a pezzi: `/kickoff` e `/goal` aprono solo la sezione della fase attuale.
> Una fase è finita quando i **criteri di uscita** sono veri, non quando il calendario lo dice.

## Fase: idea
**Obiettivo:** dimostrare che il problema esiste e che qualcuno pagherebbe per risolverlo.
| Reparto | Agente | Deliverable |
|---|---|---|
| Direzione | ceo | `STRATEGY.md`: problema, ICP, posizionamento, cosa NON fare |
| Direzione | finance | costo stimato dell'MVP e ipotesi di prezzo |
| Prodotto | researcher | 5 competitor con prezzi e punti deboli · 20 citazioni di utenti con il problema · script di intervista |
| Prodotto | product-manager | ipotesi da validare + MVP minimo in 1 pagina |
| Prodotto | designer | flusso principale + wireframe della landing |
| Crescita | marketing | landing con waitlist e messaggio chiave |

**Criteri di uscita:** ≥ 10 conversazioni con potenziali clienti · waitlist o pre-ordini · decisione go/no-go registrata in `DECISIONS.md`.

## Fase: mvp
**Obiettivo:** il flusso principale funziona davvero per i primi utenti.
| Reparto | Agente | Deliverable |
|---|---|---|
| Tech | tech-lead | `TECH.md`: stack, architettura, gate · `/stack-check` eseguito |
| Tech | backend · frontend | flusso principale end-to-end, nient'altro |
| Tech | qa | gate automatico + test dei flussi critici |
| Tech | security | review di auth, permessi e dati personali |
| Tech | devops | deploy ripetibile, error monitoring, backup |
| Prodotto | product-manager | backlog MVP con criteri di accettazione |
| Prodotto | designer | `DESIGN.md` + schermate del flusso principale |
| Direzione | legal | mappa dei dati personali + bozza privacy/cookie |

**Criteri di uscita:** 5-10 utenti reali completano il flusso principale · gate verde · zero finding di sicurezza critici o alti.

## Fase: lancio
**Obiettivo:** i primi clienti paganti.
| Reparto | Agente | Deliverable |
|---|---|---|
| Crescita | marketing | piano di lancio con date, contenuti, SEO di base |
| Crescita | sales | 50 lead qualificati + sequenza di outreach + script di demo |
| Crescita | customer-success | onboarding in 3 passi + FAQ |
| Crescita | data-analyst | North Star, tracking plan, funnel misurato |
| Direzione | finance | pricing definitivo + pagamenti attivi |
| Direzione | legal | checklist di `LEGAL.md` tutta ✅ (verificata da un professionista) |
| Tech | devops | alert, pagina di stato o canale incidenti |

**Criteri di uscita:** primi clienti paganti · funnel misurato end-to-end · checklist legale completa.

## Fase: crescita
**Obiettivo:** crescita ripetibile e sostenibile.
| Reparto | Agente | Deliverable |
|---|---|---|
| Crescita | data-analyst | report settimanale + 1-2 esperimenti al mese |
| Crescita | marketing | il canale migliore scalato, gli altri spenti |
| Crescita | sales | pipeline ripetibile, prime partnership |
| Crescita | customer-success | retention e churn sotto controllo, feedback al prodotto |
| Prodotto | product-manager | roadmap guidata dai dati |
| Tech | tech-lead · security | debito sotto controllo · audit mensile |
| Direzione | finance · ceo | unit economics sane, runway ≥ 12 mesi o piano di fundraising |

**Criteri di uscita:** retention stabile · LTV ≥ 3× CAC · crescita mese su mese.

## Ritmi ricorrenti
| Quando | Cosa |
|---|---|
| Ogni giorno | `/standup` |
| Ogni settimana | report metriche (`data-analyst`) · caccia ai bug (`qa`) · salute del codice (`tech-lead`) · `/tidy` |
| Ogni mese | audit (`security`) · costi e runway (`finance`) · `/stack-check` sui free tier |
| Ogni trimestre | `ceo` rivede obiettivi e "cosa NON facciamo" |

Puoi automatizzarli con le attività pianificate di Claude Code.
