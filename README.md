# caching-nginx

Overview:
 - conf.d/cache.conf 		nginx cache zone definitions
 - conf.d/error.conf		server error mappings to html/error/\*.html error pages
 - conf.d/gzip.conf		compression settings if client supports gzip encoding output is compressed
 - conf.d/http.conf		nginx http/https server configuration
 - conf.d/l1.conf		front end server nginx locations configuration
 - conf.d/l2.conf		back end server nginx locations configuration 
 - conf.d/log.conf		log format settings, to get more verbose access.log
 - conf.d/mime.types		file extensions to content-type mappings
 - conf.d/ssl.conf		SSL/TLS public certificate and private key path 
 - conf.d/status.conf		nginx location that displays server status
 - conf.d/vars.conf		configuration variables this file should be edited by end user
 - html/error/\*.html 		server html error pages
 - nginx.conf			main nginx configuration file

Installation & configuration:
1. cd YOUR_NGINX_CONF_DIRECTORY (probably /etc/nginx)
2. git pull git@github.com:pr4u4t/caching-nginx.git (remember to set your ssh key on github)
3. set configuration variables in vars.conf if needed
4. set SSL/TLS certificate path in ssl.conf
5. bin/createdirs (to create necessary directories)
6. bin/execstartpre (this performs necessary operations to activate nonlocal bind if enabled in conf.d/vars.conf)
   this script should be added to nginx systemd service file in ExecStartPre
7. systemctl start nginx 
