fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios build
```
fastlane ios build
```

### ios prepare_for_integration
```
fastlane ios prepare_for_integration
```

### ios prepare_for_beta
```
fastlane ios prepare_for_beta
```
Set build number and push version bump commit to develop branch with tag
### ios prepare_for_release
```
fastlane ios prepare_for_release
```
Set version and build numbers and push version bump commit to master branch with tag
### ios beta
```
fastlane ios beta
```
Submit a new Beta Build to Fabric
### ios release
```
fastlane ios release
```
Submit a new Release Build to Fabric
### ios upload_to_fabric
```
fastlane ios upload_to_fabric
```


----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
