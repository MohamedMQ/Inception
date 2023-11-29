FROM debian:bullseye

RUN apt update \
    && apt install -y \
    curl
RUN curl -Lo /cadvisor https://github.com/google/cadvisor/releases/download/v0.39.0/cadvisor
RUN chmod +x /cadvisor
CMD ["/cadvisor"]