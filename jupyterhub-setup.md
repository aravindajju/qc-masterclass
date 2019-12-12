## Install Jupyterhub

curl https://raw.githubusercontent.com/jupyterhub/the-littlest-jupyterhub/master/bootstrap/bootstrap.py   | sudo python3 -     --admin aravind

## Install Q\# kernel for Jupyter
export PATH="/opt/tljh/user/bin":$PATH
sudo env "PATH=\$PATH" dotnet iqsharp install

## .NET installation

wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-3.1
dotnet tool install -g Microsoft.Quantum.IQSharp

## Qsharp kernet plug-in for Jupyter 
export PATH="\$HOME/.dotnet/":"\$HOME/.dotnet/tools":$PATH
dotnet tool install -g Microsoft.Quantum.IQSharp


## Start and Stop Jupyter Hub

sudo systemctl start jupyterhub.service
sudo systemctl stop jupyterhub.service

sudo systemctl start traefik.service
sudo systemctl start traefik.service

## Add support for anonymous users

sudo tljh-config set auth.FirstUseAuthenticator.create_users true
sudo tljh-config reload


## Sharing Notebook via link

http://quantum.wcloudacademy.com/hub/user-redirect/git-pull?repo=https%3A%2F%2Fqc-workgroup%40dev.azure.com%2Fqc-workgroup%2Fqc-master-class%2F_git%2Fqc-master-class&branch=master&subPath=qsharp-intro.ipynb&app=notebook

For generatinng the shared notebook URL (mybinder app for link generation)
https://mybinder.org/v2/gh/jupyterhub/nbgitpuller/master?urlpath=apps/binder%2Flink_generator.ipynb


## Sharing notebook via Folder

sudo mkdir -p /srv/data/qc-master-class
cp \$HOME/xyz.ipybn /srv/data/qc-master-class

cd /etc/skel
sudo ln -s /srv/data/qc-master-class qc-masterclass

