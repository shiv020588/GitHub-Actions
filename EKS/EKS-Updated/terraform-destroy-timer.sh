#!/usr/bin/env bash
set -euo pipefail

# terraform-destroy-timer.sh
# Run `terraform destroy` while recording elapsed time and logging output.
# Usage: ./terraform-destroy-timer.sh [terraform-destroy-args...]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Logging disabled: output will go to console only
timestamp() { date +"%Y%m%d-%H%M%S"; }

START_TS_SEC=$(date +%s)
START_TS_READABLE=$(timestamp)

echo "Starting terraform destroy at ${START_TS_READABLE}"

# Default destroy args: auto-approve. Allow user to pass extra args which will be appended.
if [ "$#" -eq 0 ]; then
  TF_ARGS=("-auto-approve")
else
  TF_ARGS=("-auto-approve" "$@")
fi

echo "Running: terraform destroy ${TF_ARGS[*]}"

# Run terraform destroy, stream to console and logfile
if command -v stdbuf >/dev/null 2>&1; then
  stdbuf -oL terraform destroy "${TF_ARGS[@]}"
  EXIT_CODE=$?
else
  terraform destroy "${TF_ARGS[@]}"
  EXIT_CODE=$?
fi

END_TS_SEC=$(date +%s)
END_TS_READABLE=$(timestamp)

ELAPSED_SEC=$((END_TS_SEC - START_TS_SEC))
hours=$((ELAPSED_SEC/3600))
minutes=$(( (ELAPSED_SEC%3600)/60 ))
seconds=$((ELAPSED_SEC%60))

ELAPSED_FMT="${hours}h ${minutes}m ${seconds}s"

echo "Finished terraform destroy at ${END_TS_READABLE}"
echo "Elapsed time: ${ELAPSED_FMT}"

exit $EXIT_CODE
