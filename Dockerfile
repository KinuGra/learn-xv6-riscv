FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    make \
    gcc-riscv64-unknown-elf \
    binutils-riscv64-unknown-elf \
    gdb-multiarch \
    qemu-system-misc \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# riscv64-unknown-elf-gdb のエイリアス
RUN ln -sf /usr/bin/gdb-multiarch /usr/local/bin/riscv64-unknown-elf-gdb

WORKDIR /work
CMD ["/bin/bash"]
