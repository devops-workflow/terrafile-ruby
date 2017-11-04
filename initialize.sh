#/bin/sh

ARTIFACTORY_URL="{ARTIFACTORY HOST}"
ARTIFACTORY_REPO="terraform-local"
ARTIFACTORY_PROJECT="dev"

rake get_modules

terraform remote config \
      -backend=artifactory \
      -backend-config="username=$ARTIFACTORY_USERNAME" \
      -backend-config="password=$ARTIFACTORY_PASSWORD" \
      -backend-config="url=$ARTIFACTORY_URL" \
      -backend-config="repo=$ARTIFACTORY_REPO" \
      -backend-config="subpath=$ARTIFACTORY_PROJECT"

terraform get
