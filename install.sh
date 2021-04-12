#/bin/bash
yum install -y wget unzip java-1.8.0-openjdk-devel.x86_64 make python38
cd /tmp
wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
mkdir -p /home/rnuser/android/cmdline-tools
cd /home/rnuser/android/cmdline-tools
unzip /tmp/commandlinetools-linux-6858069_latest.zip
mv cmdline-tools tools
echo 'export ANDROID_HOME=/home/rnuser/android' > $HOME/.androidrc
echo 'export ANDROID_SDK_ROOT=$ANDROID_HOME' >> $HOME/.androidrc
echo 'export PATH=$ANDROID_HOME/platform-tools:$PATH' >> $HOME/.androidrc
echo 'export PATH=$ANDROID_HOME/emulator:$PATH' >> $HOME/.androidrc
echo 'export PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH' >> $HOME/.androidrc
echo 'export PATH=/home/rnuser/node-v14.16.0-linux-x64/bin:$PATH' >> $HOME/.androidrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.282.b08-2.el8_3.x86_64' >> $HOME/.androidrc
echo 'source $HOME/.androidrc' >> $HOME/.bash_profile
source $HOME/.androidrc 
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
avdmanager create avd -n Pixel_API_28_AOSP -d pixel --package "system-images;android-28;default;x86_64"
cd /tmp
wget https://nodejs.org/dist/v14.16.0/node-v14.16.0-linux-x64.tar.xz
tar xvJf node-v14.16.0-linux-x64.tar.xz 
mv node-v14.16.0-linux-x64 /home/rnuser/
npm install -g reactnative
npm install -g detox-cli

