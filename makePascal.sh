:
[ "$1" == "DEBUG" ] && set -x
#
# simple script for making directories containing 100 files at a time
# for a pascal Voc dataset (train test validate)
#
RST_FIL_NUM=101
numfil=0
dirnum=1
totfil=0
filesHome=/mnt/c/linuxmirror/pascal
#for i in train test validation
for i in validation
do
   for fil in `ls $filesHome/$i/*`
   do
       numfil=`expr $numfil + 1`    # count in loops of RST_FIL_NUM
       totfil=`expr $totfil + 1`    # count the total number of files
       [ $numfil -eq $RST_FIL_NUM ] && numfil=1 && dirnum=`expr $dirnum + 1` # reset the counter when reaches 101
       if [ $numfil -eq 1 ]
       then
           [ -d $filesHome/$i$dirnum ] && rm -r $filesHome/$i$dirnum # exists already then delete it
           mkdir $filesHome/$i$dirnum # create it
       fi
       [ -f $fil ] && cp $fil $filesHome/$i$dirnum # copy the file to that directory
   done
   FIL_BATCHES=`expr $RST_FIL_NUM - 1`
   echo "Total files split up into parcels of $FIL_BATCHES are $totfil for $i"
done
