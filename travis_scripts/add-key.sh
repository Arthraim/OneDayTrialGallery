#!/bin/sh
security create-keychain -p travis ios-build.keychain
security import ./travis_scripts/certs/AppleWWDRCA.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./travis_scripts/certs/one_day_trial_adhoc.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./travis_scripts/certs/one_day_trial_adhoc.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -T /usr/bin/codesign
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./travis_scripts/profile/$PROFILE_NAME.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/