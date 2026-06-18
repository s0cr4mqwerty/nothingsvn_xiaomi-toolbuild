work_dir=$(pwd)
source $work_dir/functions.sh
rom_os=$(cat $work_dir/bin/ddevice/rom_os.txt)
MAIN_FOLDER="$work_dir/build/baserom/images"
regionTYPE=$(cat $work_dir/bin/ddevice/device_type.txt) 
androidVER=$(cat $work_dir/bin/ddevice/androidver.txt)

mods "Patching Enhanched Keyboard"
#ready for patch
mkdir -p $work_dir/apk_temp
MIUIFrequentPhraseDIR=$(find "$MAIN_FOLDER" -type d -name "MIUIFrequentPhrase")
MIUIFrequentPhrase=$(find "$MAIN_FOLDER" -type f -name "MIUIFrequentPhrase.apk")
$APKEDITOR d -t raw -f -no-dex-debug -i $MIUIFrequentPhrase -o $work_dir/apk_temp/MIUIFrequentPhrase.apk.out >/dev/null 2>&1
Smali1=$(find "$work_dir/apk_temp/MIUIFrequentPhrase.apk.out" -type f -name InputMethodBottomManager.smali)
sed -i 's/com.baidu.input_mi/com.google.android.inputmethod.latin/g' $Smali1
#Finishing
MIUIFrequentPhrase=$(basename $MIUIFrequentPhrase)
$APKEDITOR b -f -i $work_dir/apk_temp/MIUIFrequentPhrase.apk.out -o $work_dir/apk_temp/final/$MIUIFrequentPhrase >/dev/null 2>&1

if [ -f "$work_dir/apk_temp/final/$MIUIFrequentPhrase" ]; then
    rm -rf $MIUIFrequentPhraseDIR/oat
	rm -rf $MIUIFrequentPhraseDIR/$MIUIFrequentPhrase
    cp -rf $work_dir/apk_temp/final/$MIUIFrequentPhrase $MIUIFrequentPhraseDIR
fi

rm -rf $work_dir/apk_temp
mods "Done"
