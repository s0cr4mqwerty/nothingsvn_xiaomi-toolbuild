work_dir=$(pwd)
source $work_dir/functions.sh

AndroidVER=$(cat $work_dir/bin/ddevice/androidver.txt)

if [[ $AndroidVER == "13" ]]; then
    patch "startPatch for A13 or lower"
    bash $work_dir/bin/package/COREPATCH/A13/Penguin13.sh
elif [[ $AndroidVER == "14" ]]; then
    patch "startPatch for A14"
    bash $work_dir/bin/package/COREPATCH/A14/Penguin14.sh
elif [[ $AndroidVER == "15" ]]; then
    patch "startPatch for A15"
    bash $work_dir/bin/package/COREPATCH/A15/Penguin15.sh
elif [[ $AndroidVER == "16" ]]; then
    patch "startPatch for A16"
    bash $work_dir/bin/package/COREPATCH/A16/Penguin16.sh
else
    patch "Unsupported Android version"
fi