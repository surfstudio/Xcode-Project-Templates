#!/bin/bash
installDirectory="~/Library/Developer/Xcode/Templates/Project Templates/iOS"
mkdir -p "${installDirectory}"
cp -R "Surf Base Application.xctemplate" "${installDirectory}"
cp -R "Surf MVP Application.xctemplate" "${installDirectory}"