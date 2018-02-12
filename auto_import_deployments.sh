#!/bin/bash
# 自动导入deployments配置 可以添加路径参数，实现高灵活度

set -x

# deployments的导入的路径
IMPORT_DIRECTORY="./export_deployments"
# 储存deployment的key的文件名
DEPLOYMENTFILE=deployment_list

if [ ! -d $IMPORT_DIRECTORY ]
then
exit 1
fi

while read deployment
do 
kubectl apply -f "$IMPORT_DIRECTORY"/"$deployment".yaml
done < $DEPLOYMENTFILE
