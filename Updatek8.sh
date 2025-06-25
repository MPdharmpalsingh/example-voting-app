#!/bin/bash
set -x

REPO_URL="https://9iZYIaTSPBvl5E7cV5o4Do7a3MdHiZRVnYq44s4ni3OrYcfkOkQXJQQJ99BFACAAAAA5Dj5DAAASAZDO2zoq@dev.azure.com/DevopsAzure0/Voting--App/_git/Voting--App"

git clone "$REPO_URL" /tmp/temp_repo

cd /tmp/temp_repo

sed -i "s|image:.*|image: app01containerregistry.azurecr.io/$2:$3|g" k8s-specifications/$1-deployment.yaml


# git config --global user.name "$(Build.RequestedFor)"
# git config --global user.email "$(Build.RequestedForEmail)"
# displayName: 'Set Git user identity'

# git config --global user.name $(Build.RequestedFor)
# git config --global user.email $(Build.RequestedForEmail)
# displayName: 'Set static Git identity'


git add .

git commit -m "Update Kubernetes manifest"

git push

rm -rf /tmp/temp_repo
