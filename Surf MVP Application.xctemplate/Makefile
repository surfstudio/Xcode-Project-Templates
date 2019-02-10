## Installs all dependencies
init:
	# Install bundler if not installed
	if ! gem spec bundler > /dev/null 2>&1; then\
  		echo "bundler gem is not installed!";\
  		-sudo gem install bundler;\
	fi
	-bundle install --path .bundle
	-bundle exec pod repo update
	-bundle exec pod install
	-bundle exec generamba template install

	# Install git hooks
	mkdir -p .git/hooks
	chmod +x commit-msg
	ln -s -f ../../commit-msg .git/hooks/commit-msg

## Generate screen module with name given in `modName` parameter
screen:
	bundle exec generamba gen $(modName) surf_mvp_module --module_path '___PACKAGENAME___/User Stories/$(flow)' --test_path '___PACKAGENAME___Tests/User Stories/$(flow)'

## Execute build with fastlane
build:
	bundle exec fastlane build clean:true

## Run tests with xcodebuild
test:
	xcodebuild test -workspace ___PACKAGENAME___.xcworkspace -scheme ___PACKAGENAME___ -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO -enableCodeCoverage YES -destination 'platform=iOS Simulator,name=iPhone 8,OS=12.0' | bundle exec xcpretty -c

## Convert groups to folders if needed and sort with alphabetic order
synx:
	bundle exec synx --exclusion "___PACKAGENAME___/Non-iOS Resources" ___PACKAGENAME___.xcodeproj

## Run SwiftLint check
lint:
	./Pods/SwiftLint/swiftlint lint --config .swiftlint.yml

## Autocorrect with SwiftLint
format:
	./Pods/SwiftLint/swiftlint autocorrect --config .swiftlint.yml

## Execute pod install command
pod:
	-bundle exec pod install

## Default configuration for beta command
config ?= debug

## Create and uploads build to Fabric or AppStoreConnect
## - Parameter config: Configuration for build.
## - Allowed inputs:
## config=debug - sends debug build to Fabric
## config=rc - sends release build to AppStoreConnect
beta:
ifeq ($(config),debug)
	bundle exec fastlane beta destination:$(config)
else ifeq ($(config),rc)
	bundle exec fastlane release
else
	@echo "No suitable command for" $(config)
	exit 1;
endif

## Prepare application for beta release - increment build numbers and set tags.
## Pass skip_push=true if you need to skip push to git
prepare_for_beta:
	bundle exec fastlane prepare_for_beta type:debug skip_push:$(skip_push)

## Prepare application for release - set rc tag.
## Pass include_beta=true if you need to call prepare_for_beta to make test and prod build too
## Pass skip_push=true if you need to skip push to git
prepare_for_release:
	bundle exec fastlane prepare_for_release include_beta:$(include_beta) skip_push:$(skip_push)
