## CentOS 7 with HTTPD

[![build_status](https://travis-ci.org/aem-design/dispatcher.svg?branch=master)](https://travis-ci.org/aem-design/dispatcher) 
[![github license](https://img.shields.io/github/license/aem-design/dispatcher)](https://github.com/aem-design/dispatcher) 
[![github issues](https://img.shields.io/github/issues/aem-design/dispatcher)](https://github.com/aem-design/dispatcher) 
[![github last commit](https://img.shields.io/github/last-commit/aem-design/dispatcher)](https://github.com/aem-design/dispatcher) 
[![github repo size](https://img.shields.io/github/repo-size/aem-design/dispatcher)](https://github.com/aem-design/dispatcher) 
[![docker stars](https://img.shields.io/docker/stars/aemdesign/dispatcher)](https://hub.docker.com/r/aemdesign/dispatcher) 
[![docker pulls](https://img.shields.io/docker/pulls/aemdesign/dispatcher)](https://hub.docker.com/r/aemdesign/dispatcher) 
[![github release](https://img.shields.io/github/release/aem-design/dispatcher)](https://github.com/aem-design/dispatcher)

This is docker image based on CentOS 7 with HTTPD

### Included Packages

Following is the list of packages included

* httpd                 - for use of dispatcher module

### Container Logs

All apache and dispatcher logs are piped to container stdout, following is an example of ```docker logs -f publish-dispatcher``` 

```
{"@timestamp":"2019-06-25 13:09:31.317603", "level":"notice", "module":"suexec", "process":"6", "message":"AH01232: suEXEC mechanism enabled (wrapper: /usr/sbin/suexec)", "host":"dispatcher",
{"@timestamp":"2019-06-25 13:09:31.317775", "level":"info", "module":"ssl", "process":"6", "message":"AH01887: Init: Initializing (virtual) servers for SSL", "host":"dispatcher",
{"@timestamp":"2019-06-25 13:09:31.317797", "level":"info", "module":"ssl", "process":"6", "message":"AH01876: mod_ssl/2.4.6 compiled against Server: Apache/2.4.6, Library: OpenSSL/1.0.2k", "host":"dispatcher",
{"@timestamp":"2019-06-25 13:09:31.344707", "level":"notice", "module":"auth_digest", "process":"6", "message":"AH01757: generating secret for digest authentication ...", "host":"dispatcher",
{"@timestamp":"2019-06-25 13:09:31.345385", "level":"notice", "module":"lbmethod_heartbeat", "process":"6", "message":"AH02282: No slotmem from mod_heartmonitor", "host":"dispatcher",
{"@timestamp":"2019-06-25 13:09:31.345490", "level":"warn", "module":"ssl", "process":"6", "message":"AH01873: Init: Session Cache is not configured [hint: SSLSessionCache]", "host":"dispatcher",
{"@timestamp":"2019-06-25 13:09:31.345497", "level":"info", "module":"ssl", "process":"6", "message":"AH01887: Init: Initializing (virtual) servers for SSL", "host":"dispatcher",
{"@timestamp":"2019-06-25 13:09:31.345510", "level":"info", "module":"ssl", "process":"6", "message":"AH01876: mod_ssl/2.4.6 compiled against Server: Apache/2.4.6, Library: OpenSSL/1.0.2k", "host":"dispatcher",
{"@timestamp":"2019-06-25 13:09:31.349115", "level":"notice", "module":"mpm_prefork", "process":"6", "message":"AH00163: Apache/2.4.6 (CentOS) OpenSSL/1.0.2k-fips Communique/4.3.2 configured -- resuming normal operations", "host":"dispatcher",
{"@timestamp":"2019-06-25 13:09:31.349154", "level":"info", "module":"mpm_prefork", "process":"6", "message":"AH00164: Server built: Apr 24 2019 13:45:48", "host":"dispatcher",
{"@timestamp":"2019-06-25 13:09:31.349174", "level":"notice", "module":"core", "process":"6", "message":"AH00094: Command line: 'httpd -f /dispatcher/httpd/httpd.conf -D FOREGROUND'", "host":"dispatcher",
{"@date":"Tue Jun 25 13:09:31 2019", "level":"I", "type":"dispatcher", "format":"simple", "pid":"pid 6", "message":"IP list for backend rend01 will be resolved on every request."}
{"@date":"Tue Jun 25 13:09:31 2019", "level":"I", "type":"dispatcher", "format":"simple", "pid":"pid 6", "message":"Dispatcher initialized (build 4.3.2/apache2.4-linux-x86_64)"}
{"@timestamp":"uc", "client_ip":"172.17.0.1", "client_port":"60260", "server_ip":"172.17.0.7", "Connection": "-:- ", "X-Forwarded-For":"-", "X-Powered-By": "-" "user":"-", "REMOTE_USER":"-", "JSESSIONID":"-", "host":"dispatcher", "pid":"80", "tid":"tid", "request":"-", "protocol":"HTTP/1.1", "http_method":"GET", "vhost":"localhost", "service_port":"80", "path":"/content/aemdesign-showcase/au/en/component/lists/page-list.html", "query_string":"", "referer":"-", "user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36", "response_code":"200", "response_location":"-", "Content-Type":"text/html", "bytes_in":"2375", "bytes_out":"8486", "keepalive":"+", "duration_micros":"4810243", "duration_sec": 4, "status":"200", "short_message": "GET /content/aemdesign-showcase/au/en/component/lists/page-list.html HTTP/1.1" },
{"@date":"Tue Jun 25 13:10:43 2019", "level":"I", "type":"dispatcher", "format":"render", "pid":"pid 10", "method":"GET", "path":"/content/aemdesign-showcase/au/en/component/lists/page-list.html", "status":"200", "size":"158170", "duration":"4809ms", "renderer":"publish/rend01"}
{"@timestamp":"uc", "client_ip":"172.17.0.1", "client_port":"60260", "server_ip":"172.17.0.7", "Connection": "-:- ", "X-Forwarded-For":"-", "X-Powered-By": "-" "user":"-", "REMOTE_USER":"-", "JSESSIONID":"-", "host":"dispatcher", "pid":"80", "tid":"tid", "request":"-", "protocol":"HTTP/1.1", "http_method":"GET", "vhost":"localhost", "service_port":"80", "path":"/content/dam/aemdesign-showcase/en/components/media/image/city1.jpg", "query_string":"", "referer":"http://localhost/content/aemdesign-showcase/au/en/component/lists/page-list.html", "user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36", "response_code":"404", "response_location":"-", "Content-Type":"text/html", "bytes_in":"2334", "bytes_out":"920", "keepalive":"+", "duration_micros":"22320", "duration_sec": 0, "status":"404", "short_message": "GET /content/dam/aemdesign-showcase/en/components/media/image/city1.jpg HTTP/1.1" },
{"@date":"Tue Jun 25 13:10:43 2019", "level":"I", "type":"dispatcher", "format":"render", "pid":"pid 10", "method":"GET", "path":"/content/dam/aemdesign-showcase/en/components/media/image/city1.jpg", "status":"404", "size":"568", "duration":"22ms", "renderer":"publish/rend01"}
{"@timestamp":"uc", "client_ip":"172.17.0.1", "client_port":"60262", "server_ip":"172.17.0.7", "Connection": "-:- ", "X-Forwarded-For":"-", "X-Powered-By": "-" "user":"-", "REMOTE_USER":"-", "JSESSIONID":"-", "host":"dispatcher", "pid":"80", "tid":"tid", "request":"-", "protocol":"HTTP/1.1", "http_method":"GET", "vhost":"localhost", "service_port":"80", "path":"/libs/granite/csrf/token.json", "query_string":"", "referer":"http://localhost/content/aemdesign-showcase/au/en/component/lists/page-list.html", "user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36", "response_code":"200", "response_location":"-", "Content-Type":"application/json", "bytes_in":"2260", "bytes_out":"348", "keepalive":"+", "duration_micros":"17257", "duration_sec": 0, "status":"200", "short_message": "GET /libs/granite/csrf/token.json HTTP/1.1" },
{"@date":"Tue Jun 25 13:10:43 2019", "level":"I", "type":"dispatcher", "format":"render", "pid":"pid 11", "method":"GET", "path":"/libs/granite/csrf/token.json", "status":"200", "size":"2", "duration":"17ms", "renderer":"publish/rend01"}
{"@timestamp":"uc", "client_ip":"172.17.0.1", "client_port":"60262", "server_ip":"172.17.0.7", "Connection": "-:- ", "X-Forwarded-For":"-", "X-Powered-By": "-" "user":"-", "REMOTE_USER":"-", "JSESSIONID":"-", "host":"dispatcher", "pid":"80", "tid":"tid", "request":"-", "protocol":"HTTP/1.1", "http_method":"GET", "vhost":"localhost", "service_port":"80", "path":"/content/dam/aemdesign-showcase/en/components/media/image/city1.jpg", "query_string":"", "referer":"http://localhost/content/aemdesign-showcase/au/en/component/lists/page-list.html", "user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36", "response_code":"404", "response_location":"-", "Content-Type":"text/html", "bytes_in":"2334", "bytes_out":"920", "keepalive":"+", "duration_micros":"10906", "duration_sec": 0, "status":"404", "short_message": "GET /content/dam/aemdesign-showcase/en/components/media/image/city1.jpg HTTP/1.1" },
{"@date":"Tue Jun 25 13:10:43 2019", "level":"I", "type":"dispatcher", "format":"render", "pid":"pid 11", "method":"GET", "path":"/content/dam/aemdesign-showcase/en/components/media/image/city1.jpg", "status":"404", "size":"568", "duration":"11ms", "renderer":"publish/rend01"}
```

#### Log Format
 
- All records with ```@timestamp``` are from apache generated using CustomLog and ErrorLog 
- All records with ```@date``` are from apache Dispatcher module generated using DispatcherLog 
- Apache can spit out non JSON formatted logs into STDOUT

### Environment Variables

Following environment variables are available

| Name                          | Default Value                 | Notes |
| ---                           | ---                           | ---   |
| APACHE_MODULES                | "/dispatcher/httpd/modules"   |  |
| APACHE_SSL_SUBJ               | "/C=AU/ST=VIC/L=Melbourne/O=AEM.Design/CN=dispatcher" |  |
| APACHE_RUN_USER               | "apache" | this is the container user |
| APACHE_RUN_GROUP              | "apache" |  |
| APACHE_RUN_USERID             | 1100 |  |
| APACHE_RUN_GROUPID            | 1100 |  |
| APACHE_LOGLEVEL               | "debug" |  |
| APACHE_VERSION                | "2.4" |  |
| DISPATCHER_VERSION            | "4.3.2" |  |
| DISPATCHER_LOGLEVEL           | 1 |  |
| DISPATCHER_CONFIG             | "author" |  |
| DISPATCHER_NAME               | "dispatcher" |  |
| DISPATCHER_PROPOGATESYNDPOST  | 0 |  |
| DISPATCHER_SERVESTALEONERROR  | 1 |  |
| DISPATCHER_STATLEVEL          | 3 |  |
| DISPATCHER_CACHEAUTHORIZED    | 0 |  |
| DISPATCHER_SESSIONMANAGEMENT  | 0 |  |
| DISPATCHER_DOWNLOAD_URL       | "http://download.macromedia.com/dispatcher/download/dispatcher-apache${APACHE_VERSION}-linux-x86_64-${DISPATCHER_VERSION}.tar.gz" |  |
| DISPATCHER_DOWNLOAD_URL_SSL   | "http://download.macromedia.com/dispatcher/download/dispatcher-apache${APACHE_VERSION}-linux-x86_64-ssl-${DISPATCHER_VERSION}.tar.gz" |  |
| RENDERER_HOST                 | "0.0.0.0" |  |
| RENDERER_PORT                 | 4502 |  |
| RENDERER_TIMEOUT              | 10000 |  |
| RENDERER_RESOLVE              | 1 |  |


### Volumes

Following volumes are exposed

| Path | Notes  |
| ---  | ---    |
| "/data/httpd/cache" | |
| "/data/httpd/logs" | latest updated outputs all logs to container stdout so you will not see any logs generated |
| "/data/httpd/redirectmap" | |

### Ports

Following Ports are exposed

| Path | Notes  |
| ---  | ---    |
| 8080 |        |
| 8433 |        |
