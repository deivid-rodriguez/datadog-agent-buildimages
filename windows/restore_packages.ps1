cd windows
Invoke-WebRequest -Uri https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -OutFile .\nuget.exe
.\nuget.exe sources update -Name datadog -UserName (aws ssm get-parameter --region us-east-1 --name ci.datadog-agent-buildimages.chocolatey_username --with-decryption --query "Parameter.Value" --out text) -Password (aws ssm get-parameter --region us-east-1 --name ci.datadog-agent-buildimages.chocolatey_access_token --with-decryption --query "Parameter.Value" --out text)
.\nuget.exe restore