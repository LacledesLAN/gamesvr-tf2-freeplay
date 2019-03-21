# escape=`
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

COPY --chown=TF2:root ./sourcemod.linux /app/tf/
COPY --chown=TF2:root ./sourcemod-configs /app/tf/
COPY --chown=TF2:root ./dist /app/
COPY --chown=TF2:root ./ll-tests/*.sh /app/ll-tests

# UPDATE USERNAME & ensure permissions
RUN usermod -l TF2Freeplay TF2 &&`
    chmod +x /app/ll-tests/*.sh &&`
    mkdir -p /app/tf2/logs &&`
    chmod 774 /app/tf2/logs

USER TF2Freeplay

WORKDIR /app/

CMD ["/bin/bash"]

ONBUILD USER root
