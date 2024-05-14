#!/bin/bash

#SBATCH -o logs/cifar100_maskcon.log-%j-%a
#SBATCH -c 4
#SBATCH -a 0-4  # Job array indices from 0 to 4
#SBATCH --gres=gpu:volta:1

source /etc/profile
module load anaconda/2022a

# Define an array with the values for the --t parameter
t_values=(0 0.01 0.05 0.1 0.5 1e6)

# Access the value corresponding to the job array index
t_param="${t_values[$SLURM_ARRAY_TASK_ID]}"

# Execute the Python script with the selected --t parameter
python main_rd.py --mode maskcon --t $t_param
