# Use an Alpine Linux base image
FROM alpine:latest

# Install wireguard-tools (userspace tools for WireGuard)
RUN apk add --no-cache wireguard-tools iproute2

# Copy your WireGuard configuration into the container
COPY wg0.conf /etc/wireguard/

# Set the default command to bring up the WireGuard interface
CMD ["wg-quick", "up", "wg0"]
