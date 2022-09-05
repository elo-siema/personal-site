Import-Module AWSPowerShell.NetCore
jekyll build
$bucketName = "mf-personal-website"
$sitePath = "_site"
$distributionId = "E1O668TXMTNKOD"

Set-DefaultAWSRegion -Region us-east-1
Set-AWSCredential -ProfileName editor
Write-S3Object -BucketName $bucketName -Folder $sitePath -KeyPrefix / -ProfileName editor -Recurse
New-CFInvalidation -InvalidationBatch_CallerReference "editor" -DistributionId $distributionId -InvalidationBatch_CallerReference (date -Uformat %s) -Paths_Item "/*" -Paths_Quantity 1 -ProfileName editor