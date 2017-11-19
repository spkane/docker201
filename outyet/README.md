Build Status: [![Build Status](http://127.0.0.1:10081/buildStatus/icon?job=outyet)](http://127.0.0.1:10081/job/outyet/)

Forked from: https://github.com/golang/example

# Build
docker build -f Dockerfile.build
docker run -d ${BUILD_IMAGE_ID} sleep 60
docker cp ${TEMP_CONTAINER_ID}:/go/src/outyet/outyet .
docker build -f Dockerfile.deploy
docker tag ${DEPLOY_IMAGE_ID} ${HUB_ID}/outyet:latest
docker push ${HUB_ID}/outyet:latest
