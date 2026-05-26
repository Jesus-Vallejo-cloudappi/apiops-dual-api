#!/usr/bin/env bash
set -euo pipefail

: "${ORG:?Variable ORG no definida. Ejecútalo como: export ORG=tu-org}"
: "${BACK_REPO:?Variable BACK_REPO no definida. Ejecútalo como: export BACK_REPO=apiops-dual-back}"

echo "Borrando repo $ORG/$BACK_REPO..."
gh repo delete "$ORG/$BACK_REPO" --confirm 2>/dev/null || gh repo delete "$ORG/$BACK_REPO" --yes 2>/dev/null

echo ""
echo "✓ Repo de back borrado: $ORG/$BACK_REPO"
echo ""
echo "→ Para demo CREACIÓN:      edita openapi.yaml, commitea y pushea"
echo "→ Para demo MODIFICACIÓN:  vuelve a editar openapi.yaml tras el primer ciclo"
