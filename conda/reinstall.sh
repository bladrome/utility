#!/usr/bin/env bash

source `dirname $CONDA_EXE`/../etc/profile.d/conda.sh

condadir=`dirname $CONDA_EXE`
condadir=`dirname $condadir`
if test ! -e envs; then mkdir envs; fi

conda env list | awk '{print $1}' | grep -v "#" | grep -v ^$ | while read myenv
do

    conda activate $myenv;
    conda env export -f envs/$myenv.yaml
    conda deactivate
done

# rm -rf $condadir
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2021.05-Linux-x86_64.sh
bash Anaconda3-2021.05-Linux-x86_64.sh -p $condadir -b -u

for myenv in envs/*yaml
do
    echo $myenv
    conda env create -f $myenv
done
