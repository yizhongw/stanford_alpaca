torchrun --nproc_per_node=4 --master_port=10086 train.py \
    --model_name_or_path /net/nfs.cirrascale/allennlp/yizhongw/hf_llama_models/7B/llama-7b/ \
    --tokenizer_name_or_path /net/nfs.cirrascale/allennlp/yizhongw/hf_llama_models/7B/tokenizer \
    --data_path ./alpaca_data.json \
    --bf16 True \
    --output_dir output/ \
    --num_train_epochs 3 \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 1 \
    --gradient_accumulation_steps 32 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 2 \
    --save_total_limit 1 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --fsdp "full_shard auto_wrap" \
    --fsdp_transformer_layer_cls_to_wrap 'LlamaDecoderLayer' \
    --tf32 True