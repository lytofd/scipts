
#/bin/bash
echo "begin"
PORT_LIST=( "6666" "7838" "8838" "8666" )
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
