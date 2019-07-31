# Build Calamari server in Docker container

Build an Ubuntu Trusty package:

    $ sudo docker build -t local/calamari-server .

Extract package from Docker image:

    $ CID=$(sudo docker create local/calamari-server)
    $ sudo docker cp $CID:/tmp/calamari-server.deb .
    $ sudo docker stop $CID

calamari--192.168.100.8:/var/www/html/calamari1.3
