FROM grpc/php:0.11

RUN mkdir -p /code
WORKDIR /code
COPY . /code

RUN pecl install protobuf-3.3.0
RUN composer install
RUN if [ ! -d php-protocolbuffers ]; then git clone https://github.com/chobie/php-protocolbuffers.git; fi
RUN cd php-protocolbuffers \
    && phpize \
    && ./configure \
    && make \
    && make install

RUN echo "extension=protocolbuffers.so" > /etc/php5/cli/conf.d/30-grpc.ini
RUN pwd && cd tool \
    && ./setGlobalComposerTool.sh
RUN mv protoc3/bin/protoc /usr/bin/protoc
CMD ["apache2ctl", "-DFOREGROUND"]

