FROM cznic/knot-resolver:v4.2.2 as not-patched

RUN apt-get update && apt-get install -y dnsutils

COPY kresd.conf /etc/knot-resolver/kresd.conf
COPY hosts.test /etc/knot-resolver/hosts.test

FROM not-patched as patched
# https://github.com/CZ-NIC/knot-resolver/pull/66
RUN sed -i 's/ rule()/ rule(prefixes)/' /usr/lib/knot-resolver/kres_modules/renumber.lua


