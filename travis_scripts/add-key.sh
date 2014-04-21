#!/bin/sh
#security create-keychain -p travis iosbuild.keychain
#security unlock-keychain -p travis iosbuild.keychain
#security set-keychain-settings -u iosbuild.keychain
ls ~/Library/Keychains/
security import ./travis_scripts/certs/AppleWWDRCA.cer -k ~/Library/Keychains/login.keychain -T `which codesign`
security import ./travis_scripts/certs/dist.cer -k ~/Library/Keychains/login.keychain -T `which codesign`
security import ./travis_scripts/certs/dist.p12 -k ~/Library/Keychains/login.keychain -P $KEY_PASSWORD -T `which codesign`
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./travis_scripts/profiles/$PROFILE_NAME.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
