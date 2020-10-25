# Preparation

## Prepare Git Repository

* Go to `Groups` > `Your groups` menu on the top left
* Click on `GitOps Workshop DevFest 2020` group
* Click on `New project`
* Select `Import project` tab and click on `Repo by URL`
* Create ratings project
  * Git repository URL: <https://github.com/opsta/gitops-workshop.git>
  * Project name: training[X]-ratings
  * Project URL: gitops-devfest-2020/training[X]-ratings
  * Project slug: training[X]-ratings
  * Leave the rest default

## Build Docker Image for Ratings service and push to Nexus

```bash
# Clone Bookinfo Ratings repository
git clone https://github.com/opsta/gitops-workshop.git
cd gitops-workshop/bookinfo-ratings

# Build Ratings Service Docker Image
docker-compose build ratings

# Login to Private Registry first
docker login registry.demo.opsta.co.th
# Put bookinfo credentials

# Check to see Rating Service Docker Image name
docker images
# Tagging to new name
docker tag bookinfo-ratings_ratings registry.demo.opsta.co.th/training[X]/bookinfo/ratings:build-1
# Push Rating Docker Image
docker push registry.demo.opsta.co.th/training[X]/bookinfo/ratings:build-1
```

Next: [GitOps](03-gitops-prepare.md)
