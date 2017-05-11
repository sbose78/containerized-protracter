#!/usr/bin/env bash

echo "Ensuring the port $SERVER_PORT is freed."
fuser -k -n tcp $SERVER_PORT

npm start >> start.log 2>&1 &

while ! (ncat -w 1 127.0.0.1 $SERVER_PORT </dev/null >/dev/null 2>&1); do sleep 1; done
echo "Angular app is running on port $SERVER_PORT , startup logs is in start.log".

protractor protractor.conf.js