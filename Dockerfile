FROM atmoz/sftp:alpine

RUN sed -i -e "s/ForceCommand internal-sftp/ForceCommand internal-sftp -d \/www/g" /etc/ssh/sshd_config