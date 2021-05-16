CONTAINER_NAME=spk-test
BASE=archlinux:latest
rm -rf root
mkdir root
echo "Create docker container"
docker run -d --rm --name="${CONTAINER_NAME}" "${BASE}" /bin/sleep infinity
docker cp setup.sh "${CONTAINER_NAME}:/tmp/setup.sh"
echo "Execute setup.sh"
docker exec "${CONTAINER_NAME}" sh /tmp/setup.sh
docker export "${CONTAINER_NAME}" | tar -C root -xp
echo "Cleaning up"
docker stop "${CONTAINER_NAME}"
