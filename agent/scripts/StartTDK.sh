#!/bin/bash
##########################################################################
# If not stated otherwise in this file or this component's Licenses.txt
# file the following copyright and licenses apply:
#
# Copyright 2016 RDK Management
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##########################################################################
#

#Setting up environment to run TDK
export TDK_PATH=/opt/TDK/
# Advanced version of StartTDK script
StartTDK_adv=$TDK_PATH/StartTDK_adv.sh
export RDK_LOG_PATH=/opt/logs
export PATH=$PATH:/usr/local/bin:$TDK_PATH
export TDK_LIB_PATH=$TDK_PATH/libs/
export OPENSOURCETEST_PATH=$TDK_PATH/opensourcecomptest/
chmod 777 -R $TDK_PATH/opensourcecomptest/
export LD_LIBRARY_PATH=$TDK_PATH/libs/:/usr/local/lib/:/usr/local/Qt/lib/:/mnt/nfs/lib:/mnt/nfs/bin/target-snmp/lib/:/mnt/nfs/bin:/usr/local/lib/sa:$LD_LIBRARY_PATH:$TDK_PATH/lib/
export GST_PLUGIN_PATH=$GST_PLUGIN_PATH:/lib/gstreamer-0.10:/usr/local/lib/gstreamer-0.10:/mnt/nfs/gstreamer-plugins
export GST_REGISTRY=$:/home/.gst-registry.dat
export XDISCOVERY_PATH=/etc/

export PFC_ROOT=/
export VL_ECM_RPC_IF_NAME="wan"
export VL_DOCSIS_DHCP_IF_NAME="wan"
export VL_DOCSIS_WAN_IF_NAME="wan:1"

#Setting up environment for log4c configuration
#export LOG4C_RCPATH=/mnt/nfs/env
export LOG4C_RCPATH=/etc

#Setting up environment to run spark
export XDG_RUNTIME_DIR=/run/user/0/
export WAYLAND_DISPLAY=WPE

GST_PLUGIN_PATH=/lib/gstreamer-0.10:/usr/local/lib/gstreamer-0.10:/mnt/nfs/gstreamer-plugins
export GST_PLUGIN_PATH GST_PLUGIN_SCANNER GST_REGISTRY
export PATH HOME LD_LIBRARY_PATH
ulimit -c unlimited
echo "Going to system data details script "
chmod -R 0755 $TDK_PATH/
cd $TDK_PATH/
sh sysDataDetails.sh > trDetails.log

#Check advanced version of StartTDK script is available then execute
if [ -f $StartTDK_adv ]; then
    sh $StartTDK_adv
fi

echo "Going to start Agent"
sh TDKagentMonitor.sh &
./rdk_tdk_agent_process
