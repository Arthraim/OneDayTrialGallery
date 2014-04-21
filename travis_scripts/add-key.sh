#!/bin/sh
#security create-keychain -p travis iosbuild.keychain
#security unlock-keychain -p travis iosbuild.keychain
#security set-keychain-settings -u iosbuild.keychain
#ls ~/Library/Keychains/
security import ./travis_scripts/certs/AppleWWDRCA.cer -T `which codesign` -T `which xctool` -T `which xcrun`
security import ./travis_scripts/certs/dist.cer -T `which codesign` -T `which xctool` -T `which xcrun`
security import ./travis_scripts/certs/dist.p12 -P $KEY_PASSWORD -T `which codesign` -T `which xctool` -T `which xcrun`
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./travis_scripts/profiles/$PROFILE_NAME.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
