FROM debian:stable-slim

LABEL maintainer="SoftWare Samuraj"

WORKDIR /home/samuraj

# Copy remote-debug app
COPY remote-debug .

# Copy Delve - Golang debugger
COPY bin/dlv .

# CMD ["./remote-debug"]
CMD ["./dlv", "--listen=:2345", "--headless=true", "--api-version=2", "--accept-multiclient", "exec", "./remote-debug"]