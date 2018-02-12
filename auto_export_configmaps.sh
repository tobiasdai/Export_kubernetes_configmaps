#!/bin/bash
# 自动导出configmap配置 可以添加路径参数，实现高灵活度

set -x

# configmaps的导出的路径

EXPORT_DIRECTORY="./export_configs"
# 储存configmaps的key的文件名
CONFIGFILE=config_list

if [ -d $EXPORT_DIRECTORY ]
then
rm -rf $EXPORT_DIRECTORY
fi


# 储存导出的configs的文件夹
mkdir $EXPORT_DIRECTORY

# 处理configmaps输出字段，保留所有的key, 按行分割
kubectl get configmaps | sed '1d' | gawk '{print $1}' > $CONFIGFILE

while read config
do 
kubectl get configmap $config -o yaml > "$EXPORT_DIRECTORY"/"$config".yaml
done < $CONFIGFILE






