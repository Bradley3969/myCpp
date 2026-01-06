FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    clang \
    cmake \
    ninja-build \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy CMakeLists first (layer caching)
COPY CMakeLists.txt .

# Copy source files
COPY *.cpp .

# Build project
RUN mkdir -p build && cmake -S . -B build -G Ninja
RUN cmake --build build

# Run binary
CMD ["./build/myCpp"]
