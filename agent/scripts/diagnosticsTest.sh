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

#source /etc/tdk_platform.properties
# Advanced version of diagnosticsTest script
diagnosticsTest_adv=/opt/TDK/diagnosticsTest_adv.sh

#uptime
echo "--------" >> /opt/TDK/device_diagnostics.log
echo "UPTIME:" >> /opt/TDK/device_diagnostics.log
uptime >> /opt/TDK/device_diagnostics.log
#version
echo "--------" >> /opt/TDK/device_diagnostics.log
echo "version.txt values:" >> /opt/TDK/device_diagnostics.log
head /version.txt >> /opt/TDK/device_diagnostics.log
#tdkConfig.ini
echo "--------" >> /opt/TDK/device_diagnostics.log
echo "tdkConfig.ini values:" >> /opt/TDK/device_diagnostics.log
cat /opt/TDK/tdkconfig.ini >> /opt/TDK/device_diagnostics.log
#corefiles_back
echo "--------" >> /opt/TDK/device_diagnostics.log
echo "Core files:" >> /opt/TDK/device_diagnostics.log
ls -la /opt/corefiles_back >> /opt/TDK/device_diagnostics.log
#mini dump files
echo "--------" >> /opt/TDK/device_diagnostics.log
echo "Mini dump files:" >> /opt/TDK/device_diagnostics.log
ls -la /opt/minidumps >> /opt/TDK/device_diagnostics.log
#TOP
echo "--------" >> /opt/TDK/device_diagnostics.log
echo "TOP" >> /opt/TDK/device_diagnostics.log
top -n 1 -b >> /opt/TDK/device_diagnostics.log
echo "--------" >> /opt/TDK/device_diagnostics.log

#Check advanced version of diagnosticsTest script is available then execute
if [ -f $diagnosticsTest_adv ]; then
	sh $diagnosticsTest_adv
fi
