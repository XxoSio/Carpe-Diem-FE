server {
	server_name jungle-carpediem.site;

  	location / {
    		root /app/build;
    		index index.html;
    		try_files $uri $uri/ /index.html;
  	}

    listen 443 ssl;  
    ssl_certificate ./fullchain.pem;  
    ssl_certificate_key ./privkey.pem;  
    include ./options-ssl-nginx.conf;  
    ssl_dhparam ./ssl-dhparams.pem;  

}
server {
    if ($host = jungle-carpediem.site) {
        return 301 https://$host$request_uri;
    }  

	listen 80;
	server_name jungle-carpediem.site;
    return 404;  
}