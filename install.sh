#!/bin/bash
installDirectory=~/Library/Developer/Xcode/Templates/Project\ Templates/
baseAppDirectory="${installDirectory}/Surf Base Application.xctemplate"
testsDirectory="${installDirectory}/Surf Application Unit Test Base.xctemplate"

mkdir -p "${installDirectory}"

cp -R "Surf Base Application.xctemplate" "${installDirectory}"
cp -R "Surf MVP Application.xctemplate" "${installDirectory}"
cp -R "Surf Application Unit Test Base.xctemplate" "${installDirectory}"

mkdir -p "${baseAppDirectory}/Application"
mkdir -p "${baseAppDirectory}/Library/Base Classes"
mkdir -p "${baseAppDirectory}/Library/Extensions"
mkdir -p "${baseAppDirectory}/Library/Protocols"
mkdir -p "${baseAppDirectory}/Library/Reusable Layer"
mkdir -p "${baseAppDirectory}/Library/Utils"
mkdir -p "${baseAppDirectory}/Models/Entry"
mkdir -p "${baseAppDirectory}/Models/Entity"
mkdir -p "${baseAppDirectory}/Resources/Constants"
mkdir -p "${baseAppDirectory}/Resources/Fonts"
mkdir -p "${baseAppDirectory}/Resources/Images"
mkdir -p "${baseAppDirectory}/Resources/Strings"
mkdir -p "${baseAppDirectory}/Screens"
mkdir -p "${baseAppDirectory}/Services"
mkdir -p "${baseAppDirectory}/Third Party"

mkdir -p "${testsDirectory}/Resources"
mkdir -p "${testsDirectory}/Tests"
mkdir -p "${testsDirectory}/Tests/Extensions"
mkdir -p "${testsDirectory}/Tests/Models"
mkdir -p "${testsDirectory}/Tests/Screens"
mkdir -p "${testsDirectory}/Tests/Services"

echo "Templates installed to ${installDirectory}"
