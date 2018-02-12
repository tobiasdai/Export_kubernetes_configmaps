#!/bin/bash
# 自动导入secrets配置 可以添加路径参数，实现高灵活度

set -x

# secrets的导入的路径
IMPORT_DIRECTORY="./export_secrets"
# 储存secrets的key的文件名
SECRETFILE=secret_list

if [ ! -d $IMPORT_DIRECTORY ]
then
exit 1
fi

while read secret
do 
kubectl apply -f "$IMPORT_DIRECTORY"/"$secret".yaml
done < $SECRETFILE
