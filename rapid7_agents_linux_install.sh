#!/bin/bash
set -e

YUM_PACKAGE_NAME="selinux-policy-devel"
DEB_PACKAGE_NAME="selinux-policy-devel"

echo "Installing wget and unzip"
yum install -y wget unzip
echo "Creating rapid7 directories"
mkdir -p /opt/rapid7
cd /opt/rapid7

echo "==============================================="
    echo "Configuring Proxy/Downloading azcopy and Agents"
    echo "==============================================="
#           export https_proxy="http://20.94.185.38:8080/"
           wget -O azcopyv10.tar  https://azcopyvnext.azureedge.net/release20201211/azcopy_linux_amd64_10.8.0.tar.gz
           tar -xf azcopyv10.tar --strip-components=1
           ./azcopy copy "https://securitytoolautomation.file.core.windows.net/linuxsecuritytoolinstaller/lagents.zip?sv=2020-02-10&ss=f&srt=co&sp=rl&se=2021-12-11T03:59:12Z&st=2021-05-10T18:59:12Z&spr=https&sig=3H0nJbAw1RQWFlwJ8DvgiGENBlhQAA%2FADqExLHxYN04%3D" "./lagents.zip"
    echo "==============================================="
    echo "Installing packages $YUM_PACKAGE_NAME on RedHat"
    echo "==============================================="
    yum install -y $YUM_PACKAGE_NAME
         unzip lagents.zip
         unzip agents-linux.zip
         chmod u+x agent_installer.sh omsagent-1.13.33-0.universal.x64.sh
    echo "==============================================="
    echo "Installing Rapid 7 Agent on RHEL"
    echo "==============================================="                      
               ./agent_installer.sh install_start --https-proxy=20.94.185.38:8080
    echo "==============================================="
    echo "Installing Cortex Agent on RHEL"
    echo "==============================================="
               sudo rpm -i CGI_Linux_Agent.rpm
                                                sleep 15
                                                sudo /opt/traps/bin/cytool proxy set 20.94.185.38:8080
                                                sudo /opt/traps/bin/cytool proxy query
    echo "==============================================="
    echo "Installing OMS Agent on RHEL"
    echo "==============================================="
               ./omsagent-1.13.33-0.universal.x64.sh --install -w 4cc297cb-ce9e-4d59-8615-230aceafd7a3 -s SvQleYbRvX3uWJRWyAPy2m147K5pP+8HWR6TF9Q3EBflH/LKEZNVlbSyAyEc0VVGpVxG64FXG3+OaD4+47sLgw== 
    #remove proxy
    echo "==============================================="
    echo "Removing Proxy"
    echo "==============================================="
               export  https_proxy=""

  #Extracting OMS Collection Tool
    echo "==============================================="
    echo "copying OMS troubleshoot tool"
    echo "==============================================="
    tar -xvf omslinux_agentlog.tgz
    sudo cp omslinux_agentlog.sh /var/opt/microsoft/omsagent
   sudo cp omslinux_agentlog.py /var/opt/microsoft/omsagent



exit 0
