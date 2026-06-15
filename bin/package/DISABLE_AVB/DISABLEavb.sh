work_dir=$(pwd)
source $work_dir/functions.sh
device_code=$(cat $work_dir/bin/ddevice/device_f.txt)

disable_avb_verify $work_dir/build/baserom/images/vendor >/dev/null 2>&1
bash $work_dir/bin/package/DISABLE_AVB/HMATools/start
