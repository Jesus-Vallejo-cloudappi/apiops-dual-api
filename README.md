# apiops-dual-api

Demo de **APIOps Dual Repo**. Muestra la comunicación automática entre el repo de APIs y el repo de back a través de GitHub Actions. Todos los pasos de calidad son placeholders con mensajes `[SIMULADO]`.

---

## Flujo 1 — Creación (primer push con nuevo contrato)

```
push openapi.yaml
    └── lint [SIMULADO]
    └── deploy-efimero [SIMULADO]
    └── notify-back
            ├── Repo de back NO existe → lo crea + abre issue con openapi completo
            └── Equipo de back edita BACK_CHANGES.md y hace push
                    └── build [SIMULADO]
                    └── deploy-dev [SIMULADO]
                    └── notify-api-repo → workflow_dispatch al repo de APIs
                            └── update-apim [SIMULADO]
                            └── newman [SIMULADO]
                            └── zap [SIMULADO]
                            └── notify-jira-confluence [SIMULADO]
```

## Flujo 2 — Modificación (push con cambio en contrato existente)

Igual al flujo de creación, pero el repo de back ya existe: el job `notify-back` abre un issue con solo el **diff** del cambio en `openapi.yaml`.

---

## Cómo resetear la demo

```bash
export ORG=tu-org
export BACK_REPO=apiops-dual-back
./demo-reset.sh
```

El script borra el repo de back para que el siguiente push vuelva a disparar el flujo de creación.

---

## Variables y secrets

### En este repo (`apiops-dual-api`)

| Tipo      | Nombre              | Descripción                                              |
|-----------|---------------------|----------------------------------------------------------|
| `vars`    | `ORG`               | Organización o usuario de GitHub                         |
| `vars`    | `BACK_REPO`         | Nombre del repo de back, ej: `apiops-dual-back`          |
| `secrets` | `BACK_REPO_TOKEN`   | Token con permisos `repo` y `workflow` sobre la org      |

### En el repo de back (`apiops-dual-back`)

| Tipo      | Nombre              | Descripción                                              |
|-----------|---------------------|----------------------------------------------------------|
| `vars`    | `ORG`               | Organización o usuario de GitHub                         |
| `vars`    | `API_REPO`          | Nombre del repo de APIs, ej: `apiops-dual-api`           |
| `secrets` | `API_REPO_TOKEN`    | Token con permisos `repo` y `workflow` sobre la org      |

---

## Qué NO está implementado

- Lint real (Spectral, Redocly)
- SonarQube, Newman, OWASP ZAP
- Confluence, Jira
- AWS API Gateway / Terraform

Todos los steps de calidad imprimen `[SIMULADO] ... OK` para que el flujo de comunicación entre repos sea visible sin dependencias externas.
test
