REPO = unsloth/Qwen3.8-Flash-Next-GGUF
QUANT_DIR = UD-IQ4_XS
GGUF_FILE = $(QUANT_DIR)/Qwen3.8-Flash-Next-UD-IQ4_XS-00001-of-00003.gguf
MMPROJ_FILE = mmproj-F16.gguf

CTX_SIZE = 262144

.PHONY: all setup serve clean

all: setup serve

setup:
	hf download $(REPO) --include "$(QUANT_DIR)/*" --local-dir ./gguf
	hf download $(REPO) $(MMPROJ_FILE) --local-dir ./gguf
	printf 'GGUF_FILE=%s\nMMPROJ_FILE=%s\nCTX_SIZE=%s\n' '$(GGUF_FILE)' '$(MMPROJ_FILE)' '$(CTX_SIZE)' > .env
	docker compose build

serve:
	docker compose up -d

clean:
	docker compose down --rmi local
	rm -rf ./gguf
	rm -f .env
