#!/bin/bash

IFS=$'\n'

for line in $(cat Shell_Userlist.csv)
do
    id=`echo $line | cut -d "," -f 1`
    firstName=`echo $line | cut -d "," -f 2`
    name=`echo $line | cut -d "," -f 3`
    pwd=`echo $line | cut -d "," -f 4`
    role=`echo $line | cut -d "," -f 5`

    userName=`echo ${firstName:0:1}$name | awk '{print tolower($0)}'`

    if let $id 2>/dev/null
    then
        #sudo userdel -r $userName
        useradd -m -c "$firstName $name" -u $id -s /bin/bash $userName
        echo $userName:$pwd | chpasswd
        if [ ${role:0:5} = "Admin" ]
        then
            #Une ligne "%admin ALL=(ALL) ALL" est déjà présente dans /etc/sudoers
            #Je m'en sers pour donner les droits super utilisateur
            if [ $(cat /etc/group | grep ^admin$ | wc -l) != 1 ]
            then
                groupadd admin
            fi
            usermod -a -G admin $userName
        fi    
    fi
done

