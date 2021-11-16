# Observian Serverless Deploy

## What it is
A lightweight Github action that simply deploys a serverless function using AWS credentials
## What it is not
This was written to satisfy a quick-start use-case.  It is not intended to be fully-featured and is not supported in an ongoing fashion in any tangible way.  It is also not intended to support production deploys

## Recommendations
If you are going to use this for production workloads, we recommend cloning this repo and creating your own action.  
## Parameters
| Parameter | Description | Required |
| ----------| ----------- | -------- |
| access_key_id | Amazon Web Services Access Key Id | yes |
| secret_access_key | Amazon Web Services Access Secret | yes |
| region | AWS Region where the function will be deployed | yes |
| plugins | plugins that the serverless function requires for deployment | no |
| config_file | the serverless yaml file containing the configuration.  Default is `serverless.yml` | no |