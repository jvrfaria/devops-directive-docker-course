openssl req -x509 -newkey rsa:4096 -days 365 -nodes -keyout ca-key.pem -out ca-cert.pem -subj "/C=BR/ST=São Paulo/L=São Paulo/O=João/OU=Victor/CN=*.jvrfaria.cert/emailAddress=jvrfaria1409@hotmail.com"

echo "CA's self-signed certificate"
openssl x509 -in ca-cert.pem -noout -text

openssl req -newkey rsa:4096 -nodes -keyout server-key.pem -out server-req.pem -subj "/C=BR/ST=São Paulo/L=São Paulo/O=João/OU=Victor/CN=*.jvrfaria.internal/emailAddress=jvrfaria1409@hotmail.com"

openssl x509 -req -in server-req.pem -days 60 -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem

openssl x509 -in server-cert.pem -noout -text

openssl verify -CAfile ca-cert.pem server-cert.pem
