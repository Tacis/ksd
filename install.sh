dd if=/dev/zero of=/swapfile count=4096 bs=1MiB
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile   swap    swap    sw  0   0" >> /etc/fstab
yum -y update
curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -
yum -y install docker git gcc-c++ make nodejs krb5-devel
groupadd docker
usermod -aG docker $(whoami)
systemctl enable docker
systemctl start docker
curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
mv /usr/local/bin/docker-compose /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose
git clone https://github.com/keystonejs/keystone-demo.git
cd keystone-demo/
npm install --save
cd ../
docker build .
docker-compose up
