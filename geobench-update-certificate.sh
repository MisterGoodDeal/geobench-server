#!/bin/sh

echo ">===== Stopping geobench-server... =====<"
pm2 stop 0
echo ">===== geobench-server stopped! =====<"
echo ">===== Running certbot to renew certificate =====<"
#certbot certonly --standalone -d api.geobench.turtlecorp.fr
certbot renew
echo ">===== Certificate renewed =====<"
echo ">===== Restarting geobench-server... =====<"
pm2 start 0
echo ">===== geobench-server started! =====<"



