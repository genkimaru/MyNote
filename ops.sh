1、 编写shell脚本，将/usr/local/test目录下大于100k的文件转移到/tmp目录下：

#!/bin/bash

for FILE in `ls /usr/local/test`
do
    if [ -f $FILE ] ; then
        if [ `ls -l  $FILE | awk `{print $5}` -gt 100000 ] ; then
            mv $FILE  /tmp/
        fi
    fi
done

2、一台监控主机，一台被监控主机。被监控主机分区使用率大于80%，就发告警邮件。放到crontab里面，每10分钟执行一次。
        a、 首先两台机器要建立服务器间的信任关系。
        b、脚本：
              #！/bin/bash
              
                FSMAX="80"
                remote_user='root'
                remote_ip=(IP地址列表)
                 ip_num='0'
                while [ "$ip_num" -le "$(expr ${#remote_ip[@]} -l)"]
                do
                        read_num='1'
                        ssh "$remote_user"@"${remote_ip[$ip_num]}"  df -h > /tmp/diskcheck_tmp
                        grep '^/dev/*'  /tmp/diskcheck_tmp | awk '{print $5}'|sed 's/\%//g'  > /tmp/diskcheck_num_tmp
                    

                            while [ "$read_num" -le $(wc -l < /tmp/diskcheck_num_tmp) ]
                            do
                                    size=$(sed -n "$read_num" 'p'  /tmp/diskcheck_num_tmp)
                                            if [ "size" -gt "$FSMAX" ]
                                            then
                                                    $(grep '^/dev/*'  /tmp/diskcheck_tmp |sed -n $read_num'p'  > /tmp/disk_check_mail)
                                                    $(echo ${remote_ip[$ip_num]}) >> /tmp/disk_check_mail)
                                                    $(mail  -s "diskcheck_alert"  admin  <  /tmp/disk_check_mail)
                                            fi
                                    read_num=$(expr  $read_num + 1)
                            done
                        ip_num=$(expr  $ip_num + 1)
              done
              ===================写入crontab=====================
                0/10 * * * *   /home/diskcheck.sh   2&>1
				
				
				
				
6、自动ftp上传
     
   #! /bin/bash
    ftp -n << END_FTP
    open 192.168.1.22
    user  test testing      //用户名test  密码：testing
    binary
    prompt  off    //关闭提示
    mput   files     //上传files文件
    close
    bye
    END_FTP
	
	
	查看主机网卡流量 
	#!/bin/bash
	#network #Mike.Xu 
	while : ; 
	do time='date +%m"-"%d" "%k":"%M'
	day='date +%m"-"%d' 
	rx_before='ifconfig eth0|sed -n "8"p|awk '{print \$2}'|cut -c7-' 
	tx_before='ifconfig eth0|sed -n "8"p|awk '{print \$6}'|cut -c7-' 
	sleep 2 
	rx_after='ifconfig eth0|sed -n "8"p|awk '{print \$2}'|cut -c7-' 
	tx_after='ifconfig eth0|sed -n "8"p|awk '{print \$6}'|cut -c7-'
	rx_result=\$[(rx_after-rx_before)/256] 
	tx_result=\$[(tx_after-tx_before)/256]
	echo "\$time Now_In_Speed: "\$rx_result"kbps Now_OUt_Speed: "\$tx_result"kbps" 
	sleep 2
	done 

	
	
	
	
	

	


