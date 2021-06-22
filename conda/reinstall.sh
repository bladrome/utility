#!/usr/bin/env bash

source `dirname $CONDA_EXE`/../etc/profile.d/conda.sh

condadir=`dirname $CONDA_EXE`
if test ! -e envs; then mkdir envs; fi

conda env list | awk '{print $1}' | grep -v "#" | grep -v ^$ | while read myenv
do

    conda activate $myenv;
    conda env export -f envs/$myenv.yaml
    conda deactivate
done

rm -rf `dirname $condadir`

wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2021.05-Linux-x86_64.sh
bash Anaconda3-2021.05-Linux-x86_64.sh

for myenv in *yaml
do
    echo $myenv
    conda envv create -f $myenv
done
