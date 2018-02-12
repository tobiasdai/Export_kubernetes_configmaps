#!/bin/bash
# 自动导出deployments配置 可以添加路径参数，实现高灵活度

set -x

# deployments的导出的路径

EXPORT_DIRECTORY="./export_deployments"
# 储存deployments的key的文件名
DEPLOYMENTFILE=deployment_list

if [ -d $EXPORT_DIRECTORY ]
then
rm -rf $EXPORT_DIRECTORY
fi

# 储存导出的deployments的文件夹
mkdir $EXPORT_DIRECTORY

# 处理get deployment输出字段，保留所有的服务名, 按行分割
kubectl get deployment | sed '1d' | gawk '{print $1}'> $DEPLOYMENTFILE
while read deployment
do
kubectl get deployment $deployment -o yaml --export > "$EXPORT_DIRECTORY"/"$deployment".yaml
done < $DEPLOYMENTFILE
