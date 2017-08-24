#!/bin/bash
installDirectory=~/Library/Developer/Xcode/Templates/Project\ Templates/
mkdir -p "${installDirectory}"
cp -R "Surf Base Application.xctemplate" "${installDirectory}"
cp -R "Surf MVP Application.xctemplate" "${installDirectory}"