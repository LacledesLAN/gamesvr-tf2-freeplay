FROM lacledeslan/steamcmd:linux AS content-assembler

ARG contentServer=content.lacledeslan.net

# Download Custom LL TF2 Content
RUN if [ "$contentServer" = false ] ; then \
        echo "\n\nSkipping LL custom content\n\n"; \
    else \
        echo "\nDownloading custom maps from $contentServer" && \
                mkdir --parents /tmp/maps/ /output && \
                cd /tmp/maps/ && \
                wget -rkpN -l 1 -nH  --no-verbose --cut-dirs=3 -R "*.htm*" -e robots=off "http://"$contentServer"/fastDownloads/tf2-freeplay/maps/" && \
            echo "Decompressing files" && \
                bzip2 --decompress /tmp/maps/*.bz2 && \
            echo "Moving uncompressed files to destination" && \
                mkdir --parents /output/tf/maps/ && \
                mv --no-clobber *.bsp /output/tf/maps/; \
    fi;

COPY ./sourcemod.linux /output/tf/

COPY ./sourcemod-configs /output/tf/

COPY ./dist /output/

FROM lacledeslan/gamesvr-tf2

HEALTHCHECK NONE

ARG BUILD_NODE=unspecified
ARG GIT_REVISION=unspecified

LABEL architecture="amd64" \
    com.lacledeslan.build-node=$BUILD_NODE \
    maintainer="Laclede's LAN <contact@lacledeslan.com>" \
    org.opencontainers.image.description="Laclede's LAN Team Fortress 2 Dedicated Freeplay Server" \
    org.opencontainers.image.revision=$GIT_REVISION \
    org.opencontainers.image.source="https://github.com/LacledesLAN/gamesvr-tf2-freeplay" \
    org.opencontainers.image.vendor="Laclede's LAN"

COPY --chown=TF2:root --from=content-assembler /output /app/tf2

# UPDATE USERNAME & ensure permissions
RUN usermod -l TF2Freeplay TF2 && \
    chmod +x /app/tf2/ll-tests/*.sh;

USER TF2Freeplay

WORKDIR /app/tf2/

CMD ["/bin/bash"]

ONBUILD USER root
