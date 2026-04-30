WORK_DIR=$(pwd)
source $WORK_DIR/functions.sh
MAIN_FOLDER="$WORK_DIR/build/baserom/images"
androidVER=$(cat $WORK_DIR/bin/ddevice/androidver.txt)
APKEDITOR="java -jar $WORK_DIR/bin/apktool/apke.jar"
regionTYPE=$(cat $WORK_DIR/bin/ddevice/device_type.txt)

if [[ $regionTYPE == *"Global"* ]]; then

mods "Remove System Apps Updater"
mkdir -p $WORK_DIR/apk_temp
isSettingsDIR=$(find "$MAIN_FOLDER" -type d -name "Settings")
isSettings=$(find "$MAIN_FOLDER" -type f -name "Settings.apk")
$APKEDITOR d -t raw -f -no-dex-debug -i $isSettings -o $WORK_DIR/apk_temp/isSettings.apk.out >/dev/null 2>&1
isMiuiSettingsXML=$(find "$WORK_DIR/apk_temp/isSettings.apk.out" -type f -name settings_headers.xml)
isMiuiSettingsXML2=$(find "$WORK_DIR/apk_temp/isSettings.apk.out" -type f -name AvailableVirtualKeyboardFragment.smali)

sed -i '/<header android:icon="@drawable\/ic_system_apps_updater"/,/<\/header>/d' "$isMiuiSettingsXML"
sed -i 's/com.baidu.input_mi/com.google.android.inputmethod.latin/g' "$isMiuiSettingsXML2"

#Finishing
Settings=$(basename $isSettings)
$APKEDITOR b -f -i $WORK_DIR/apk_temp/isSettings.apk.out -o $WORK_DIR/apk_temp/final/$Settings >/dev/null 2>&1

if [ -f "$WORK_DIR/apk_temp/final/$Settings" ]; then
    rm -rf $isSettingsDIR/*
    cp -rf $WORK_DIR/apk_temp/final/$Settings $isSettingsDIR
fi

rm -rf $WORK_DIR/apk_temp
mods "Done"

fi
