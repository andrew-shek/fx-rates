APP_NAME=$1
IMG_TAG=$2
BRANCH=$3

IMG_REPO='shektest'
REGISTRY=asia.gcr.io

RELEASE_URI="$REGISTRY/${IMG_REPO}/$APP_NAME"
RELEASE_FULL_URI="${RELEASE_URI}:${IMG_TAG}"


echo "REGISTRY: $REGISTRY"
echo "APP_NAME: $APP_NAME"
echo "RELEASE_URI: ${RELEASE_URI}"
echo "IMG_TAG: ${IMG_TAG}"
echo "RELEASE_FULL_URI: ${RELEASE_FULL_URI}"
echo "BRANCH: ${BRANCH}"


docker build --tag "${RELEASE_FULL_URI}" .


# Generate a Release ID json file



IMAGE_TAG="$REGISTRY/${IMG_REPO}/$APP_NAME:$BRANCH"
echo "Pushing ${IMAGE_TAG} to registry..."
docker push "$IMAGE_TAG"