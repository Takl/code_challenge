# README

This is a basic rails app with a single route leading to the /me endpoint.

Things to be done:

* Set up a database of your choosing to be used for storing user data (username/encrypted passwords)


		CREATE TABLE `users` (
		`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
		`username` varchar(255) NOT NULL,
		`pswd` varchar(255) DEFAULT NULL,
		PRIMARY KEY (`id`),
		UNIQUE KEY `email` (`username`)
		) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8

		INSERT INTO `users` (`username`, `pswd`) VALUES ('laura.gasslein@gmail.com', MD5('pass123'));
		INSERT INTO `users` (`username`, `pswd`) VALUES ('lauraalexander28@comcast.net', MD5('shr54q!'));


* The /me endpoint should be authenticated using whatever method of user authentication you are comfortable with

* When a user makes an authenticated request to the /me endpoint, return a json payload greeting the user with their name (replace the current placeholder)

* When a request is made with failing authentication, an appropriate error is returned

1. Create a docker image for the sample application.
2. Using the server 45.79.214.242 with the login root and password mE_vzkm2x7wxs.MUPZ2_ :
Configure the server for SSH public key authentication.
	 - Add our public key as well as the one provided below
Install NGINX and Docker and configure them both to automatically start at boot.
Using the default configuration for NGINX, create a reverse proxy that points to Docker image.
Configure NGINX so that the default server name is laura.takl.dev
Setup and configure certbot for the given domain name. 
	- HTTP traffic should be forwarded to HTTPS by default
	- Configure cert bot so that it will auto-renew the certificate.
Keep in mind the best security practices when setting up the server.

Public Key:

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/OnTyD2h+0gASb0uXsTQ051izuw1SVXqUlwmfW4IigZ6wOxO5KW1ROYXZ+hjeRiAGZloDLgS1GQJ+jny2wkJ5jqGP904JuVMFqLdUbAWAht9q4E22HY6gNyT5/N9Y/5N2wzV2ZUMrjQzJYZkRMtC6e3OdlFfPwA/C752S+idqlie5jgAyKwnBqIXcfpoVlQ/1qiRih0Q9QuFCZh7BIGaKcnmg/04DTcGpYUsSZxwCRyiBsnmRM3e36uQmhU/71dKoSF+gYdlpey2qOwQ/mr9WMcrSVmQnL2/1IkK/IBP9ReCQ2ln8bykWY2duIZEjxv8IpnrJIHgH/5owfWjVQIZwy2RchxFFKYiBz7MsfL6ARCVq0oSMlW6qS9tVUXu/U2YUzhQGkudwi2axekSBAb0dmOyWvOSgLRn8iJOwLZjg/g+f9p5QjAxBcry9jTqIyTfT8pWApCLIGt/+kc/Fw61ETA+pjp1BvQ/kGkXRn1tdXMGP7NzN3fizgVkrpMJZt38= bilderberg@localhost.localdomain