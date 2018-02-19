#!/usr/bin/env powershell

$BASE = "$HOME\docker-workshop"

Write-Host "This will reset all the Jenkins data under $BASE !!!"
Write-Host ""
Write-Host "Are you sure this is what you want to do?"

$confirmation = Read-Host "You must type 'yes' to confirm: "
if ($confirmation -eq 'yes') {
  rm "$BASE/layout/jenkins/data/*" -r -fo
  rm "$BASE/layout/jenkins/data/.groovy" -r -fo
  rm "$BASE/layout/jenkins/data/.java" -r -fo
  cp "$BASE/layout/postgres/data/.git_keep" "$BASE/layout/jenkins/data/.git_keep"
  Write-Host "completed"
} else {
  Write-Host "aborted"
}

