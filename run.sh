
builds=(not-patched patched)
for build in "${builds[@]}"
do
    echo "Running \"$build\" version"
    PATCH=$build docker-compose up -d --build > /dev/null
    dig @127.0.0.1 +short testa
    docker exec dns dig @127.0.0.1 +short testa

    dig @127.0.0.1 +short testb
    docker exec dns dig @127.0.0.1 +short testb

done
docker-compose rm -f