#!/bin/sh
security create-keychain -p travis ios-build.keychain
ls ~/Library/Keychains/
security import ./travis_scripts/certs/AppleWWDRCA.cer -k ~/Library/Keychains/ios-build.keychain -T `which codesign` -T `which xctool` -T `which xcrun`
security import ./travis_scripts/certs/dist.cer -k ~/Library/Keychains/ios-build.keychain -T `which codesign` -T `which xctool` -T `which xcrun`
security import ./travis_scripts/certs/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -T `which codesign` -T `which xctool` -T `which xcrun`
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./travis_scripts/profiles/$PROFILE_NAME.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/