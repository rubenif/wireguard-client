# Use an Alpine Linux base image
FROM alpine:latest

# Install wireguard-tools (userspace tools for WireGuard)
RUN apk add --no-cache wireguard-tools iproute2

# Set the default command to bring up the WireGuard interface
CMD ["wg-quick", "up", "wg0"]
