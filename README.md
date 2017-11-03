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
  * Adds Podfile with Fabric and Crashlytics pods
  #### Options
  * Storyboards - creates Main.storyboard file
  * SwiftLint - adds .swiftlint.yml file and Run Script to Build phases that will show error if SwiftLint not installed
  * Alamofire - adds Alamofire, AlamofireImage and AlamofireNetworkActivityIndicator pods
  * Rambafile - creates Rambafile with surf_mvp_module template and paths to project target and tests target

## Installation
To install or update the templates you need:
  * Quit Xcode
  * On the command line:
  ```
  git clone https://github.com/surfstudio/Xcode-Project-Templates
  sh ./install.sh
  rm -rf Xcode-Project-Templates
  ```
  Or if you have a cloned repository:
  * On the command line, cd into the directory with cloned templates and write `sh ./install.sh`
 <img width="569" alt="screen shot 2017-08-21 at 20 41 30" src="https://user-images.githubusercontent.com/11653316/29531419-241a33ea-86b1-11e7-8c7d-4b1e54e61f7a.png">
 
After that:
  * Launch Xcode and select create a new Xcode project and you'll see the new category "User Templates" that will contain new templates
  <img width="730" alt="screen shot 2017-08-20 at 12 35 40" src="https://user-images.githubusercontent.com/11653316/29493709-433ccf98-85a4-11e7-81cf-9d9565cdd56b.png">

## After creating a project
### Remove unnecessary files
* Open up the .xcodeproj file.
* Remove the Non-iOS Resources folder from the Xcode project by selecting that folder in the sidebar, right clicking, then selecting delete from the menu, then selecting "Remove References" in the dialog that pops up:
<img width="551" alt="screen shot 2017-08-21 at 20 30 09" src="https://user-images.githubusercontent.com/11653316/29531076-9b90168a-86af-11e7-87af-7477b4ab5b58.png">
