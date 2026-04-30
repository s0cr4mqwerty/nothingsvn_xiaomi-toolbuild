work_dir=$(pwd)
source $work_dir/functions.sh
prop="$work_dir/bin/package/KouseiPatcher/prop"
sdkLevel=$(< $work_dir/build/baserom/images/system/system/build.prop grep "ro.system.build.version.sdk" |awk 'NR==1' |cut -d '=' -f 2)
cust=$(find "$work_dir" -type f -name cust_prop_white_keys_list)
appdir="$work_dir/bin/package/KouseiPatcher/app"

bash $work_dir/bin/package/KouseiPatcher/patcher.sh

if [ -f $work_dir/build/baserom/images/system/system/etc/init/hw/init.rc ];then
setprop_rc "on boot" "setprop persist.sys.kaorios kousei" "$work_dir/build/baserom/images/system/system/etc/init/hw/init.rc"
fi

cp -rf $appdir/KaoriosToolbox $work_dir/build/baserom/images/system/system/priv-app
cp -rf $appdir/privapp_whitelist_com.kousei.kaorios.xml $work_dir/build/baserom/images/system/system/etc/permissions
cat $prop/build.prop >> $work_dir/build/baserom/images/system/system/build.prop
if [[ $sdkLevel == "32" || $sdkLevel == "31" ]];then
cat $prop/cust.prop >> $work_dir/build/baserom/images/system/system/etc/cust/cust_prop_white_keys_list
else
cat $prop/cust.prop >> $work_dir/build/baserom/images/system_ext/etc/cust_prop_white_keys_list
patch "Done"
fi

if [ -f $work_dir/framework.jar ]; then
mods "Moving Framework To Original Direction.."
cp -rf $work_dir/framework.jar $work_dir/build/baserom/images/system/system/framework/
rm -rf $work_dir/framework.jar
fi