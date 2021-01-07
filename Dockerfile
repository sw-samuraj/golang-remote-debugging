FROM debian:stable-slim

LABEL maintainer="SoftWare Samuraj"

COPY remote-debug .

CMD ["./remote-debug"]