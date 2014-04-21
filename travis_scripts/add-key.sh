#!/bin/sh
security create-keychain -p travis iosbuild.keychain
security unlock-keychain -p travis iosbuild.keychain
security set-keychain-settings -u iosbuild.keychain
security default-keychain -s iosbuild.keychain
ls ~/Library/Keychains/
security add-certificates ./travis_scripts/certs/AppleWWDRCA.cer
security add-certificates ./travis_scripts/certs/dist.cer
security import ./travis_scripts/certs/AppleWWDRCA.cer -k ~/Library/Keychains/iosbuild.keychain -T `which codesign` -T `which xctool` -T `which xcrun`
security import ./travis_scripts/certs/dist.cer -k ~/Library/Keychains/iosbuild.keychain -T `which codesign` -T `which xctool` -T `which xcrun`
security import ./travis_scripts/certs/dist.p12 -k ~/Library/Keychains/iosbuild.keychain -P $KEY_PASSWORD -T `which codesign` -T `which xctool` -T `which xcrun`
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./travis_scripts/profiles/$PROFILE_NAME.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/

