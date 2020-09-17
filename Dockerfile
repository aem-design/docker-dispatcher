FROM        aemdesign/centos-tini:centos7

LABEL   os="centos 7" \
        container.description="apached dispatcher image" \
        version="4.3.3" \
        imagename="dispatcher" \
        test.command=" httpd -v | awk 'NR==1 {print $3}' | awk -F /  'NR==1 {print $2}'" \
        test.command.verify="2.4.6"

MAINTAINER  devops <devops@aem.design>

ARG APACHE_MODULES="/dispatcher/httpd/modules"
ARG APACHE_SSL_SUBJ="/C=AU/ST=VIC/L=Melbourne/O=AEM.Design/CN=dispatcher"
ARG APACHE_RUN_USER="apache"
ARG APACHE_RUN_GROUP="apache"
ARG APACHE_RUN_USERID=1100
ARG APACHE_RUN_GROUPID=1100
ARG APACHE_LOGLEVEL="debug"
ARG APACHE_VERSION="2.4"
ARG DISPATCHER_SSL_VERSION="1.1"
ARG DISPATCHER_VERSION="4.3.3"
ARG DISPATCHER_LOGLEVEL=1
ARG DISPATCHER_CONFIG="author"
ARG DISPATCHER_NAME="dispatcher"
ARG DISPATCHER_PROPOGATESYNDPOST=0
ARG DISPATCHER_SERVESTALEONERROR=1
ARG DISPATCHER_STATLEVEL=3
ARG DISPATCHER_CACHEAUTHORIZED=0
ARG DISPATCHER_SESSIONMANAGEMENT=0
ARG DISPATCHER_DOWNLOAD_URL="http://download.macromedia.com/dispatcher/download/dispatcher-apache${APACHE_VERSION}-linux-x86_64-${DISPATCHER_VERSION}.tar.gz"
ARG DISPATCHER_DOWNLOAD_URL_SSL="http://download.macromedia.com/dispatcher/download/dispatcher-apache${APACHE_VERSION}-linux-x86_64-ssl${DISPATCHER_SSL_VERSION}-${DISPATCHER_VERSION}.tar.gz"
ARG RENDERER_HOST="0.0.0.0"
ARG RENDERER_PORT=4502
ARG RENDERER_TIMEOUT=10000
ARG RENDERER_RESOLVE=1
ARG RENDERER_RECEIVE_TIMEOUT=600000
ARG RENDERER_IPV4=0

ENV APACHE_MODULES="${APACHE_MODULES}" \
    APACHE_SSL_SUBJ="${APACHE_SSL_SUBJ}" \
    APACHE_RUN_USER="${APACHE_RUN_USER}" \
    APACHE_RUN_GROUP="${APACHE_RUN_GROUP}" \
    APACHE_RUN_USERID="${APACHE_RUN_USERID}" \
    APACHE_RUN_GROUPID="${APACHE_RUN_GROUPID}" \
    APACHE_LOGLEVEL="${APACHE_LOGLEVEL}" \
    APACHE_VERSION="${APACHE_VERSION}" \
    DISPATCHER_VERSION="${DISPATCHER_VERSION}" \
    DISPATCHER_LOGLEVEL="${DISPATCHER_LOGLEVEL}" \
    DISPATCHER_CONFIG="${DISPATCHER_CONFIG}" \
    DISPATCHER_NAME="${DISPATCHER_NAME}" \
    DISPATCHER_PROPOGATESYNDPOST=${DISPATCHER_PROPOGATESYNDPOST} \
    DISPATCHER_SERVESTALEONERROR=${DISPATCHER_SERVESTALEONERROR} \
    DISPATCHER_STATLEVEL=${DISPATCHER_STATLEVEL} \
    DISPATCHER_CACHEAUTHORIZED=${DISPATCHER_CACHEAUTHORIZED} \
    DISPATCHER_SESSIONMANAGEMENT=${DISPATCHER_SESSIONMANAGEMENT} \
    DISPATCHER_DOWNLOAD_URL=${DISPATCHER_DOWNLOAD_URL} \
    DISPATCHER_DOWNLOAD_URL_SSL=${DISPATCHER_DOWNLOAD_URL_SSL} \
    RENDERER_HOST="${RENDERER_HOST}" \
    RENDERER_PORT="${RENDERER_PORT}" \
    RENDERER_TIMEOUT=${RENDERER_TIMEOUT} \
    RENDERER_RESOLVE=${RENDERER_RESOLVE} \
    RENDERER_RECEIVE_TIMEOUT=${RENDERER_RECEIVE_TIMEOUT} \
    RENDERER_IPV4=${RENDERER_IPV4}

WORKDIR /dispatcher

COPY start.sh ./start.sh
COPY httpd ./httpd/
COPY author ./author/
COPY publish ./publish/
COPY scripts ./scripts/

RUN \
    groupadd -g $APACHE_RUN_GROUPID $APACHE_RUN_GROUP && \
    useradd -r -u $APACHE_RUN_USERID -m -c "container account" -g $APACHE_RUN_GROUPID -s /bin/false $APACHE_RUN_USER && \
    yum -y install httpd mod_ssl && \
    yum clean all && \
#RUN \
# install
    chmod +x /dispatcher/start.sh && chmod +x /dispatcher/scripts/*.sh && mkdir -p /dispatcher /data/httpd /data/httpd/cache /data/httpd/logs /data/httpd/run /data/httpd/cgi-bin $APACHE_MODULES/ssl /etc/httpd/ssl && \
    mkdir -p /data/httpd/redirectmap && touch /data/httpd/redirectmap/redirectmap.map && \
    curl -SL -o $APACHE_MODULES/src/dispatcher-apache$APACHE_VERSION-linux-x86-64-$DISPATCHER_VERSION.tar.gz ${DISPATCHER_DOWNLOAD_URL} && \
    curl -SL -o $APACHE_MODULES/src/dispatcher-apache$APACHE_VERSION-linux-x86-64-ssl-$DISPATCHER_VERSION.tar.gz ${DISPATCHER_DOWNLOAD_URL_SSL} && \
    tar --directory $APACHE_MODULES --extract --overwrite -f $APACHE_MODULES/src/dispatcher-apache$APACHE_VERSION-linux-x86-64-$DISPATCHER_VERSION.tar.gz dispatcher-apache$APACHE_VERSION-$DISPATCHER_VERSION.so && \
    tar --directory $APACHE_MODULES/ssl --extract --overwrite -f $APACHE_MODULES/src/dispatcher-apache$APACHE_VERSION-linux-x86-64-ssl-$DISPATCHER_VERSION.tar.gz dispatcher-apache$APACHE_VERSION-$DISPATCHER_VERSION.so && \
    chown -R $APACHE_RUN_USER:$APACHE_RUN_GROUP /dispatcher /data/httpd && \
    openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/httpd/ssl/apache.key -out /etc/httpd/ssl/apache.crt -subj "$APACHE_SSL_SUBJ"
USER ${APACHE_RUN_USER}

VOLUME ["/data/httpd/cache","/data/httpd/logs","/data/httpd/redirectmap"]

EXPOSE 8080 8443

RUN chmod +x /dispatcher/start.sh

CMD ["/dispatcher/start.sh"]
