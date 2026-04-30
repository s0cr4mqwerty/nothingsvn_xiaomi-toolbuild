dir=$(pwd)
source $dir/functions.sh
sdkLevel=$(cat $dir/bin/ddevice/sdkLevel.txt)
deviceTYPE=$(cat $dir/bin/ddevice/device_type.txt)

if [[ $deviceTYPE == "China" ]];then
bash $dir/bin/package/COREPATCH/A16/patcher_a16.sh $sdkLevel --framework --services --miui-services --miui-framework --disable-signature-verification --disable-secure-flag --add-gboard --cn-notification-fix
else
bash $dir/bin/package/COREPATCH/A16/patcher_a16.sh $sdkLevel --framework --services --miui-services --miui-framework --disable-signature-verification --disable-secure-flag --add-gboard
fi

if [ -f $dir/framework.jar ]; then
mods "Moving Framework To Original Dirc.."
cp -rf $dir/framework.jar $dir/build/baserom/images/system/system/framework/
rm -rf $dir/framework.jar
fi

if [ -f $dir/services.jar ]; then
mods "Moving Services To Original Dirc.."
cp -rf $dir/services.jar $dir/build/baserom/images/system/system/framework/
rm -rf $dir/services.jar
fi

if [ -f $dir/miui-services.jar ]; then
mods "Moving miui-services To Original Dirc.."
cp -rf $dir/miui-services.jar $dir/build/baserom/images/system_ext/framework/
rm -rf $dir/miui-services.jar
fi

if [ -f $dir/miui-framework.jar ]; then
mods "Moving miui-framework To Original Dirc.."
cp -rf $dir/miui-framework.jar $dir/build/baserom/images/system_ext/framework/
rm -rf $dir/miui-framework.jar
fi