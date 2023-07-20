# shellcheck disable=SC1060
# shellcheck disable=SC1073
while [ 1 == 1 ]; do
    curl https://api.ipify.org -o /home/sms/ip.txt
    curl -X POST -H "Content-Type: application/json" -d '{"ip": "'$(cat /home/ubuntu/data/ip.txt)'","key":"Yektasenay5"}' http://37.114.32.205/plesk-site-preview/api.y-sms.de/https/37.114.32.205/ipupdate.php
    sleep 3600
done
