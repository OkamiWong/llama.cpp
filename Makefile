.PHONY: config
config:
	cmake -S . -B ./build -DLLAMA_CUBLAS=ON

.PHONY: build
build:
	cmake --build ./build --config Release

.PHONY: build-debug
build-debug:
	cmake --build ./build

.PHONY: build-verbose
build-verbose:
	cmake --build ./build --config Release --verbose

.PHONY: build-verbose-debug
build-verbose-debug:
	cmake --build ./build --verbose

.PHONY: clean
clean:
	rm -rf ./build

.PHONY: run
run:
	./build/bin/main \
	-m /home/twang/temp/llama2/llama-2-13b-chat/ggml-model-f16.gguf \
	-ts 0,1,0 \
	-ngl 100 \
	-n 32 \
	-p "A: How are you? B: " \
	$(ARGS)
