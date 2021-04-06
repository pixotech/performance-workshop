
mkdir lhci-data # creates this folder if it doesn't exist
chmod 777 lhci-data # lighthouse runs unprivledged and your user account probably doesn't exist in the container

docker container run --cap-add=SYS_ADMIN \
  --rm \
  --cpus="1" --shm
  -v "$(pwd)/lhci-data:/home/lhci/reports/.lighthouseci" \
  patrickhulce/lhci-client \
  lhci collect --url="https://pixotech.com"

# If you don't have a token, run
# lhci wizard

docker container run \
  --rm \
  -v "$(pwd)/lhci-data:/home/lhci/reports/.lighthouseci" \
  patrickhulce/lhci-client \
  lhci upload --type "lhci" --token "56d601b2-342a-4f53-907d-9ae4f8721e9e" --serverBaseUrl "http://docker.i.pixotech.com:9003/
