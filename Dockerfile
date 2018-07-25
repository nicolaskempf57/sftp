FROM atmoz/sftp:alpine

RUN apk add git php7 \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && sed -i -e "s/ForceCommand internal-sftp/#ForceCommand internal-sftp -d \/www/g" /etc/ssh/sshd_config \
    && sed -i -e "s/ChrootDirectory %h/#ChrootDirectory %h/g" /etc/ssh/sshd_config