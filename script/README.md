# 📝 How To Use

## Requirements

- **Rom Side**: ROM or device tree must have implementation following nodes /sys/class/power_supply/battery/input_suspend
- **Kernel Side**: Kernel must have implementation of bypass charging or You can use this kernel [Anonymous_Kernel](https://sourceforge.net/projects/arata-labs/files/Anonymous-Kernel/KernelSU-Next/Anonymous_Daemon_KSU_Next_kernel_surya_20250407_0352_d70c8109.zip/download) (Link will updated to latest version)
- **Termux**: Use termux from FDroid or download use this [link](https://f-droid.org/repo/com.termux_1021.apk), Build script will failed if not use Termux from FDroid

## Steps to use

1) Copy this command `apt update && apt upgrade -y`
2) Copy this following command `bash <(curl -sS https://raw.githubusercontent.com/HinohArata/OTA/main/script/setup.sh)`
3) If installing dependencies success, you can use `cmode` commands in termux for switching battery charge mode

# 🚀 Good luck :)
