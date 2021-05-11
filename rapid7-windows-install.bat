ECHO Please run as Administrator

msiexec /i c:\secinst\CGI_Windows_Agent_x64.msi proxy_list=10.160.2.6:8080 /qn /norestart /l*v .\install.log
msiexec /i c:\secinst\agentInstaller-x86_64.msi HTTPSPROXY=10.160.2.6:8080 /qn /norestart /l*v .\install.log
c:\secinst\MMASetup-AMD64.exe /c /t:c:\secinst
c:\secinst\setup.exe /qn ADD_OPINSIGHTS_WORKSPACE=1 OPINSIGHTS_WORKSPACE_AZURE_CLOUD_TYPE=0 OPINSIGHTS_WORKSPACE_ID=4cc297cb-ce9e-4d59-8615-230aceafd7a3 OPINSIGHTS_WORKSPACE_KEY=SvQleYbRvX3uWJRWyAPy2m147K5pP+8HWR6TF9Q3EBflH/LKEZNVlbSyAyEc0VVGpVxG64FXG3+OaD4+47sLgw== AcceptEndUserLicenseAgreement=1 OPINSIGHTS_PROXY_URL=http://10.160.2.6:8080
ECHO Verify the installs before closing
PAUSE