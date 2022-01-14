# caching-nginx

Overview:
 - bin/createdirs		create nginx necessary directories (temporary,cache,log)
 - bin/execstartpre		setup operating system before nginx start
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

Configuration:  
 conf.d/vars.conf:  
  With your favourite editor open conf.d/vars.conf and adjust it to your needs  
  Options:  

	- $l1_host  this variable stores http host header value that is set during L1 -> L2 proxy stage (string)
                    if empty host value would be taken from client request header
	
	- $l2_host  this variable stores http host header value that is set during L2 -> internal_citrix_host proxy stage (string)
                    if empty host value would be taken from previous stage (L1)
	
	- $l2_proto  this variable stores protocol on which connection should be made between l2 cache proxy and internal 
		     citrix host (string) allowed values (http|https)

	- $l2_addr   this variable stores internal network citrix host http/https IP address and port (string) format (IP:PORT)

	- $sess_rel  this variable stores internal network citrix host session reliability IP address and port (string) format (IP:PORT)

	- $nonlocal  whether to enable nonlocal bind

 conf.d/ssl.conf:

	- ssl_certificate      filesystem path pointing SSL/TLS public certificate in .pem format
	
	- ssl_certificate_key  filesystem path pointing SSL/TLS private key in .pem format

Installation & configuration:  
You can choose from two installation methods 'manual' and 'automatic'  
I. Manual:
  1. cd YOUR_NGINX_CONF_DIRECTORY (probably /etc/nginx)
  2. git pull git@github.com:pr4u4t/caching-nginx.git (remember to set your ssh key on github)
  3. set configuration variables in vars.conf if needed
  4. set SSL/TLS certificate path in conf.d/ssl.conf
  5. bin/createdirs (to create necessary directories)
  6. bin/execstartpre (this performs necessary operations to activate nonlocal bind if enabled in conf.d/vars.conf)
     this script should be added to nginx systemd service file in ExecStartPre
  7. systemctl start nginx

II. Automatic
  1. set SSL/TLS certificate path in conf.d/ssl.conf
  2. type ./install in source root directory
  3. systemctl start nginx
