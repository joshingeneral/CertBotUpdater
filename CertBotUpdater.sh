#!/bin/bash
echo "Please run with sudo rights, because you need that to access private cert"
echo "Make sure to create id_rsa_sub1 and id_rsa_sub2 with no password so this can be run in cron"
echo "Make sure that id_rsa_sub1.pub is in /root/.ssh/authorized_keys on sub1"
echo "Make sure that id_rsa_sub2.pub is in /root/.ssh/authorized_keys on sub2"
scp -i ~/.ssh/id_rsa_sub1 /etc/letsencrypt/live/sub1.example.org/fullchain.pem  root@192.168.1.100:/usr/local/etc/apache24/ssl/server.crt
scp -i ~/.ssh/id_rsa_sub1  /etc/letsencrypt/live/sub1.example.org/privkey.pem  root@192.168.1.100:/usr/local/etc/apache24/ssl/server.key
ssh -i ~/.ssh/id_rsa_sub1 root@192.168.1.100 'service apache24 restart'
scp -i ~/.ssh/id_rsa_sub2 /etc/letsencrypt/live/sub2.example.org/fullchain.pem  root@192.168.1.101:/usr/local/etc/apache24/ssl/server.crt
scp -i ~/.ssh/id_rsa_sub2  /etc/letsencrypt/live/sub2.example.org/privkey.pem  root@192.168.1.101:/usr/local/etc/apache24/ssl/server.key
ssh -i ~/.ssh/id_rsa_sub2 root@192.168.1.101 'service apache24 restart'
