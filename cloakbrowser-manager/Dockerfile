FROM cloakhq/cloakbrowser-manager:latest

USER root

# Copy root filesystem files
COPY run.sh /
RUN chmod +x /run.sh

ENTRYPOINT [ "/run.sh" ]
