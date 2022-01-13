# caching-nginx
Installation & configuration:
1. cd YOUR_NGINX_CONF_DIRECTORY (probably /etc/nginx)
2. git pull git@github.com:pr4u4t/caching-nginx.git (remember to set your ssh key on github)
3. set configuration variables in vars.conf if needed
4. set SSL/TLS certificate path in ssl.conf
5. bin/createdirs (to create necessary directories)
6. bin/execstartpre (this performs necessary operations to activate nonlocal bind if enabled in conf.d/vars.conf)
   this script should be added to nginx systemd service file in ExecStartPre
7. systemctl start nginx 
