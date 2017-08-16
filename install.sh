#!/bin/bash
installDirectory="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application"
cp -R "Surf Base Application.xctemplate" "${installDirectory}"
cp -R "Surf MVP Application.xctemplate" "${installDirectory}"