#!/bin/bash
# 自动导入configmap配置 可以添加路径参数，实现高灵活度

set -x

# configmaps的导入的路径
IMPORT_DIRECTORY="./export_configs"
# 储存configmaps的key的文件名
CONFIGFILE=config_list

if [ ! -d $IMPORT_DIRECTORY ]
then
exit 1
fi

while read config
do 
kubectl apply -f "$IMPORT_DIRECTORY"/"$config".yaml
done < $CONFIGFILE
