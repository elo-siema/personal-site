#/bin/sh
bundle exec jekyll build
bucketName="mf-personal-website"
sitePath="_site"
distributionId="E1O668TXMTNKOD"

aws s3 sync $sitePath s3://$bucketName --delete --profile editor
aws cloudfront create-invalidation --distribution-id $distributionId --paths "/*" --profile editor