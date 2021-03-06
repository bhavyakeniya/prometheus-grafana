#!/bin/sh -e

cat /etc/alertmanager/alertmanager.yml |\
    sed "s@#api_url: <url>#@api_url: '$SLACK_URL'@g" > /tmp/alertmanager.yml

mv /tmp/alertmanager.yml /etc/alertmanager/alertmanager.yml

set -- /bin/alertmanager "$@"

exec "$@"
