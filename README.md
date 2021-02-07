# Opsta GitOps Workshop

This tutorial walks you through setting up GitOps with FluxCD

See [Slide](https://bit.ly/opsta-gitops-devfest-2020) here

## Copyright

Opsta (Thailand) Co.,Ltd.

## DevOps Tools Details

| Tools           | Description                                                                                                                                                                                              |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GitLab          | <https://git.demo.opsta.co.th><br/>user: training1, training2, … , training50                                                                                                                    |
| Nexus           | <https://nexus.demo.opsta.co.th> for Artifacts Server<br/><https://registry.demo.opsta.co.th> for Docker Private Registry<br/>user: bookinfo                                |
| Cloud Shell     | <https://console.cloud.google.com><br/>user: training[X]@opsta.in.th                                                                                                                    |
| Bookinfo Domain | <http://bookinfo.opsta.co.th/training[X]/productpage><br/><http://bookinfo.opsta.co.th/training[X]/reviews><br/><http://bookinfo.opsta.co.th/training[X]/details><br/><http://bookinfo.opsta.co.th/training[X]/ratings> |

## Workshop

This tutorial assumes you have access to the [Google Cloud Platform](https://cloud.google.com), have all the DevOps Tools installed and running (GitLab, Nexus, Kubernetes Cluster) and know about how Bookinfo Application working.

* [Prerequisites](docs/01-prerequisites.md)
* [Preparation](docs/02-preparation.md)
* [GitOps Preparation](docs/03-gitops-prepare.md)
* [Play with GitOps](docs/04-gitops-playing.md)
