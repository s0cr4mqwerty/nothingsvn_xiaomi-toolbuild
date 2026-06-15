#!/bin/bash
# SPDX-License-Identifier: GPL-3.0

work_dir=$(pwd)
magiskboot="$work_dir/bin/magiskboot"
prop="$work_dir/bin/package/KouseiPatcher/prop"

mods "Inject XEUToolbox by Xiaomi.eu"
echo "/system_ext/xbin/xeu_toolbox  u:object_r:toolbox_exec:s0" >> build/baserom/images/config/system_ext_file_contexts
echo "/system_ext/xbin/xeu_toolbox  u:object_r:toolbox_exec:s0" >> build/baserom/images/system_ext/etc/selinux/system_ext_file_contexts
echo "(allow init toolbox_exec (file ((execute_no_trans))))" >> build/baserom/images/system_ext/etc/selinux/system_ext_sepolicy.cil
cp -rf $work_dir/bin/package/KouseiPatcher/bin/xeu_toolbox/* $work_dir/build/baserom/images/system_ext
mods "Done!"

cat $prop/build.prop >> $work_dir/build/baserom/images/system/system/build.prop
if [[ $sdkLevel -lt "32" ]];then
cat $prop/cust.prop >> $work_dir/build/baserom/images/system/system/etc/cust/cust_prop_white_keys_list
else
cat $prop/cust.prop >> $work_dir/build/baserom/images/system_ext/etc/cust_prop_white_keys_list
patch "Done"
fi
