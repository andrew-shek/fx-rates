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


docker build --tag "${RELEASE_FULL_URI}" .
# BUILD_SHA=$(docker push "${RELEASE_FULL_URI}" | awk '/digest: sha256/ {print $3}')

# Generate a Release ID json file
# echo "BUILD SHA: ${BUILD_SHA}"
# printf "{'repo':'%s', 'app_name':'%s', 'build_sha':'%s', 'img_tag':'%s', 'release_uri':'%s'}" "${IMG_REPO}" "${APP_NAME}" "$BUILD_SHA" "$IMG_TAG" "$RELEASE_URI" >> rls_container.json

IMAGE_TAG="$REGISTRY/${IMG_REPO}/$APP_NAME:$BRANCH"
docker push "$IMAGE_TAG"