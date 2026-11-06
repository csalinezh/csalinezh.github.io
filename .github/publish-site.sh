#!/usr/bin/env bash
set -euo pipefail

cd "${1:?Usage: publish-site.sh SITE_DIRECTORY}"

touch .nojekyll
git init --initial-branch=master
git config user.name 'github-actions[bot]'
git config user.email '41898282+github-actions[bot]@users.noreply.github.com'
git add --all
git commit -m "Deploy ${GITHUB_SHA}"

git push --force \
  "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" \
  master:master
