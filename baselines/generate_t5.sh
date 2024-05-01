#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --partition=gpu
#SBATCH --qos=gpu
#SBATCH --nodes=1 
#SBATCH --gres=gpu:4
#SBATCH --mem=334GB  
#SBATCH --mail-user=tgoldsack1@sheffield.ac.uk
#SBATCH --mail-type=ALL


module load Anaconda3/2022.05
module load CUDA/11.8.0 

source activate NLP

python train_table2text_t5.py \
--data_dir=\baselines\ \
--model_name_or_path=t5-base \
--learning_rate=3e-5 \
--num_train_epochs 30 \
--train_batch_size=8 \
--eval_batch_size=8 \
--test_batch_size=8 \
--output_dir=\outputs\t5 \
--n_gpu 1 \
--do_train \
--do_predict \
--early_stopping_patience 10 \
--max_source_length 384 \
--max_target_length 384 \
