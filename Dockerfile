#ARG wg_go_tag=0.0.20230223

# Use a small base image (Alpine)
FROM alpine:latest

# Install required dependencies for building wireguard-go
RUN apk update && apk add --no-cache \
    git \
    build-base \
    linux-headers \
    iproute2 \
    iputils \
    && rm -rf /var/cache/apk/*

# Clone the wireguard-go repository from GitHub
RUN git clone https://github.com/WireGuard/wireguard-go.git /tmp/wireguard-go

# Build wireguard-go from source
RUN cd /tmp/wireguard-go && \
#    git checkout $wg_go_tag && \
    make && \
    mv /tmp/wireguard-go/wireguard-go /usr/local/bin/ && \
    rm -rf /tmp/wireguard-go

# Create the necessary directories for WireGuard configuration
RUN mkdir -p /etc/wireguard /etc/wireguard/config

# Set the entrypoint to run wireguard-go with the wg0 interface
ENTRYPOINT ["/usr/local/bin/wireguard-go", "wg0"]
