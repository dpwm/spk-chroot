CONTAINER_NAME=spk-test
BASE=alpine:latest
docker run -d --rm --name="${CONTAINER_NAME}" "${BASE}" /bin/sleep infinity
docker cp setup.sh "${CONTAINER_NAME}:/tmp/setup.sh"
docker exec sh /tmp/setup.sh
docker export "${CONTAINER_NAME}" | tar -C root -xvp
docker stop "${CONTAINER_NAME}"
