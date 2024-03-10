FROM debian:bookworm-slim

# Disable interactive mode
ENV DEBIAN_FRONTEND noninteractive

# Set working directory
WORKDIR /app

# Copy project files
COPY ./build/core .
COPY ./build/oldunreal .
COPY ./build/mutators .
COPY ./inis .

# Expose ports
EXPOSE 7777/udp 7778/udp 8080/tcp

# Run the Unreal Tournament server
# CMD ["./SystemARM64/ucc-bin-arm64", "ucc", "Server", "DM-HyperBlast", "-nohomedir", "-lanplay"]
CMD ["./System64/ucc-bin-amd64", "Server", "DM-HyperBlast", "-lanplay", "-nohomedir"]