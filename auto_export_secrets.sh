#!/bin/bash
# 自动导出secrets配置 可以添加路径参数，实现高灵活度

set -x

# secrets的导出的路径

EXPORT_DIRECTORY="./export_secrets"
# 储存secrets的key的文件名
SECRETFIGFILE=secret_list

if [ -d $EXPORT_DIRECTORY ]
then
rm -rf $EXPORT_DIRECTORY
fi


# 储存导出的secrets的文件夹
mkdir $EXPORT_DIRECTORY

# 处理secrets输出字段，保留所有的key, 按行分割
kubectl get secret | sed '1d' | gawk '{print $1}' > $SECRETFIGFILE

while read secret
do 
kubectl get secret $secret -o yaml --export > "$EXPORT_DIRECTORY"/"$secret".yaml
done < $SECRETFIGFILE

