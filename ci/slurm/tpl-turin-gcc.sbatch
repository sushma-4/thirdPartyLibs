#!/bin/bash
#SBATCH --job-name=gha-tpl-build
#SBATCH --time=02:00:00
#SBATCH --partition=geos_cicd
#SBATCH --nodes=1
#SBATCH --nodelist=pine-n[50-81]
#SBATCH --account=atc

set -euo pipefail

PLATFORM=$1
COMPILER=$2
BUILD_DATE=$3
TPL_SHA=$4

module load gcc/15.2.0
module load openmpi-gcc/5.0.10 
module load  cmake/3.27.9

echo "Hostname: $(hostname)"
echo "Date UTC: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "Working directory: $(pwd)"

./scripts/uberenv/uberenv.py                                  \
    --spec "~openmp~pygeosx~docs %gcc-15"                              \
    --spack-env-file=scripts/spack_configs/pine/spack_gcc.yaml     \
    --project-json=.uberenv_config.json                        \
    --prefix="/home/svcgeoscicd/installations/${PLATFORM}/${COMPILER}/tpl_install/${BUILD_DATE}_${TPL_SHA}"

