cd /home/vagrant
export AILENV="/home/vagrant/ail"

git clone https://github.com/CIRCL/AIL-framework.git

virtualenv AILENV

sudo apt-get install --yes g++ python-dev python-tk

. ./AILENV/bin/activate

git clone https://github.com/saffsd/langid.py.git

cd langid.py

pip install numpy

python setup.py install
