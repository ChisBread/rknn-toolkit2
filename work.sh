#!/usr/bin/env bash
if [ "`sudo docker ps|grep rknn-toolkit2-work`" == "" ]; then
    sudo docker run -d -it --name rknn-toolkit2-work -v $PWD:/src -w /src chisbread/rknn-toolkit2:1.4 bash
fi
sudo docker exec -it rknn-toolkit2-work bash