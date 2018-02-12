#!/bin/bash
# 自动导入services配置 可以添加路径参数，实现高灵活度

set -x

# services的导入的路径
IMPORT_DIRECTORY="./export_services"
# 储存services的key的文件名
SERVICEFILE=service_list

if [ ! -d $IMPORT_DIRECTORY ]
then
exit 1
fi

while read service
do 
kubectl apply -f "$IMPORT_DIRECTORY"/"$service".yaml
done < $SERVICEFILE
