# Prerequisites

## Login to Cloud Shell

* Go to <https://console.cloud.google.com> and login with your credential

> Don't put any of recovery method. Just `Confirm`

* Make sure project name on the top left is `Opsta DevOps for Developer`

> If your language is not English. Go to <https://console.cloud.google.com/user-preferences/languages> and change language to `English (United States)`

* Click on `Activate Cloud Shell` icon on the top right
* Click on `Open in new window` icon on the top right of Cloud Shell to open Cloud Shell in new tab

## All-in-one preparation command

```bash
curl -s https://raw.githubusercontent.com/opsta/gitops-workshop/master/scripts/cloud-shell-prepare.sh | sudo bash
```

## Prepare SSH key

* Put this command to generate your SSH key

```bash
ssh-keygen -f ~/.ssh/id_rsa -N ""
```

> You will have your SSH private and public key in `~/.ssh/` directory

## Update openssl

```bash
sudo apt update
sudo apt install -y openssl
```

## Install Docker Compose

```bash
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version

# This is required when you want to run docker-compose command
export LD_LIBRARY_PATH="/usr/local/lib"
```

## Install Helm

```bash
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
helm version
```

## Install toolkit CLI

```bash
curl -s https://toolkit.fluxcd.io/install.sh | sudo bash
```

## Reset Cloud Shell

In case your Cloud Shell having problem and you want to remove all the data to reset Cloud Shell

* Put this command to remove all the files in your $HOME directory

```bash
sudo rm -rf $HOME
```

* Click on `vertical three dot` icon on the top right for more menu and choose `Restart`

Next: [Preparation](02-preparation.md)
