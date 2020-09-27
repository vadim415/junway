FROM debian:9 as builder
RUN apt update && apt upgrade -y && apt install curl wget net-tools build-essential git tree software-properties-common dirmngr apt-transport-https gcc perl libperl-dev libgd3 perl libperl-dev libgd3 libgd-dev libgeoip1 libgeoip-dev geoip-bin  libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl libxml2 libxml2-dev libxslt1.1 libxslt1-dev software-properties-common -y 
RUN cd /home/ && wget https://ftp.pcre.org/pub/pcre/pcre-8.40.tar.gz && tar xzvf pcre-8.40.tar.gz && cd pcre-8.40 && ./configure && make && make install 

RUN cd /home/ && curl -R -O http://www.lua.org/ftp/lua-5.3.4.tar.gz &&  tar zxf lua-5.3.4.tar.gz && cd /home/lua-5.3.4 && make linux install INSTALL_TOP=/usr/local/lua/5_3_4 MYLIBS="-lncurses"
RUN cd /home/ && wget https://www.zlib.net/zlib-1.2.11.tar.gz && tar xzvf zlib-1.2.11.tar.gz  && cd /home/zlib-1.2.11 && ./configure && make && make install
#RUN cd /home/ &&  wget https://www.openssl.org/source/openssl-1.1.1a.tar.gz && tar xzvf openssl-1.1.1a.tar.gz && cd openssl-1.1.1a && ./Configure linux-x86_64 --prefix=/usr && make && make test && make install
RUN cd /home/ && wget http://luajit.org/download/LuaJIT-2.0.4.tar.gz &&  tar -xzvf LuaJIT-2.0.4.tar.gz && cd /home/LuaJIT-2.0.4 && make install PREFIX=/usr/local/LuaJIT 
RUN export LUAJIT_LIB=/usr/local/LuaJIT/lib  && export LUAJIT_INC=/usr/local/LuaJIT/include/luajit-2.0
RUN cd /home/ && wget https://github.com/openresty/lua-nginx-module/archive/v0.10.13.tar.gz  && tar zxvf v0.10.13.tar.gz 
RUN cd /home/ && wget https://github.com/simplresty/ngx_devel_kit/archive/v0.3.0.tar.gz && tar zxvf v0.3.0.tar.gz
RUN cd /home/ && wget 'https://openresty.org/download/nginx-1.17.8.tar.gz' && tar -xzvf nginx-1.17.8.tar.gz
RUN cd /home/nginx-1.17.8/ &&  export LUAJIT_LIB=/usr/local/LuaJIT/lib  && export LUAJIT_INC=/usr/local/LuaJIT/include/luajit-2.0 && ./configure --prefix=/etc/nginx  --sbin-path=/usr/sbin/nginx \
            --modules-path=/usr/lib/nginx/modules  \
            --conf-path=/etc/nginx/nginx.conf \
            --error-log-path=/var/log/nginx/error.log \
            --http-log-path=/var/log/nginx/access.log \
            --pid-path=/var/run/nginx.pid \
            --lock-path=/var/run/nginx.lock \
            --user=nginx \
            --group=nginx \
            --with-select_module \
            --with-poll_module \
            --with-threads \
            --with-file-aio \
            --with-http_ssl_module  \
            --with-http_v2_module \
            --with-http_realip_module \
            --with-http_addition_module \
            --with-http_xslt_module=dynamic \
            --with-http_dav_module \
            --with-http_flv_module \
            --with-http_mp4_module \
            --with-http_gunzip_module \
            --with-http_gzip_static_module \
            --with-http_auth_request_module \
            --with-http_random_index_module \
            --with-http_secure_link_module \
            --with-http_degradation_module \
            --with-http_slice_module \
            --with-http_stub_status_module \
            --http-client-body-temp-path=/var/cache/nginx/client_temp \
            --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
            --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
            --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
            --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
            --with-mail=dynamic \
            --with-stream_ssl_preread_module  \
            --with-compat  \
            --with-pcre=../pcre-8.40  \
            --with-pcre-jit   \
            --with-zlib=../zlib-1.2.11 \ 
            --with-pcre \
            --with-ld-opt=-Wl,-rpath,/usr/local/LuaJIT/lib  \
            --add-module=/home/ngx_devel_kit-0.3.0  \ 
            --add-module=/home/lua-nginx-module-0.10.13 
           
RUN cd /home/nginx-1.17.8/ && make  -j2 && make install
RUN adduser --system --home /nonexistent --shell /bin/false --no-create-home --disabled-login --disabled-password --gecos "nginx user" --group nginx
RUN ln -s /usr/lib/nginx/modules /etc/nginx/modules
RUN mkdir -p  /var/cache/nginx/client_temp 
RUN mkdir -p  /var/cache/nginx/client_temp /var/cache/nginx/fastcgi_temp /var/cache/nginx/proxy_temp /var/cache/nginx/scgi_temp /var/cache/nginx/uwsgi_temp 
RUN chmod 766 /var/cache/nginx/* && chown nginx:root /var/cache/nginx/* && mkdir -p /etc/nginx/conf.d
ADD nginx.conf /etc/nginx/nginx.conf
ADD site.conf  /etc/nginx/conf.d/
RUN mkdir -p /var/www/domains && chown nginx:nginx /var/www/domains
RUN echo "test page for course junway" >  /var/www/domains/index.html
# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE  80 
##CMD ["nginx", "-g", "daemon off;"]
#ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
#CMD ["nginx"]
CMD ["/usr/sbin/nginx"]
##RUN adduser --system --home /nonexistent --shell /bin/false --no-create-home --disabled-login --disabled-password --gecos "nginx user" --group nginx
##--with-openssl=../openssl-1.1.1a \

COPY --from=builder /usr/lib/nginx/modules /usr/lib/nginx/modules
 
