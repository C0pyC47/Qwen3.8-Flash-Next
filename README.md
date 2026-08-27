# Qwen3.8-Flash-Next

Docker container for serving **Qwen3.8-Flash-Next** on a single **NVIDIA DGX Spark**.

## Requirements

* NVIDIA DGX Spark
* Hugging Face Hub CLI
* Docker with NVIDIA Container Toolkit

## Usage

```bash
git clone https://github.com/C0pyC47/Qwen3.8-Flash-Next.git
cd Qwen3.8-Flash-Next && make
```

## Endpoint

OpenAI-compatible API on `http://<spark-host>:8000`.

## Credits

* https://github.com/ggml-org/llama.cpp
* https://huggingface.co/unsloth/Qwen3.8-Flash-Next-GGUF
