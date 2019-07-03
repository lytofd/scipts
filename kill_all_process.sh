#脚本用于tensorflow model 分布式训练时，进程没有被杀死的情况，端口数组可以自己定义。
#/bin/bash
echo "begin"
PORT_LIST=( "6000" "5000" "6001" "5001" )

for ((index=0;index<${#PORT_LIST[@]};index++))
do
   PID_INFO=`lsof -i:${PORT_LIST[$index]} | awk -F " " '{ if(NR>1) print $2 }' `
   if [  -z "$PID_INFO" ]
   then
     continue
   else
      for id in $PID_INFO
      do
        kill -9 $id
      done
   fi

done

kill_process(){
    NCF_PIDS=`ps -ef | grep $1 | awk  -F " " '{ print $2 }'`
    #echo $NCF_PIDS
    for pid in $NCF_PIDS
    do
      sudo kill -9 $pid
    done
    ZOMBIES=`ps -ef | grep ncf_main | awk -F " "  '{print $3}'`
    echo $ZOMBIES
    if [ ! -z "$ZOMBIES" ]
    then
       echo "there exists zombie process"
       for father_id in $ZOMBIES
       do
           sudo kill -9 $father_id
       done
    else
       echo "no zombie"
    fi
}


kill_process ncp_main
kill_process tee
