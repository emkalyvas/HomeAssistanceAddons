FROM ghcr.io/degoog-org/degoog:latest

USER root

# Copy run script
COPY run.sh /
RUN chmod +x /run.sh

ENTRYPOINT [ "/run.sh" ]
