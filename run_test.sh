#!/bin/bash
rm /media/data/nmt3/checkpoints/checkpoint_1_0.pt

for file in $(ls /media/data/nmt3/checkpoints);
do
#    if [[ $file = *.pt ]]; then 
    echo "Test The Checkpoint: $file"
    python generate.py /workspace/data-bin/wmt14_en_de_joined_dict \
      --path /media/data/nmt3/checkpoints/$file \
      --beam 4 --remove-bpe > /workspace/results/test.$file.out
    tail -n 2 /workspace/results/test.$file.out
#    fi
done > ./output_.txt
