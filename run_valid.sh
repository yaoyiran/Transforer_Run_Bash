#!/bin/bash
#rm /media/data/nmt3/checkpoints/checkpoint_1_0.pt
mkdir -p /workspace/valid
for file in $(ls /workspace/checkpoints);
do
    echo "Test The Checkpoint: $file"
    python generate_valid.py /workspace/data-bin/wmt14_en_de_joined_dict \
      --gen-subset valid \
      --path /workspace/checkpoints/$file \
      --beam 4 --remove-bpe > /workspace/valid/test.$file.out
    tail -n 2 /workspace/valid/test.$file.out
done > ./valid_output_.txt
