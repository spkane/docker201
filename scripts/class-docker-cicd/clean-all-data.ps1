#!/usr/bin/env powershell

$BASE = "$HOME\class-docker-cicd"

Write-Host "This will reset all the class data under $BASE !!!"
Write-Host ""
Write-Host "Are you sure this is what you want to do?"

$confirmation = Read-Host "You must type 'yes' to confirm: "
if ($confirmation -eq 'yes') {
  rm "$BASE/layout/postgres/data/data" -r -fo
  rm "$BASE/layout/registry/data/docker" -r -fo
  rm "$BASE/layout/jenkins/data/*" -r -fo
  rm "$BASE/layout/jenkins/data/.groovy" -r -fo
  rm "$BASE/layout/jenkins/data/.java" -r -fo
  rm "$BASE/layout/gogs/data/git" -r -fo
  rm "$BASE/layout/gogs/data/gogs" -r -fo
  rm "$BASE/layout/gogs/data/ssh" -r -fo
  cp "$BASE/layout/postgres/data/.git_keep" "$BASE/layout/jenkins/data/.git_keep"
  Write-Host "completed"
} else {
  Write-Host "aborted"
}

