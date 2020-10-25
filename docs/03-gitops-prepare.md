# GitOps Preparation

## Prepare GitOps for Ratings service

* Go to your ratings repository and click on `Web IDE`
* Change all the files in `gitops/ratings-dev/*` by changing [X] to your username
* Commit the code

## Create GitLab personal access token

* Go to <https://git.demo.opsta.co.th/profile/personal_access_tokens>
* Create new personal access token
  * Name: gotk
  * Scopes: api
* Copy your personal access token

```bash
export GITLAB_TOKEN=CHANGEME
export USERNAME=training[X]

# Get kubeconfig
gcloud container clusters get-credentials k8s --project zcloud-cicd --zone asia-southeast1-a
kubectl config set-context $(kubectl config current-context) --namespace=$USERNAME-bookinfo-dev

# Pre check
gotk check --pre

# Bootstrap
gotk bootstrap gitlab \
  --hostname=git.demo.opsta.co.th \
  --branch=master \
  --version=v0.1.8 \
  --owner=gitops-devfest-2020 \
  --path=gitops \
  --namespace=$USERNAME-bookinfo-dev \
  --repository=$USERNAME-ratings

# Check bookinfo service
helm list
kubectl get pod
kubectl get ingress
```

* Try accessing <https://bookinfo.dev.opsta.co.th/training1/ratings/health> and <https://bookinfo.dev.opsta.co.th/training1/ratings/ratings/1>

Next: [Play with GitOps](04-gitops-playing.md)
