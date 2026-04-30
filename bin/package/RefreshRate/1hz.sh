work_dir=$(pwd)
ANDROID_DEVICE=$(cat $work_dir/bin/ddevice/device_f.txt)
gfFile="$work_dir/build/baserom/images/product/etc/device_features/${ANDROID_DEVICE}.xml"
gfFilein="$work_dir/build/baserom/images/product/etc/device_features/${ANDROID_DEVICE}in.xml"
gfFilepro="$work_dir/build/baserom/images/product/etc/device_features/${ANDROID_DEVICE}pro.xml"
gfFileproin="$work_dir/build/baserom/images/product/etc/device_features/${ANDROID_DEVICE}proin.xml"
gfFileinpro="$work_dir/build/baserom/images/product/etc/device_features/${ANDROID_DEVICE}inpro.xml"
gfFileplus="$work_dir/build/baserom/images/product/etc/device_features/${ANDROID_DEVICE}plus.xml"
gfFilemars="$work_dir/build/baserom/images/product/etc/device_features/mars.xml"
gfFilemiel="$work_dir/build/baserom/images/product/etc/device_features/miel.xml"
gfFilerothko="$work_dir/build/baserom/images/product/etc/device_features/rothko.xml"
rom_os=$(cat $work_dir/bin/ddevice/rom_os.txt)
regionTYPE=$(cat $work_dir/bin/ddevice/device_type.txt)
str='<item>120</item>'
str1='<item>90</item>'
str2='<item>1</item>'
checkfps='<bool name="support_smart_fps">true</bool>'

#Check DeviceCodeName
if [ -f $work_dir/build/baserom/images/product/etc/device_features/${ANDROID_DEVICE}.xml ]; then

if [ `grep -c "$str" $gfFile` -eq '0' ];then
	sed '/<item>144<\/item>/a\        <item>120<\/item>' $gfFile > ${gfFile}.new
	mv ${gfFile}.new $gfFile
	echo "Added 120hz to ${ANDROID_DEVICE}"
fi

if [ `grep -c "$str1" $gfFile` -eq '0' ];then
	sed '/<item>120<\/item>/a\        <item>90<\/item>' $gfFile > ${gfFile}.new
	mv ${gfFile}.new $gfFile
	echo "Added 90hz to ${ANDROID_DEVICE}"
fi

if [ `grep -c "$str2" $gfFile` -eq '0' ];then
	sed '/<item>60<\/item>/a\        <item>1<\/item>' $gfFile > ${gfFile}.new
	mv ${gfFile}.new $gfFile
	echo "Added 1hz to ${ANDROID_DEVICE}"
fi

if [ `grep -c "$checkfps" $gfFile` -eq '0' ];then
    sed '/<integer name="defaultFps">60<\/integer>/a\    <bool name="support_smart_fps">true<\/bool>\<integer name="smart_fps_value">120<\/integer>' $gfFile > ${gfFile}.new
    mv ${gfFile}.new $gfFile
	echo "Added SmartFPS to ${ANDROID_DEVICE}"
fi
fi
#Check DeviceCodeNameIN
if [ -f $work_dir/build/baserom/images/product/etc/device_features/${ANDROID_DEVICE}in.xml ]; then

if [ `grep -c "$str" $gfFilein` -eq '0' ];then
	sed '/<item>144<\/item>/a\        <item>120<\/item>' $gfFilein > ${gfFilein}.new
	mv ${gfFilein}.new $gfFilein
	echo "Added 120hz to ${ANDROID_DEVICE}in"
fi

if [ `grep -c "$str1" $gfFilein` -eq '0' ];then
	sed '/<item>120<\/item>/a\        <item>90<\/item>' $gfFilein > ${gfFilein}.new
	mv ${gfFilein}.new $gfFilein
	echo "Added 90hz to ${ANDROID_DEVICE}in"
fi

if [ `grep -c "$str2" $gfFilein` -eq '0' ];then
	sed '/<item>60<\/item>/a\        <item>1<\/item>' $gfFilein > ${gfFilein}.new
	mv ${gfFilein}.new $gfFilein
	echo "Added 1hz to ${ANDROID_DEVICE}in"
fi

if [ `grep -c "$checkfps" $gfFilein` -eq '0' ];then
    sed '/<integer name="defaultFps">60<\/integer>/a\    <bool name="support_smart_fps">true<\/bool>\<integer name="smart_fps_value">120<\/integer>' $gfFilein > ${gfFilein}.new
    mv ${gfFilein}.new $gfFilein
	echo "Added SmartFPS to ${ANDROID_DEVICE}in"
fi
fi
#Check DeviceCodenamePRO
if [ -f $work_dir/build/baserom/images/product/etc/device_features/${ANDROID_DEVICE}pro.xml ]; then

if [ `grep -c "$str" $gfFilepro` -eq '0' ];then
	sed '/<item>144<\/item>/a\        <item>120<\/item>' $gfFilepro > ${gfFilepro}.new
	mv ${gfFilepro}.new $gfFilepro
	echo "Added 120hz to ${ANDROID_DEVICE}pro"
fi

if [ `grep -c "$str1" $gfFilepro` -eq '0' ];then
	sed '/<item>120<\/item>/a\        <item>90<\/item>' $gfFilepro > ${gfFilepro}.new
	mv ${gfFilepro}.new $gfFilepro
	echo "Added 90hz to ${ANDROID_DEVICE}pro"
fi

if [ `grep -c "$str2" $gfFilepro` -eq '0' ];then
	sed '/<item>60<\/item>/a\        <item>1<\/item>' $gfFilepro > ${gfFilepro}.new
	mv ${gfFilepro}.new $gfFilepro
	echo "Added 1hz to ${ANDROID_DEVICE}pro"
fi

if [ `grep -c "$checkfps" $gfFilepro` -eq '0' ];then
    sed '/<integer name="defaultFps">60<\/integer>/a\    <bool name="support_smart_fps">true<\/bool>\<integer name="smart_fps_value">120<\/integer>' $gfFilepro > ${gfFilepro}.new
    mv ${gfFilepro}.new $gfFilepro
	echo "Added SmartFPS to ${ANDROID_DEVICE}pro"
fi
fi
#Check DeviceCodenamePROIN
if [ -f $work_dir/build/baserom/images/product/etc/device_features/${ANDROID_DEVICE}proin.xml ]; then

if [ `grep -c "$str" $gfFileproin` -eq '0' ];then
	sed '/<item>144<\/item>/a\        <item>120<\/item>' $gfFileproin > ${gfFileproin}.new
	mv ${gfFileproin}.new $gfFileproin
	echo "Added 120hz to ${ANDROID_DEVICE}proin"
fi

if [ `grep -c "$str1" $gfFileproin` -eq '0' ];then
	sed '/<item>120<\/item>/a\        <item>90<\/item>' $gfFileproin > ${gfFileproin}.new
	mv ${gfFileproin}.new $gfFileproin
	echo "Added 90hz to ${ANDROID_DEVICE}proin"
fi

if [ `grep -c "$str2" $gfFileproin` -eq '0' ];then
	sed '/<item>60<\/item>/a\        <item>1<\/item>' $gfFileproin > ${gfFileproin}.new
	mv ${gfFileproin}.new $gfFileproin
	echo "Added 1hz to ${ANDROID_DEVICE}proin"
fi

if [ `grep -c "$checkfps" $gfFileproin` -eq '0' ];then
    sed '/<integer name="defaultFps">60<\/integer>/a\    <bool name="support_smart_fps">true<\/bool>\<integer name="smart_fps_value">120<\/integer>' $gfFileproin > ${gfFileproin}.new
    mv ${gfFileproin}.new $gfFileproin
	echo "Added SmartFPS to ${ANDROID_DEVICE}proin"
fi
fi
#Check DeviceCodenamePROIN
if [ -f $work_dir/build/baserom/images/product/etc/device_features/${ANDROID_DEVICE}inpro.xml ]; then

if [ `grep -c "$str" $gfFileinpro` -eq '0' ];then
	sed '/<item>144<\/item>/a\        <item>120<\/item>' $gfFileinpro > ${gfFileinpro}.new
	mv ${gfFileinpro}.new $gfFileinpro
	echo "Added 120hz to ${ANDROID_DEVICE}inpro"
fi

if [ `grep -c "$str1" $gfFileinpro` -eq '0' ];then
	sed '/<item>120<\/item>/a\        <item>90<\/item>' $gfFileinpro > ${gfFileinpro}.new
	mv ${gfFileinpro}.new $gfFileinpro
	echo "Added 90hz to ${ANDROID_DEVICE}inpro"
fi

if [ `grep -c "$str2" $gfFileinpro` -eq '0' ];then
	sed '/<item>60<\/item>/a\        <item>1<\/item>' $gfFileinpro > ${gfFileinpro}.new
	mv ${gfFileinpro}.new $gfFileinpro
	echo "Added 1hz to ${ANDROID_DEVICE}inpro"
fi

if [ `grep -c "$checkfps" $gfFileinpro` -eq '0' ];then
    sed '/<integer name="defaultFps">60<\/integer>/a\    <bool name="support_smart_fps">true<\/bool>\<integer name="smart_fps_value">120<\/integer>' $gfFileinpro > ${gfFileinpro}.new
    mv ${gfFileinpro}.new $gfFileinpro
	echo "Added SmartFPS to ${ANDROID_DEVICE}inpro"
fi
fi
#Check DeviceCodenamePLUS
if [ -f $work_dir/build/baserom/images/product/etc/device_features/${ANDROID_DEVICE}plus.xml ]; then

if [ `grep -c "$str" $gfFileplus` -eq '0' ];then
	sed '/<item>144<\/item>/a\        <item>120<\/item>' $gfFileplus > ${gfFileplus}.new
	mv ${gfFileplus}.new $gfFileplus
	echo "Added 120hz to ${ANDROID_DEVICE}plus"
fi

if [ `grep -c "$str1" $gfFileplus` -eq '0' ];then
	sed '/<item>120<\/item>/a\        <item>90<\/item>' $gfFileplus > ${gfFileplus}.new
	mv ${gfFileplus}.new $gfFileplus
	echo "Added 90hz to ${ANDROID_DEVICE}plus"
fi

if [ `grep -c "$str2" $gfFileplus` -eq '0' ];then
	sed '/<item>60<\/item>/a\        <item>1<\/item>' $gfFileplus > ${gfFileplus}.new
	mv ${gfFileplus}.new $gfFileplus
	echo "Added 1hz to ${ANDROID_DEVICE}plus"
fi

if [ `grep -c "$checkfps" $gfFileplus` -eq '0' ];then
    sed '/<integer name="defaultFps">60<\/integer>/a\    <bool name="support_smart_fps">true<\/bool>\<integer name="smart_fps_value">120<\/integer>' $gfFileplus > ${gfFileplus}.new
    mv ${gfFileplus}.new $gfFileplus
	echo "Added SmartFPS to ${ANDROID_DEVICE}plus"
fi
fi
#This One Is Apply For Mi 11 Pro/Ultra(star/mars)
if [ -f $work_dir/build/baserom/images/product/etc/device_features/mars.xml ]; then

if [ `grep -c "$str1" $gfFilemars` -eq '0' ];then
	sed '/<item>120<\/item>/a\        <item>90<\/item>' $gfFilemars > ${gfFilemars}.new
	mv ${gfFilemars}.new $gfFilemars
	echo "Added 90hz to mars"
	
fi

if [ `grep -c "$str2" $gfFilemars` -eq '0' ];then
	sed '/<item>60<\/item>/a\        <item>1<\/item>' $gfFilemars > ${gfFilemars}.new
	mv ${gfFilemars}.new $gfFilemars
	echo "Added 1hz to mars"
fi

if [ `grep -c "$checkfps" $gfFilemars` -eq '0' ];then
    sed '/<integer name="defaultFps">60<\/integer>/a\    <bool name="support_smart_fps">true<\/bool>\<integer name="smart_fps_value">120<\/integer>' $gfFilemars > ${gfFilemars}.new
    mv ${gfFilemars}.new $gfFilemars
	echo "Added SmartFPS to mars"
fi
fi
#This One Is Apply For Fleur/Miel
if [ -f $work_dir/build/baserom/images/product/etc/device_features/miel.xml ]; then

if [ `grep -c "$str2" $gfFilemiel` -eq '0' ];then
	sed '/<item>60<\/item>/a\        <item>1<\/item>' $gfFilemiel > ${gfFilemiel}.new
	mv ${gfFilemiel}.new $gfFilemiel
	echo "Added 1hz to miel"
fi

if [ `grep -c "$checkfps" $gfFilemiel` -eq '0' ];then
    sed '/<integer name="defaultFps">60<\/integer>/a\    <bool name="support_smart_fps">true<\/bool>\<integer name="smart_fps_value">120<\/integer>' $gfFilemiel > ${gfFilemiel}.new
    mv ${gfFilemiel}.new $gfFilemars
	echo "Added SmartFPS to miel"
fi
fi

if [ -f $work_dir/build/baserom/images/product/etc/device_features/rothko.xml ]; then
 cp -rf $work_dir/bin/package/RefreshRate/rothko/* $work_dir/build/baserom/images/product/etc/device_features
fi