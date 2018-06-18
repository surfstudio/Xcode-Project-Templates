# Xcode-Project-Templates
This repository contains Xcode project templates to start up a new project.

## Requirements
Xcode 8 or later. 

## Base features (contains in all templates)
* Folders structure - сreates folders for good structuring of the files
* Gitignore - adds gitignore file with base rules

## List of templates
* ### Surf MVP Application
  #### Features
  * Adds ModuleTransitionable.swift file to project
  * Adds Podfile with Fabric, Crashlytics, SwiftLint and SwiftGen pods
  * Adds .swiftlint.yml file and SwiftLint Run Script to Build phases
  * Adds Gemfile with fastlane, cocoapods, synx and generamba gems
  * Creates Fastlane files with template methods
  * Creates Rambafile with surf_mvp_module template and paths to project target and tests target
  * Creates Makefile with helper methods
  #### Options
  * Storyboards - creates Main.storyboard file
  * Alamofire - adds Alamofire, AlamofireImage and AlamofireNetworkActivityIndicator pods

## Installation
To install or update the templates you need:
  1. Quit Xcode
  2. On the command line:
  ```
  cd ~/Downloads
  git clone https://github.com/surfstudio/Xcode-Project-Templates
  cd Xcode-Project-Templates
  sh ./install.sh
  cd ..
  rm -rf Xcode-Project-Templates
  ```
  Or if you have a cloned repository:
  * On the command line, cd into the directory with cloned templates and write `sh ./install.sh`
 <img width="569" alt="screen shot 2017-08-21 at 20 41 30" src="https://user-images.githubusercontent.com/11653316/29531419-241a33ea-86b1-11e7-8c7d-4b1e54e61f7a.png">

After that:
  * Launch Xcode and select create a new Xcode project and you'll see the new category "User Templates" that will contain new templates
  <img width="730" alt="screen shot 2017-08-20 at 12 35 40" src="https://user-images.githubusercontent.com/11653316/29493709-433ccf98-85a4-11e7-81cf-9d9565cdd56b.png">

## After creating a project
### Fix folders links
1. Open up the Terminal and `cd` into your project folder
2. Call in Terminal `make init`
3. Call `make synx`
### Remove unnecessary files
1. Open up the .xcodeproj file
2. Remove the Non-iOS Resources folder from the Xcode project by selecting that folder in the sidebar, right clicking, then selecting delete from the menu, then selecting "Remove References" in the dialog that pops up
### Insert keys in Fastlane files
1. Open fastlane folder
2. Insert `team_id` in AppFile
3. Insert `api_token`, `build secret` and `emails` in `upload_to_fabric` lane
