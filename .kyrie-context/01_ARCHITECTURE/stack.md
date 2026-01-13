# 🧱 Stack Tecnológica Detalhada

## Backend (`apps/api`)

- **Framework:** Django (Python).
- **API:** Django Rest Framework (DRF).
- **Task Queue:** Celery (para tarefas de fundo como e-mails e exportações).
- **Cache:** Redis.

## Frontend (`apps/web` & `apps/space`)

- **Framework:** Next.js (React).
- **Linguagem:** TypeScript.
- **State Management:** MobX (mobx-state-tree). **Atenção:** O Plane usa MobX
  pesadamente, não tente usar Redux ou Context API sem necessidade.
- **CSS:** Tailwind CSS.
- **Data Fetching:** SWR (Stale-While-Revalidate).

## Infraestrutura Local

- Docker & Docker Compose.
