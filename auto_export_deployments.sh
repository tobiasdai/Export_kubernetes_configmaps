#!/bin/bash
# 自动导出deployments配置 可以添加路径参数，实现高灵活度

set -x

# deployments的导出的路径

EXPORT_DIRECTORY="./export_deployments"
# 储存configmaps的key的文件名
CONFIGFILE=deployment_list


# 储存导出的configs的文件夹
mkdir $EXPORT_DIRECTORY

# 处理configmaps输出字段，保留所有的key, 按行分割
kubectl get configmaps > configmaps
sed -i '1d' configmaps | gawk '{print $1}' configmaps > $CONFIGFILE

while read config
do
kubectl get configmap $config -o yaml > "$EXPORT_DIRECTORY"/"$config".yaml
done < $CONFIGFILE
