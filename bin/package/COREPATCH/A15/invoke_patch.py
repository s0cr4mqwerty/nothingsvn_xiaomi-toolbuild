import os
import glob

def delete_smali_file(directories):
    files_to_delete = [
        "KeyboardLayoutPreviewDrawable$GlyphDrawable.smali",
        "PhysicalKeyLayout$EnterKey.smali",
        "PhysicalKeyLayout$LayoutKey.smali",
        "MediaRouter2$InstanceInvalidatedCallbackRecord.smali",
        "MediaRouter2$PackageNameUserHandlePair.smali"
    ]

    deleted_count = 0

    for directory in directories:
        for root, _, files in os.walk(directory):
            for f in files:
                if f in files_to_delete:
                    file_path = os.path.join(root, f)
                    try:
                        os.remove(file_path)
                        print(f"Deleted: {file_path}")
                        deleted_count += 1
                    except Exception as e:
                        print(f"Error deleting {file_path}: {e}")

    if deleted_count == 0:
        print("No matching files found to delete.")
    else:
        print(f"Total files deleted: {deleted_count}")

if __name__ == "__main__":
    cwd = os.getcwd()
    search_pattern = os.path.join(cwd, "jar_temp/framework.jar.out", "classes*.dex.out")
    directories = glob.glob(search_pattern)
    delete_smali_file(directories)
