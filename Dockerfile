FROM icrezd/pg-dock-base

ARG NODE
RUN mkdir /etc/scripts_temp
COPY helpers /etc/scripts_temp/helpers
COPY pg-dock-conf-${NODE} /etc/scripts_temp/config
COPY manage  /etc/scripts_temp/manage
WORKDIR /etc/scripts_temp
RUN chown -R postgres:postgres /etc/scripts_temp /etc/scripts
CMD gosu postgres bash -c "cp -R * /etc/scripts"