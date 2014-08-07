set -e
set -x

GATEWAY=$(ip route show | grep ^default | cut -d' ' -f 3)
HOST="$(echo -n $GATEWAY | cut -d . -f 1-3).$(($(echo $GATEWAY | cut -d . -f 4 )-1))"
echo "Acquire::http { Proxy \"http://$HOST:3142\"; };" >> /etc/apt/apt.conf.d/01proxy

apt-get install --yes vim most # for development
IP=$(hostname -I)
apt-get install --yes language-pack-nb

apt-get install --yes python2.7 python-pip screen git 
pip install virtualenv

su -c "source /home/vagrant/setup/user.sh" vagrant

