# Play with GitOps

## Update code and build new version

* Go to Cloud Shell and open editor
* Edit `bookinfo-ratings/src/ratings.js` line 207 to the text you want
* Build new version of Docker Image

```bash
# Build Ratings Service Docker Image
docker-compose build ratings
# Tagging to new name
docker tag bookinfo-ratings_ratings registry.demo.opsta.co.th/training[X]/bookinfo/ratings:build-2
# Push Rating Docker Image
docker push registry.demo.opsta.co.th/training[X]/bookinfo/ratings:build-2
```

## Change GitOps to new version

* Go to your ratings repository and click on `Web IDE`
* Edit `gitops/ratings/helm-release.yaml` file and change `tag: build-1` to `tag: build-2`
* Commit the code
* Wait for one minute to see the change

```bash
watch kubectl get pod
```

* Try accessing <https://bookinfo.dev.opsta.co.th/training1/ratings/health> to see the change
