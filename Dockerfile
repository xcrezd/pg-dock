FROM busybox

ARG NODE
RUN mkdir -p /etc/temp/scripts
COPY helpers /etc/temp/scripts/helpers
COPY pg-dock-conf-${NODE} /etc/temp/scripts/config
COPY manage  /etc/temp/scripts/manage
WORKDIR /etc/temp/
CMD sh scripts/helpers/update_config.sh scripts /etc && chown -R 5432:5432 /etc/scripts