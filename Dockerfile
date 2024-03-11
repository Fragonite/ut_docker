FROM debian:bookworm-slim

# Disable interactive mode
ENV DEBIAN_FRONTEND noninteractive

# Set working directory
WORKDIR /app

# Install nano
RUN apt-get update && apt-get install -y nano

# Copy project files
COPY ./build/core .
COPY ./build/oldunreal .
COPY ./build/mutators .
COPY ./build/inis .

# Expose ports
EXPOSE 7777/udp 7778/udp 8080/tcp

# Run the Unreal Tournament server
# CMD ["./SystemARM64/ucc-bin-arm64", "ucc", "Server", "DM-HyperBlast", "-nohomedir", "-lanplay"]
# AMD64
CMD ["./System64/ucc-bin-amd64", "Server", "DM-Deck16][?mutator=fnn262.GiveWeapons,fnn262.SpecIdlers,fnn262.CmdMut,fnn262.ScoreSave", "-lanplay", "-nohomedir"]
# AMD64 END