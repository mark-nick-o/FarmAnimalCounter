:
yourFolder=anumal/testanimal
for i in `ls /mnt/c/linuxmirror/$yourFolder`; do echo $i; fil=`echo $i | awk '-F.' '{ print $1 }'`; ext=`echo $i | awk '-F.' '{print $2}'`;cp /mnt/c/linuxmirror/$yourFolder/$i /mnt/c/linuxmirror/$yourFolder/$num.$ext; num=`expr $num + 1`; done
