FROM debian:9
RUN apt update && apt upgrade -y && apt install curl wget net-tools build-essential git tree software-properties-common dirmngr apt-transport-https gcc perl libperl-dev libgd3 perl libperl-dev libgd3 libgd-dev libgeoip1 libgeoip-dev geoip-bin libxml2 libxml2-dev libxslt1.1 libxslt1-dev software-properties-common -y 
RUN cd /home/ && wget https://ftp.pcre.org/pub/pcre/pcre-8.40.tar.gz && tar xzvf pcre-8.40.tar.gz && cd pcre-8.40 && ./configure && make && make install 
RUN cd /home/ && wget https://www.zlib.net/zlib-1.2.11.tar.gz && tar xzvf zlib-1.2.11.tar.gz  && cd zlib-1.2.11 && ./configure && make && make install
RUN cd /home/ &&  wget https://www.openssl.org/source/openssl-1.1.1a.tar.gz && tar xzvf openssl-1.1.1a.tar.gz && cd openssl-1.1.1a && ./Configure linux-x86_64 --prefix=/usr && make && make test && make install
RUN cd /home/ && wget http://luajit.org/download/LuaJIT-2.0.5.tar.gz && tar xvf LuaJIT-2.0.5.tar.gz && cd LuaJIT-2.0.5 && make install  
RUN cd /home/ && wget -O nginx_devel_kit.tar.gz https://github.com/simpl/ngx_devel_kit/archive/v0.3.0.tar.gz  && tar xvf nginx_devel_kit.tar.gz
RUN cd /home/ && wget -O nginx_lua_module.tar.gz https://github.com/openresty/lua-nginx-module/archive/v0.10.8.tar.gz && tar xvf nginx_lua_module.tar.gz 
RUN export LUAJIT_LIB=/usr/local/lib && export LUAJIT_INC=/usr/local/include/luajit-2.0 && echo "/usr/local/lib" > /etc/ld.so.conf.d/usr_local_lib.conf && ldconfig && 
RUN cd /home/ && wget wget http://nginx.org/download/nginx-1.19.2.tar.gz && tar zxf nginx-1.19.2.tar.gz && cd nginx-1.19.2/ && ./configure --prefix=/etc/nginx \
            --sbin-path=/usr/sbin/nginx \
            --modules-path=/usr/lib/nginx/modules  \
            --conf-path=/etc/nginx/nginx.conf \
            --error-log-path=/var/log/nginx/error.log \
            --http-log-path=/var/log/nginx/access.log \
            --pid-path=/var/run/nginx.pid \
            --lock-path=/var/run/nginx.lock \
            --user=nginx \
            --group=nginx \
            --build=Debian \
            --builddir=nginx-1.19.2 \
            --with-select_module \
            --with-poll_module \
            --with-threads \
            --with-file-aio \
            --with-http_ssl_module  \
            --with-http_v2_module \
            --with-http_realip_module \
            --with-http_addition_module \
            --with-http_xslt_module=dynamic \
            --with-http_image_filter_module=dynamic \
            --with-http_geoip_module=dynamic \
            --with-http_sub_module \
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
            --with-http_perl_module=dynamic \
            --with-perl_modules_path=/usr/share/perl/5.24.1 \
            --with-perl=/usr/bin/perl \
            --http-client-body-temp-path=/var/cache/nginx/client_temp \
            --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
            --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
            --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
            --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
            --with-mail=dynamic \
            --with-mail_ssl_module \
            --with-stream=dynamic \
            --with-stream_realip_module \
            --with-stream_geoip_module=dynamic \
            --with-stream_ssl_preread_module  \
            --with-compat  \
            --with-pcre=../pcre-8.40  \
            --with-pcre-jit   \
            --with-zlib=../zlib-1.2.11 \ 
            --with-openssl-opt=no-nextprotoneg \
            --with-cc-opt=-O2 --with-ld-opt='-Wl,-rpath,/usr/local/lib' \
            --add-module=/home/ngx_devel_kit-0.3.0 \
            --add-module=/home/lua-nginx-module-0.10.8 \
            --with-openssl=../openssl-1.1.1a \
            --with-debug  
#RUN cd /home/nginx-1.19.0/ && make && make install
#RUN mkdir -p  /var/cache/nginx/client_temp 
#RUN adduser --system --home /nonexistent --shell /bin/false --no-create-home --disabled-login --disabled-password --gecos "nginx user" --group nginx
#--with-openssl=../openssl-1.1.1a \
