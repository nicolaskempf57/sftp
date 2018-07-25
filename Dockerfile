FROM atmoz/sftp:alpine

RUN apk update \
    apk --no-cache add wget curl git php7 php7-curl php7-openssl php7-json php7-phar \
    && mkdir /home/www-data
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/home/www-data --filename=composer \
    && chown -R www-data /home/www-data \
    && sed -i -e "s/ForceCommand internal-sftp/#ForceCommand internal-sftp -d \/www/g" /etc/ssh/sshd_config \
    && sed -i -e "s/ChrootDirectory %h/#ChrootDirectory %h/g" /etc/ssh/sshd_config