#/bin/bash
cd /tmp
wget https://dl.google.com/android/repository/commandlinetools-linux-9123335_latest.zip
mkdir -p /usr/android/cmdline-tools
cd /usr/android/cmdline-tools
unzip /tmp/commandlinetools-linux-9123335_latest.zip
mv cmdline-tools tools
touch /etc/profile.d/androidrc.sh
echo 'export ANDROID_HOME=/usr/android' > /etc/profile.d/androidrc.sh
echo 'export ANDROID_SDK_ROOT=$ANDROID_HOME' >> /etc/profile.d/androidrc.sh
echo 'export PATH=$ANDROID_HOME/platform-tools:$PATH' >> /etc/profile.d/androidrc.sh
echo 'export PATH=$ANDROID_HOME/emulator:$PATH' >> /etc/profile.d/androidrc.sh
echo 'export PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH' >> /etc/profile.d/androidrc.sh
echo 'export PATH=/usr/node/bin:$PATH' >> /etc/profile.d/androidrc.sh
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> /etc/profile.d/androidrc.sh
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile.d/androidrc.sh
source /etc/profile.d/androidrc.sh 
yes | sdkmanager --licenses
sdkmanager emulator
sdkmanager "platforms;android-28"
sdkmanager "build-tools;28.0.3"
sdkmanager "platforms;android-29"
sdkmanager "build-tools;29.0.2"
sdkmanager "build-tools;29.0.3"
sdkmanager "platforms;android-30"
sdkmanager "build-tools;30.0.3"
sdkmanager "system-images;android-28;default;x86_64"
sdkmanager "ndk;21.4.7075529"
sdkmanager "cmake;3.18.1"
dkmanager "platforms;android-31"
avdmanager create avd -n Pixel_API_28_AOSP -d pixel --package "system-images;android-28;default;x86_64"
cd /tmp
wget https://nodejs.org/dist/v18.13.0/node-v18.13.0-linux-x64.tar.xz
tar xvJf node-v18.13.0-linux-x64.tar.xz
mv node-v18.13.0-linux-x64 /usr/node
/usr/node/bin/npm install -g reactnative
/usr/node/bin/npm install -g detox-cli
find /usr/android -type d -exec chmod o+w {} \;

