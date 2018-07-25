FROM atmoz/sftp:alpine

RUN apk update \
    apk --no-cache add wget curl git php php-curl php-openssl php-json php-phar php-dom \
    && mkdir /home/www-data \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/home/www-data --filename=composer \
    && chown -R www-data /home/www-data \
    && sed -i -e "s/ForceCommand internal-sftp/#ForceCommand internal-sftp -d \/www/g" /etc/ssh/sshd_config \
    && sed -i -e "s/ChrootDirectory %h/#ChrootDirectory %h/g" /etc/ssh/sshd_config