#installing nginx
exec { 'install nginx -y':
  command => 'sudo apt install -y',
  path    => '/home/erick/github',
}

#pdating software packages
package { 'nginx':
    ensure => 'instlalled',
}

#allow HTTP
exec { 'allow HTTP':
  command => "ufw allow 'Nginx HTTP'",
  path    => ''/home/erick/github',
}

#changing folder rights
exec { 'chmod www folder':
  command => 'chmod -R 755 /var/www':
  path    => '/home/erick/github',
}

#creating index.html file
file { '/var/www/html/index.html':
  content => "Hello World!\n",
}

#creating index.html file
file { 'var/www/html/404.html':
  content => "Ceci n'est pas une page\n",
}

#add redirection and erro page
file { 'Nginx default config file':
  ensure  => file,
  path    => '/etc/nginx/sites-enabled/default',
  content =>
"server {
	listen 80 default_server;
        listen [::]:80 default_server;
               root /var/www/html;
        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;
        server_name _;
        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files \$uri \$uri/ =404;
        }
        error_page 404 /404.html;
        location  /404.html {
            internal;
        }

        if (\$request_filename ~ redirect_me){
            rewrite ^ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
        }
}
",
}

#restarting nginx
exec { 'restart service':
  command => 'service nginx restart',
  path    => '/home/erick/github',
}

#start nginx
service { 'nginx':
  ensure  => running,
  require => package['nginx'],
}
