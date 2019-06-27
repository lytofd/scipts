#测试脚本，由于FATE框架运行时候需要频繁的修改partyid，所以这里写了个脚本来自动修改。
#/bin/bash
BASE_DIR="~/FATE/cluster-deploy/example-dir-tree/"
SUB_DIR=("federation" "meta-service" "roll")
FILE_LIST=("federation.properties" "meta-service.properties" "roll.properties")
for((index=0;index<${#SUB_DIR[@]};index++))
do

    FILE_NAME=${BASE_DIR}${SUB_DIR[$index]}"/conf/"${FILE_LIST[$index]}
    echo $FILE_NAME
    #sed -i "s/party.id=1/party.id=2/g" $FILE_NAME
done
sed -i "s/party.id=1/party.id=2/g" sed_test.txt
