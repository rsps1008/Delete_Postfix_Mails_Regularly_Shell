#!/bin/sh
#Deletes emails older than this number of days

OLD_THAN_DAYS=60
for i in `ls /home`; do
{
       if [ ! -d /home/$i/Maildir ]; then
               continue;
       fi

       for file in `find /home/$i/Maildir -mtime +${OLD_THAN_DAYS} | grep -E '/cur/|/new/'`; do
       {
               rm -fv $file;
       };
       done;
};
done;
rm -fv `find /root/Maildir -mtime +${OLD_THAN_DAYS} | grep -E '/cur/|/new/'`
exit 0;
