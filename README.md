###################################################
**Installing docker-compose**
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

###
sudo chmod +x /usr/local/bin/docker-compose
###
**Installing Certbot**
sudo amazon-linux-extras -y install epel nginx1
sudo yum -y install certbot python-certbot-nginx

**Activating SSL certificate**
sudo certbot --nginx -d your-domain.name
**Restarting/starting nginx**
sudo  systemctl start nginx && systemctl enable nginx
