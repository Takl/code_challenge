# README

This is a basic rails app with a single route leading to the /me endpoint.

Things to be done:

* Set up a database of your choosing to be used for storing user data (username/encrypted passwords) [Done]


		CREATE TABLE `users` (
		`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
		`username` varchar(255) NOT NULL,
		`pswd` varchar(255) DEFAULT NULL,
		PRIMARY KEY (`id`),
		UNIQUE KEY `email` (`username`)
		) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8

		INSERT INTO `users` (`username`, `pswd`) VALUES ('laura.gasslein@gmail.com', MD5('pass123'));
		INSERT INTO `users` (`username`, `pswd`) VALUES ('lauraalexander28@comcast.net', MD5('shr54q!'));


* The /me endpoint should be authenticated using whatever method of user authentication you are comfortable with [Done but lamely]

		Instinctively, because it's a custom route/endpoint, I would do this with authtoken... For now just made  		  a login/password box, which I know is extremely dumb, how's this usually done in Rails/default method? 

* When a user makes an authenticated request to the /me endpoint, return a json payload greeting the user with their name (replace the current placeholder) [Done]

* When a request is made with failing authentication, an appropriate error is returned [Done]

1. Create a docker image for the sample application. [Done]

		sudo docker build . -t rails_junior_code_challenge
		sudo docker run --name rails_junior_code_challenge-mysql -e MYSQL_ROOT_PASSWORD=w3lcome9 -d mysql:5.5.62

2. Using the server 45.79.214.242 with the login root and password mE_vzkm2x7wxs.MUPZ2_ :

		 - Configure the server for SSH public key authentication.
		 - Add our public key as well as the one provided below	 
		 - Install NGINX and Docker and configure them both to automatically start at boot. [Done]
		 	sudo systemctl enable docker
		 - Using the default configuration for NGINX, create a reverse proxy that points to Docker image.
		 - Configure NGINX so that the default server name is laura.takl.dev [Done]
		 - Setup and configure certbot for the given domain name. [Done]
		 	echo "#!/bin/bash" >> /etc/init.d/nginx-passenger.sh
			echo "sudo /usr/sbin/nginx" >> /etc/init.d/nginx-passenger.sh
		 	sudo update-rc.d nginx-passenger.sh defaults
		 - HTTP traffic should be forwarded to HTTPS by default [Done https://laura.takl.dev/]
		 - Configure cert bot so that it will auto-renew the certificate. [Done] 
			echo "0 0,12 * * * python -c 'import random; import time; time.sleep(random.random() * 3600)' && 				certbot renew" | sudo tee -a /etc/crontab > /dev/null

	 
Keep in mind the best security practices when setting up the server.

Public Key:

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/OnTyD2h+0gASb0uXsTQ051izuw1SVXqUlwmfW4IigZ6wOxO5KW1ROYXZ+hjeRiAGZloDLgS1GQJ+jny2wkJ5jqGP904JuVMFqLdUbAWAht9q4E22HY6gNyT5/N9Y/5N2wzV2ZUMrjQzJYZkRMtC6e3OdlFfPwA/C752S+idqlie5jgAyKwnBqIXcfpoVlQ/1qiRih0Q9QuFCZh7BIGaKcnmg/04DTcGpYUsSZxwCRyiBsnmRM3e36uQmhU/71dKoSF+gYdlpey2qOwQ/mr9WMcrSVmQnL2/1IkK/IBP9ReCQ2ln8bykWY2duIZEjxv8IpnrJIHgH/5owfWjVQIZwy2RchxFFKYiBz7MsfL6ARCVq0oSMlW6qS9tVUXu/U2YUzhQGkudwi2axekSBAb0dmOyWvOSgLRn8iJOwLZjg/g+f9p5QjAxBcry9jTqIyTfT8pWApCLIGt/+kc/Fw61ETA+pjp1BvQ/kGkXRn1tdXMGP7NzN3fizgVkrpMJZt38= bilderberg@localhost.localdomain

**********************************************************
Notes to self
**********************************************************
cat /etc/letsencrypt/live/laura.takl.dev/fullchain.pem
-----BEGIN CERTIFICATE-----
MIIFVDCCBDygAwIBAgISA6NQaHLpU97yiXIhseY6lZhIMA0GCSqGSIb3DQEBCwUA
MEoxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MSMwIQYDVQQD
ExpMZXQncyBFbmNyeXB0IEF1dGhvcml0eSBYMzAeFw0xOTA2MjIxODU1MTRaFw0x
OTA5MjAxODU1MTRaMBkxFzAVBgNVBAMTDmxhdXJhLnRha2wuZGV2MIIBIjANBgkq
hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkRnUQbdbi3khKw3EniiXscsELvmcgrXg
byBtZU1AzMgD2ynYItdCFuoW9i/q1tMPWRifmONWmhRBF9Qp2aTXvb6rU1uUx3+h
UF284E5S/qEfzNsloft9ylcGl+ZnnsbnuPEc7vWQ3nPjxklXRrMwfTgUltLa3T0f
QMMA6Ev2orJoxBNic/NyhjuFT6aMdHWUEa/yRBz6/rdRw4xn8SqxYnkgYR00Klwj
ffSlrm+/LP6LTJgACxifqtoWo3bO55l0p+I2KIFvsQACc83tNC8i1MsCvDZSAIQq
QVhtWo5jrefNnSOUG3XTvgsn4zJWyQpsPCH6GNxrA9XKPDj2QBMd3QIDAQABo4IC
YzCCAl8wDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEF
BQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSgpVRcY1YeZbCzlHXbwrI/gTSr
TDAfBgNVHSMEGDAWgBSoSmpjBH3duubRObemRWXv86jsoTBvBggrBgEFBQcBAQRj
MGEwLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwLmludC14My5sZXRzZW5jcnlwdC5v
cmcwLwYIKwYBBQUHMAKGI2h0dHA6Ly9jZXJ0LmludC14My5sZXRzZW5jcnlwdC5v
cmcvMBkGA1UdEQQSMBCCDmxhdXJhLnRha2wuZGV2MEwGA1UdIARFMEMwCAYGZ4EM
AQIBMDcGCysGAQQBgt8TAQEBMCgwJgYIKwYBBQUHAgEWGmh0dHA6Ly9jcHMubGV0
c2VuY3J5cHQub3JnMIIBBAYKKwYBBAHWeQIEAgSB9QSB8gDwAHcA4mlLribo6UAJ
6IYbtjuD1D7n/nSI+6SPKJMBnd3x2/4AAAFrgMHSkwAABAMASDBGAiEA7GTo/y30
SzGkAscCjCF2z4Nr66YHOP1qtyg39tDzDagCIQC93ovDB2CH3gHrN2eQT240rgZj
lp9XwAg9eeYnD89xVgB1AGPy283oO8wszwtyhCdXazOkjWF3j711pjixx2hUS9iN
AAABa4DB0rgAAAQDAEYwRAIgO8WgMHVLTzfgMV/9I9t2jdyIQIMbQ8CxW1ivRgQM
N/8CIAmjOd+I5J7ieqCewWXwS6dSLN0PVnC+et01VTX1MVtoMA0GCSqGSIb3DQEB
CwUAA4IBAQBIbHqTdYYWzunHBoHXucyCFm0yeo/YN1xRQTRtGXsa+VrUb6M3u0wV
KtkPieqlrnu8sW/B9JQeWgO6NnMzoYEqRcGIj3ANpmTe204NOTusl8TFLbhsi8wA
cBuhaBVqZ91Sm9apr+tRZQdrW7xmcaRs/9Wc3cmAjgcULJBCeguUlg3JSRxVCnv3
MkBxIp+Yf4fFxaawcng9QFXr2paZQfEtDADVqU1Gh5IX4zzQP9rkJSNYpXaAyR7C
9sf4MeRnaYb67RVC+U++1Y29pMZQngb8cF6irneNn9n7ccuW6z1qmK81kl1pz3/G
i/u6+1hZlJSeMV2aOHxPuiye/YSOcnVD
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIEkjCCA3qgAwIBAgIQCgFBQgAAAVOFc2oLheynCDANBgkqhkiG9w0BAQsFADA/
MSQwIgYDVQQKExtEaWdpdGFsIFNpZ25hdHVyZSBUcnVzdCBDby4xFzAVBgNVBAMT
DkRTVCBSb290IENBIFgzMB4XDTE2MDMxNzE2NDA0NloXDTIxMDMxNzE2NDA0Nlow
SjELMAkGA1UEBhMCVVMxFjAUBgNVBAoTDUxldCdzIEVuY3J5cHQxIzAhBgNVBAMT
GkxldCdzIEVuY3J5cHQgQXV0aG9yaXR5IFgzMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEAnNMM8FrlLke3cl03g7NoYzDq1zUmGSXhvb418XCSL7e4S0EF
q6meNQhY7LEqxGiHC6PjdeTm86dicbp5gWAf15Gan/PQeGdxyGkOlZHP/uaZ6WA8
SMx+yk13EiSdRxta67nsHjcAHJyse6cF6s5K671B5TaYucv9bTyWaN8jKkKQDIZ0
Z8h/pZq4UmEUEz9l6YKHy9v6Dlb2honzhT+Xhq+w3Brvaw2VFn3EK6BlspkENnWA
a6xK8xuQSXgvopZPKiAlKQTGdMDQMc2PMTiVFrqoM7hD8bEfwzB/onkxEz0tNvjj
/PIzark5McWvxI0NHWQWM6r6hCm21AvA2H3DkwIDAQABo4IBfTCCAXkwEgYDVR0T
AQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAYYwfwYIKwYBBQUHAQEEczBxMDIG
CCsGAQUFBzABhiZodHRwOi8vaXNyZy50cnVzdGlkLm9jc3AuaWRlbnRydXN0LmNv
bTA7BggrBgEFBQcwAoYvaHR0cDovL2FwcHMuaWRlbnRydXN0LmNvbS9yb290cy9k
c3Ryb290Y2F4My5wN2MwHwYDVR0jBBgwFoAUxKexpHsscfrb4UuQdf/EFWCFiRAw
VAYDVR0gBE0wSzAIBgZngQwBAgEwPwYLKwYBBAGC3xMBAQEwMDAuBggrBgEFBQcC
ARYiaHR0cDovL2Nwcy5yb290LXgxLmxldHNlbmNyeXB0Lm9yZzA8BgNVHR8ENTAz
MDGgL6AthitodHRwOi8vY3JsLmlkZW50cnVzdC5jb20vRFNUUk9PVENBWDNDUkwu
Y3JsMB0GA1UdDgQWBBSoSmpjBH3duubRObemRWXv86jsoTANBgkqhkiG9w0BAQsF
AAOCAQEA3TPXEfNjWDjdGBX7CVW+dla5cEilaUcne8IkCJLxWh9KEik3JHRRHGJo
uM2VcGfl96S8TihRzZvoroed6ti6WqEBmtzw3Wodatg+VyOeph4EYpr/1wXKtx8/
wApIvJSwtmVi4MFU5aMqrSDE6ea73Mj2tcMyo5jMd6jmeWUHK8so/joWUoHOUgwu
X4Po1QYz+3dszkDqMp4fklxBwXRsW10KXzPMTZ+sOPAveyxindmjkW8lGy+QsRlG
PfZ+G6Z6h7mjem0Y+iWlkYcV4PIWL1iwBi8saCbGS5jN2p8M+X+Q7UNKEkROb3N6
KOqkqm57TH2H3eDJAkSnh6/DNFu0Qg==
-----END CERTIFICATE-----


cat  /etc/letsencrypt/live/laura.takl.dev/privkey.pem
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCRGdRBt1uLeSEr
DcSeKJexywQu+ZyCteBvIG1lTUDMyAPbKdgi10IW6hb2L+rW0w9ZGJ+Y41aaFEEX
1CnZpNe9vqtTW5THf6FQXbzgTlL+oR/M2yWh+33KVwaX5meexue48Rzu9ZDec+PG
SVdGszB9OBSW0trdPR9AwwDoS/aismjEE2Jz83KGO4VPpox0dZQRr/JEHPr+t1HD
jGfxKrFieSBhHTQqXCN99KWub78s/otMmAALGJ+q2hajds7nmXSn4jYogW+xAAJz
ze00LyLUywK8NlIAhCpBWG1ajmOt582dI5QbddO+CyfjMlbJCmw8IfoY3GsD1co8
OPZAEx3dAgMBAAECggEAUqd39YdRKn3xmujY248b+jc/RtMBiKO6GRNLvazoAL7f
E3UenZopF4x5T/uztnO8BnC0WQ8HQfXPrpc4z7XK/1chmPZOJeZaKcF72fpD5LA7
wSIEqeTsnto780NYO2XqkbsnVCemQlGZqlYU1T01nd7YO6IY8nXi2605UxoSgFJt
L7wSISIZYx6CH8gPuR8KJMR8CgZp6ShE0HuSDz64cIM3/JyYZyj2zN+tuy08//tV
/fGlFhzXmImHSgJj/OL2Z6RywTQ+ljOx5Gu0LAL5YmRdxYNGYl3+15fpk8PDbHW0
pGYcmUv1AB4dLW+F9ARoM4SQbQ18XpNtD3mDLpiRsQKBgQDA11M65xBsFLlLzuEZ
n6JB3jjUU1W1/wjELMuneLfcNhrZngq+X2647fCeqd8H00/vV27uKCG4aFHFNzSU
cpQQGRwFnh+HqHNp9SPhWqmZ+riTcAipJ98NLWbWJeR4giBa7t3BJDOvhqwY2et7
vy4/F38By2ywwCdxtwugFo7hnwKBgQDAn79KmNgzXVlDhspxstlHQgowTRbl4EKT
rE9XNDnWFXCDfgAhVrn4789mUOGh1lHUNPbMU6/LU8AjbTwSB+nbv6lYP0mF36nc
xCHhxlOod//WHjoH7upIWdC41ijlRaozVNxnzXq2f2FFirZHVWKGWDLrrH6Am2by
+8rRnzDnAwKBgGKKZYR26IRiPqGHUK14TkCcXqvY/bZnYUJlpZepb0J+/09unAzV
1U14gPmC0m48Q9+I7S2Tok+KNyaw5BRrTE/BlPkl6PS4Vmmxk6knW/1MCh+FI1fV
APzJ03/gkxQlYoU1BGoaprKt/akhSlzMv8QLrKHtIlhbiIxqPe2LOW3/AoGBALDU
9kOBNVlSJRQ8tbTTP2yPT9MvsgmuavAui1e+9il23SeZkH0KpQfG/1sqfTiZC94I
EVlaqlO6uvTK3w6efS3jMY916gUgY0vsMj6WV06dexwR+6w0xJdO/LHyyPBRmAIv
sXcJx9Gp9p5kzRmHZT930KdSX3+pKkV+qZ7uyXIJAoGAdJgUMLSENrHoJnPj2brs
XrLYSjnEOmnJPEX4wKzx4A7uNKW/4iIUAH2XC5YsPkzJgv9cHgBjKB6juYkCQ2Rn
8SCtxXbwD3bM2uGifSgUp4BQ/GqBsfeocXsGSbyiVVeQIon83BntNuvCOmwI2wVK
d/Qvndf6gF6JtvZtS6a7qC0=
-----END PRIVATE KEY-----

