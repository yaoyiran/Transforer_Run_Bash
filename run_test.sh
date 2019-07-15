#!/bin/bash
rm /workspace/checkpoints/checkpoint_1_0.pt
rm -r /workspace/results
mkdir /workspace/results
for file in $(ls /workspace/checkpoints);
do
#    if [[ $file = *.pt ]]; then 
    echo "Test The Checkpoint: $file"
    python generate.py /workspace/data-bin/wmt14_en_de_joined_dict \
      --path /workspace/checkpoints/$file \
      --beam 4 --remove-bpe > /workspace/results/test.$file.out
    tail -n 2 /workspace/results/test.$file.out
#    fi
done > ./output_.txt
