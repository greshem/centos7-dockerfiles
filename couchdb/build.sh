docker build -t couchdb:centos7 ./

echo docker run -d -p 5984:5984 couchdb:centos7

curl -X PUT http://localhost:5984/test/

curl -X GET http://localhost:5984/test/


