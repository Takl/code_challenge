# README

This is a basic rails app with a single route leading to the /me endpoint.

_Things to be done:_

* [x] Set up a database of your choosing to be used for storing user data (username/encrypted passwords)


		CREATE TABLE `users` (
		`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
		`username` varchar(255) NOT NULL,
		`pswd` varchar(255) DEFAULT NULL,
		PRIMARY KEY (`id`),
		UNIQUE KEY `email` (`username`)
		) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8

		INSERT INTO `users` (`username`, `pswd`) VALUES ('laura.gasslein@gmail.com', MD5('pass123'));
		INSERT INTO `users` (`username`, `pswd`) VALUES ('lauraalexander28@comcast.net', MD5('shr54q!'));


* [x] The /me endpoint should be authenticated using whatever method of user authentication you are comfortable with [Done but lamely]

		Instinctively, because it's a custom route/endpoint, I would do this with authtoken... For now just made  		  a login/password box, which I know is extremely dumb, how's this usually done in Rails/default method? 

* [x] When a user makes an authenticated request to the /me endpoint, return a json payload greeting the user with their name (replace the current placeholder) 

* [x] When a request is made with failing authentication, an appropriate error is returned 

1. [x] Create a docker image for the sample application. 
	sudo docker build . -t rails_junior_code_challenge
	sudo docker run --name rails_junior_code_challenge-mysql -e MYSQL_ROOT_PASSWORD=w3lcome9 -d mysql:5.5.62

2. [ ] Using the server _45.79.214.242_ with the login  ` root`  and password ` mE_vzkm2x7wxs.MUPZ2_ `  :

	 - [x] Configure the server for SSH public key authentication. 
	 - [x] Add our public key as well as the one provided below	
	 - [x] Install NGINX and Docker and configure them both to automatically start at boot. 
		` sudo systemctl enable docker` 
	 - [ ] Using the default configuration for NGINX, create a reverse proxy that points to Docker image.
	 - [x] Configure NGINX so that the default server name is ` laura.takl.dev `
	 - [x] Setup and configure certbot for the given domain name. 
			` echo "#!/bin/bash" >> /etc/init.d/nginx-passenger.sh `
			` echo "sudo /usr/sbin/nginx" >> /etc/init.d/nginx-passenger.sh `
			` sudo update-rc.d nginx-passenger.sh defaults `
	 - [x] HTTP traffic should be forwarded to HTTPS by default ` https://laura.takl.dev/ `
	 - [x] Configure cert bot so that it will auto-renew the certificate.  
		``` echo "0 0,12 * * * python -c 'import random; import time; time.sleep(random.random() * 3600)' && 				certbot renew" | sudo tee -a /etc/crontab > /dev/null ```

	 
Keep in mind the best security practices when setting up the server.

Public Key:

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/OnTyD2h+0gASb0uXsTQ051izuw1SVXqUlwmfW4IigZ6wOxO5KW1ROYXZ+hjeRiAGZloDLgS1GQJ+jny2wkJ5jqGP904JuVMFqLdUbAWAht9q4E22HY6gNyT5/N9Y/5N2wzV2ZUMrjQzJYZkRMtC6e3OdlFfPwA/C752S+idqlie5jgAyKwnBqIXcfpoVlQ/1qiRih0Q9QuFCZh7BIGaKcnmg/04DTcGpYUsSZxwCRyiBsnmRM3e36uQmhU/71dKoSF+gYdlpey2qOwQ/mr9WMcrSVmQnL2/1IkK/IBP9ReCQ2ln8bykWY2duIZEjxv8IpnrJIHgH/5owfWjVQIZwy2RchxFFKYiBz7MsfL6ARCVq0oSMlW6qS9tVUXu/U2YUzhQGkudwi2axekSBAb0dmOyWvOSgLRn8iJOwLZjg/g+f9p5QjAxBcry9jTqIyTfT8pWApCLIGt/+kc/Fw61ETA+pjp1BvQ/kGkXRn1tdXMGP7NzN3fizgVkrpMJZt38= bilderberg@localhost.localdomain

