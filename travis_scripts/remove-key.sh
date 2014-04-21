#!/bin/sh
security delete-keychain iosbuild.keychain
rm -f ~/Library/MobileDevice/Provisioning\ Profiles/$PROFILE_NAME.mobileprovision