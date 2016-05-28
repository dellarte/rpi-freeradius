# rpi-freeradius
Docker image containing FREERADIUS that is compatible to the Raspberry Pi. **This version of freeradius is modified to be compatible with One-Time Password and MySQL !!**
### Build the Docker Image
```bash make build ```
### Push Docker Image to Docker Hub
* First, use a `docker login` with username, password and email address * Second, push Docker Image to the official Docker Hub ```bash make push```
### Run in a Container
```bash docker run -d --name rpi-freeradius -p 1812:1812/udp --link rpi-mysql:rpi-mysql -v ${HOME}/docker/data/freeradius/otpverify.sh:/etc/freeradius/otpverify.sh:ro . . . -v 
${HOME}/docker/data/freeradius/radiusd.conf:/etc/freeradius/radiusd.conf:ro dellarte/rpi-freeradius ``` **I will not provide configurations files until someone ask for it**
### MYSQL
Do not forget to add this records in your database for each users : ```bash INSERT INTO `radcheck` VALUES (NULL,'user','Auth-Type','=','External') INSERT INTO `radreply` VALUES 
(NULL,'user','Secret',':=','xxxxxxxxxxxxxxxx'), (NULL,'user','Pin',':=','0000'),(NULL,'user','Offset',':=','0')
```
