# CertBotUpdater
If you have more than one server behind your firewall/NAT that is using your let's encrypt cert, this is the script for you.
1. Add public/private auth (no password auth) via ssh to the servers that you will be managing. 
2. Install certbot on your main update server also behind firewall/NAT.
3. Install private keys in a protected space, like encrypted home folder on the main update server.
4. Add the following to crontab on the root user:

4 4,16 * * * /home/user/Programs/eff/certbot-auto renew --quiet --no-self-upgrade
5 4,16 * * * /home/user/Programs/eff/CertBotUpdater.sh renew --quiet --no-self-upgrade

5. Make sure that all the domain names and key locations in the script match up. You should only have to do this once. 
6. #Profit. 

Tags: Certbot, EFF, Cert Bot, Security, Private Keys, Cron, apache,ssh
