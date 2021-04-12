#!/bin/bash
yum install -y wget unzip java-1.8.0-openjdk-devel.x86_64
wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
mkdir -p /android/cmdline-tools
cd /android/cmdline-tools
unzip ../../commandlinetools-linux-6858069_latest.zip
mv cmdline-tools tools
echo 'export ANDROID_HOME=/android' > $HOME/.androidrc
echo 'export ANDROID_SDK_ROOT=$ANDROID_HOME' >> $HOME/.androidrc
echo 'export PATH=$ANDROID_HOME/platform-tools:$PATH' >> $HOME/.androidrc
echo 'export PATH=$ANDROID_HOME/emulator:$PATH' >> $HOME/.androidrc
echo 'export PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH' >> $HOME/.androidrc
echo 'export PATH=/tmp_data/$user/node-v14.16.0-linux-x64/bin:$PATH' >> $HOME/.androidrc
echo 'export PATH=/node-v14.16.0-linux-x64/bin:$PATH' >> $HOME/.androidrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.282.b08-2.el8_3.x86_64' >> $HOME/.androidrc
echo 'source $HOME/.androidrc' >> $HOME/.bash_profile
source $HOME/.androidrc 
echo -e 'y\ny\ny\ny\ny\ny\ny\ny\n' | sdkmanager --licenses
sdkmanager emulator
sdkmanager "platforms;android-28"
sdkmanager "build-tools;28.0.3"
sdkmanager "platforms;android-29"
sdkmanager "build-tools;29.0.2"
sdkmanager "platforms;android-30"
sdkmanager "build-tools;30.0.3"
sdkmanager "system-images;android-28;default;x86_64"
avdmanager create avd -n Pixel_API_28_AOSP -d pixel --package "system-images;android-28;default;x86_64"
cd /
wget https://nodejs.org/dist/v14.16.0/node-v14.16.0-linux-x64.tar.xz
tar xvJf node-v14.16.0-linux-x64.tar.xz 
npm install -g reactnative
npm install -g detox-cli
