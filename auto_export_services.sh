#!/bin/bash
# 自动导出services配置 可以添加路径参数，实现高灵活度

set -x

# services的导出的路径

EXPORT_DIRECTORY="./export_services"
# 储存services的key的文件名
SERVICEFILE=service_list

if [ -d $EXPORT_DIRECTORY ]
then
rm -rf $EXPORT_DIRECTORY
fi

# 储存导出的services的文件夹
mkdir $EXPORT_DIRECTORY

# 处理get service输出字段，保留所有的服务名, 按行分割
kubectl get service | sed '1d' | gawk '{print $1}'> $SERVICEFILE
while read service
do
kubectl get service $service -o yaml > "$EXPORT_DIRECTORY"/"$service".yaml
done < $SERVICEFILE
