#!/bin/bash
#SBATCH --job-name=gha-slurm-test
#SBATCH --output=gha-slurm-test-%j.out
#SBATCH --error=gha-slurm-test-%j.err
#SBATCH --time=01:00:00
#SBATCH --partition=geos_cicd
#SBATCH --nodes=1
#SBATCH --nodelist=pine-n[01-48]
#SBATCH --account=atc

set -euo pipefail

module load aocc/5.1.0
module load aocl/5.1.0-aocc 
module load openmpi-aocc/5.0.10 
module load  cmake/3.27.9

echo "Hostname: $(hostname)"
echo "Date UTC: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "Working directory: $(pwd)"

./scripts/uberenv/uberenv.py                                  \
    --spec "~openmp~pygeosx~docs %aocc-5"                              \
    --spack-env-file=scripts/spack_configs/pine/spack_amd.yaml     \
    --project-json=.uberenv_config.json                        \
