#!/bin/sh
echo ">===== STOPING GEOBENCH-SERVER =====<"
pm2 stop 0
echo ">===== REBUILDING PROJECT =====<"
npm run build
echo ">===== STARTING GEOBENCH-SERVER =====<"
pm2 start 0
