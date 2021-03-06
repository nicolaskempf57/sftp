FROM atmoz/sftp:alpine
USER root
RUN apk update \
    && apk --no-cache add wget curl git php7 php7-curl php7-openssl php7-json php7-phar php7-mbstring php7-dom php7-tokenizer php7-xml php7-xmlwriter php7-mysqli php7-pdo php7-pdo_mysql php7-fileinfo \
    && rm /usr/bin/php \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
    && sed -i -e "s/ForceCommand internal-sftp/#ForceCommand internal-sftp -d \/www/g" /etc/ssh/sshd_config \
    && sed -i -e "s/ChrootDirectory %h/#ChrootDirectory %h/g" /etc/ssh/sshd_config
