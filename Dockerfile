FROM busybox

ARG NODE
RUN mkdir /etc/scripts_temp
COPY helpers /etc/scripts_temp/helpers
COPY pg-dock-conf-${NODE} /etc/scripts_temp/config
COPY manage  /etc/scripts_temp/manage
WORKDIR /etc/scripts_temp
CMD cp -R * /etc/scripts && chown -R 5432:5432 /etc/scripts