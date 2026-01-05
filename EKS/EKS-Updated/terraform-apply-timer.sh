#!/usr/bin/env bash
# terraform-apply-timer.sh
# Run `terraform apply` while recording elapsed time and saving a log.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export cluster_name=eks_cluster_Terraform
export region=eu-west-2
export profile=AdministratorAccess-803103365620
# Logging disabled: output will go only to the console
echo "Starting terraform apply at: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
START_TIME_NS=$(date +%s%N)

# Run terraform apply with passthrough arguments. Stream output to console only.
terraform apply -auto-approve "$@"
TF_EXIT=$?

END_TIME_NS=$(date +%s%N)
ELAPSED_NS=$((END_TIME_NS - START_TIME_NS))

# Convert to human readable form
ELAPSED_SEC=$((ELAPSED_NS / 1000000000))
HOURS=$((ELAPSED_SEC / 3600))
MINUTES=$(((ELAPSED_SEC % 3600) / 60))
SECONDS=$((ELAPSED_SEC % 60))
eksctl utils write-kubeconfig --cluster ${cluster_name} --region ${region} --profile=${profile}
echo ""
echo "Terraform finished with exit code: $TF_EXIT"
echo "End time: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "Elapsed time: ${HOURS}h ${MINUTES}m ${SECONDS}s"

exit $TF_EXIT
