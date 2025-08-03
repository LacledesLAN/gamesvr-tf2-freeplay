# escape=`

FROM lacledeslan/steamcmd:linux AS content-assembler

ARG contentServer=content.lacledeslan.net

# Download Custom LL TF2 Content
RUN if [ "$contentServer" = false ] ; then `
        echo "\n\nSkipping LL custom content\n\n"; `
    else `
        echo "\nDownloading custom maps from $contentServer" &&`
                mkdir --parents /tmp/maps/ /output &&`
                cd /tmp/maps/ &&`
                wget -rkpN -l 1 -nH  --no-verbose --cut-dirs=3 -R "*.htm*" -e robots=off "http://"$contentServer"/fastDownloads/tf2-freeplay/maps/" &&`
            echo "Decompressing files" &&`
                bzip2 --decompress /tmp/maps/*.bz2 &&`
            echo "Moving uncompressed files to destination" &&`
                mkdir --parents /output/tf/maps/ &&`
                mv --no-clobber *.bsp /output/tf/maps/; `
    fi;

COPY ./sourcemod.linux /output/tf/

COPY ./sourcemod-configs /output/tf/

COPY ./dist /output/

COPY ./ll-tests/*.sh /output/ll-tests/*.sh

FROM lacledeslan/gamesvr-tf2

HEALTHCHECK NONE

ARG BUILDNODE="unspecified"
ARG SOURCE_COMMIT

LABEL maintainer="Laclede's LAN <contact @lacledeslan.com>" `
      com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://github.com/LacledesLAN/README.1ST" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="Laclede's LAN" `
      org.label-schema.description="LL Team Fortress 2 Dedicated Freeplay Server" `
      org.label-schema.vcs-url="https://github.com/LacledesLAN/gamesvr-tf2-freeplay"

COPY --chown=TF2:root --from=content-assembler /output /app

# UPDATE USERNAME & ensure permissions
RUN usermod -l TF2Freeplay TF2 &&`
    chmod +x /app/ll-tests/*.sh;

USER TF2Freeplay

WORKDIR /app/

CMD ["/bin/bash"]

ONBUILD USER root
