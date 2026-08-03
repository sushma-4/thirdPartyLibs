#!/bin/bash
#SBATCH --job-name=gha-slurm-test
#SBATCH --output=gha-slurm-test-%j.out
#SBATCH --error=gha-slurm-test-%j.err
#SBATCH --time=00:15:00
#SBATCH --partition=geos_cicd
#SBATCH --nodes=1
#SBATCH --nodelist=pine-n[01-48]

set -euo pipefail

module load aocc/5.1.0
module load aocl/5.1.0-aocc 
module load openmpi-aocc/5.0.10 
module load  cmake/3.27.9

echo "Hello from Slurm"
echo "Hostname: $(hostname)"
echo "Date UTC: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "Working directory: $(pwd)"
echo "MPI: $(which mpirun)"

