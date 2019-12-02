APP_NAME=$1
IMG_TAG=$2
BRANCH=$3

IMG_REPO='shektest'
REGISTRY=asia.gcr.io

RELEASE_URI="$REGISTRY/${IMG_REPO}/$APP_NAME"
RELEASE_FULL_URI="${RELEASE_URI}:${IMG_TAG}"
GCP_PROJEXT='growth-dev-landing'

echo "REGISTRY: $REGISTRY"
echo "APP_NAME: $APP_NAME"
echo "RELEASE_URI: ${RELEASE_URI}"
echo "IMG_TAG: ${IMG_TAG}"
echo "RELEASE_FULL_URI: ${RELEASE_FULL_URI}"
echo "BRANCH: ${BRANCH}"

BUILD_IMAGE="$REGISTRY/${GCP_PROJEXT}/$APP_NAME:$IMG_TAG"
docker build --tag "${BUILD_IMAGE}" .


# Generate a Release ID json file
gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://asia.gcr.io
echo "Pushing ${BUILD_IMAGE} to registry..."

docker -- push "${BUILD_IMAGE}"
