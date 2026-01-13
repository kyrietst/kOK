# 📂 Mapa do Território (KyrieOS)

## 🚀 Aplicações Principais (`/apps`)

| Pasta        | Nome Técnico | Função no KyrieOS                                                                         |
| :----------- | :----------- | :---------------------------------------------------------------------------------------- |
| `apps/web`   | **Core App** | O painel administrativo onde a equipe Kyrie trabalha. Gerencia Issues, Cycles e Projetos. |
| `apps/space` | **Portal**   | O portal "Read-Only" ou interativo para o Cliente final acompanhar o progresso.           |
| `apps/api`   | **Backend**  | API Django Rest Framework. Aqui residem as regras de negócio e acesso ao DB.              |
| `apps/live`  | **Realtime** | Servidor de WebSocket para atualizações em tempo real (provavelmente Node.js/Hocuspocus). |
| `apps/proxy` | **Gateway**  | Configuração do Nginx/Caddy para roteamento local.                                        |

## 📦 Pacotes Compartilhados (`/packages`)

| Pasta             | Descrição                                                                                             |
| :---------------- | :---------------------------------------------------------------------------------------------------- |
| `packages/ui`     | Biblioteca de componentes visuais (Botões, Modais, Inputs). **Use isso ao invés de criar HTML puro.** |
| `packages/editor` | O editor de texto rico (baseado em Tiptap) usado nas descrições de tarefas.                           |
| `packages/types`  | Tipos TypeScript compartilhados entre o `web` e o `space`.                                            |
| `packages/ui`     | Sistema de Design e componentes reutilizáveis.                                                        |

## ⚙️ Configuração

- `docker-compose-local.yml`: Orquestração para desenvolvimento local.
- `setup.sh`: Script de inicialização rápida.
