FROM nvidia/cuda:13.0.3-devel-ubuntu24.04 AS build

RUN apt-get update && apt-get install -y --no-install-recommends git cmake && rm -rf /var/lib/apt/lists/*

RUN git clone -b b10660 --depth 1 https://github.com/ggml-org/llama.cpp.git

RUN cd llama.cpp \
    && cmake -B build -DGGML_CUDA=ON -DGGML_OPENMP=OFF -DBUILD_SHARED_LIBS=OFF -DCMAKE_CUDA_ARCHITECTURES=121a \
    && cmake --build build --target llama-server -j"$(nproc)"

FROM nvidia/cuda:13.0.3-runtime-ubuntu24.04

COPY --from=build /llama.cpp/build/bin/llama-server /usr/local/bin/llama-server

EXPOSE 8000

ENTRYPOINT ["llama-server", "--host", "0.0.0.0", "--port", "8000"]
