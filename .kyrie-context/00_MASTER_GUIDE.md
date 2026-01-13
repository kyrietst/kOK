# 🧠 KyrieOS - Master Guide (Baseado no Plane Community Edition)

## 🎯 Objetivo Estratégico

Transformar o Plane em **KyrieOS**, uma plataforma de gestão proprietária que
foca em:

1. **Transparência:** Portal do cliente (`apps/space`) para visualização de
   tarefas.
2. **Rentabilidade:** Cálculo de horas gastas vs. valor do contrato (Feature
   Customizada).
3. **Autonomia:** Eliminar dependência de SaaS de terceiros (Trello).

## 🏗️ Visão Geral da Stack

- **Monorepo:** Gerenciado via TurboRepo.
- **Frontend (App Principal):** Next.js + TypeScript (`apps/web`).
- **Frontend (Portal Cliente):** Next.js (`apps/space`).
- **Backend:** Django + Python (`apps/api`).
- **Banco de Dados:** PostgreSQL.
- **Async/Queue:** Redis + Celery.
- **Estilização:** Tailwind CSS.

## ⚠️ Regras de Ouro (Prime Directive)

1. **Nunca quebre o Build:** O Plane é complexo. Teste localmente antes de
   commits.
2. **Contexto é Rei:** Antes de codar, leia este arquivo e os PRDs ativos.
3. **Log de Mudanças:** Toda alteração estrutural deve ser registrada em
   `04_LOGS`.
