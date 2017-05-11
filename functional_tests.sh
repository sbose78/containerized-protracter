#!/usr/bin/env bash

# Run the container
#docker run --detach=true --name=heroes-builder  --user=root --cap-add=SYS_ADMIN -t -v $(pwd)/dist:/dist:Z heroes-builder


#docker exec heroes-builder npm install
#docker exec heroes-builder npm start

npm install
npm start >> start.log 2>&1 &

while ! (ncat -w 1 127.0.0.1 4200 </dev/null >/dev/null 2>&1); do sleep 1; done
echo done.

protractor protractor.conf.js