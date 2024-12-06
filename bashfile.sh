#!/bin/bash
#SBATCH --nodes=1                               # Specify the amount of A100 Nodes with 4 A100 GPUs (single GPU 128 SBUs/hour, 512 SBUs/hour for an entire node)
#SBATCH --ntasks=1                              # Specify the number of tasks
#SBATCH --cpus-per-task=16                      # Specify the number of CPUs/task
#SBATCH --gpus=1                                # Specify the number of GPUs to use
#SBATCH --partition=gpu_mig                         # Specify the node partition (see slides Cris)
#SBATCH --time=1:00:00                        # Specify the maximum time the job can run

export OUTPUT_FOLDER=output                                                    # Define name of output folder
cd /gpfs/home6/hhuitema/github_repos/3dgs_docker/                                            # Navigate to the location of the code (ckusters account)


# RAMIE
srun apptainer exec --nv /gpfs/home6/hhuitema/docker/3dgs_v2.sif  python train.py -s data/SCARED_test
