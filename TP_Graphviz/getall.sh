curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $(cat token.gh)" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/raphaR2p/graphes/actions/artifacts \
  > gh-artifacts.json

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $(cat token.gh)" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/raphaR2p/graphes/actions/artifacts/4329651720/zip \
  --output artifact.zip

unzip artifact.zip

