Steps to create Virtual SSL with DNS validated.

ROOT SSL: This files necesary to validate local URL.

1.- openssl genrsa -des3 -out rootCA.key 2048

- This commands will be used to create rootSSL.

2.- openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem

- This parameters will be used to create rootSSL.

MaC -- TRUST root SSL

- Open KeyChain Access on Mac and go to Certificates category on system.
- Import rootCA.pem Files>importa items.
- Double click on rootCA.pem importated, and accept trust.

DOMAIN SSL Certificate:

1.- Create next file server.csr.cnf

[req]
- default_bits = 2048
- prompt = no
- default_md = sha256
- distinguished_name = dn

[dn]
 - C=US
 - ST=RandomState
 - L=RandomCity
 - O=RandomOrganization
 - OU=RandomOrganizationUnit
 - emailAddress=hello@example.com
 - CN = localhost

2.- Create file called v3.ext to create a X509 V3 certificate.

- authorityKeyIdentifier=keyid,issuer
- basicConstraints=CA:FALSE
- keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
- subjectAltName = @alt_names

[alt_names]

- DNS.1 = localhost

3.- Execute next line commands and parameters:

openssl req -new -sha256 -nodes -out server.csr -newkey rsa:2048 -keyout server.key -config <( cat server.csr.cnf )


4.- Will create the certifcate necesary to validate Local DNS

openssl x509 -req -in server.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out server.crt -days 500 -sha256 -extfile v3.ext


EDIT /ETC/HOSTS

1.- Will be necesary to edit /etc/hosts of windows + mac o linux with DNS selected

Note:

This steps using command openssl can be used to windows and linux version, and rootCA.pem on this way:

Windows:

1.- Microsoft Management Console MMC.EXE

2.- Add/Remove Snap In

	2.1 - Certificates for the Computer Account and in the next screen for the Local Computer

3.- Import root into Trusted Root Certification Authorities

	3.1 - The Import Wizard starts, now. Use "Local Machine" and Next
	3.2 - * Browse for file rootCA.crt instead rootCA.pem
	3.3 - Browse for the correct Certificate Location for root (Trusted Root Certification Authorities)
	3.4 - Finish the import of root
	3.5 - And be sure you trust it. Rightclick root as CA cert Signing Authority and select Properties
	
Note: Command to change pem to crt file, used at windows Certification Authorities (openssl x509 -outform der -in rootCA.pem -out rootCA.crt)
	
4.- Import "class3" into "Intermediate Certification Authorities"

	4.1 The Import Wizard starts, now. Use "Local Machine" and "Next".
	4.2 Browse for file "server.crt"
	4.3 Browse for the correct Certificate Location for "root" (Trusted Root Certification Authorities)
	4.4 Finish the import of "root"
	4.5 And be sure you trust it. Rightclick "root" as "CA cert Signing Authority" and select Properties.
