# Bookinfo Rating Service

Rating service has been developed on NodeJS

## How to run with Docker Compose

* Environment variables
  * SERVICE_VERSION

```bash
docker-compose up
```

* Access health check page on <http://localhost:9080/health>
* Access ratings api on <http://localhost:9080/ratings/1>

## Deploy Bookinfo Review Service on Kubernetes

### Deploy MongoDB

```bash
export APP_NAME=bookinfo
export APP_COMPONENT=ratings
export APP_ENV=dev
export APP_NS=$APP_NAME-$APP_ENV
export MONGODB_RELEASE_NAME=$APP_NAME-$APP_ENV-$APP_COMPONENT-mongodb

# Apply K8s Secrets
kubectl apply -f k8s/secrets

# Apply Initial DB to ConfigMap
kubectl create configmap $MONGODB_RELEASE_NAME-initdb \
  --namespace $APP_NS \
  --from-file=databases/ratings_data.json \
  --from-file=databases/script.sh

# Deploy MongoDB
helm upgrade -i -f k8s/helm-values/$APP_ENV/values-$MONGODB_RELEASE_NAME.yaml \
  --namespace $APP_NS $MONGODB_RELEASE_NAME stable/mongodb

# Watch status
kubectl get pods -w --namespace $APP_NS -l release=$MONGODB_RELEASE_NAME
# Get MongoDB root password
export MONGODB_ROOT_PASSWORD=$(kubectl get secret --namespace $APP_NS $MONGODB_RELEASE_NAME-secret \
  -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)
# export MONGODB_PASSWORD=$(kubectl get secret --namespace $APP_NS $MONGODB_RELEASE_NAME-secret \
#   -o jsonpath="{.data.mongodb-password}" | base64 --decode)
# Test MongoDB
kubectl run --namespace $APP_NS $MONGODB_RELEASE_NAME-client --rm --tty -i --restart='Never' \
  --image bitnami/mongodb --command -- mongo admin --host $MONGODB_RELEASE_NAME \
  --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD
db.serverStatus()
exit
```

### Deploy Bookinfo Review Service on Kubernetes with Helm

```bash
export APP_NAME=bookinfo
export APP_COMPONENT=ratings
export APP_ENV=dev
export APP_NS=$APP_NAME-$APP_ENV

helm upgrade -i -f k8s/helm-values/$APP_ENV/values-$APP_NS-$APP_COMPONENT.yaml \
  --namespace $APP_NS $APP_NS-$APP_COMPONENT k8s/helm
```

## Run UI Test with Robot Framework

```bash
docker run -it --network host --rm \
  -v $PWD/test/robot:/opt/robotframework/tests \
  -v $PWD/test/robot/reports:/opt/robotframework/reports \
  ppodgorsek/robot-framework:3.5.0
```

* Check report at test/robot/reports/
