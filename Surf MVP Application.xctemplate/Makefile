init:
	# Install bundler if not installed
	if ! gem spec bundler > /dev/null 2>&1; then\
  		echo "bundler gem is not installed! Run gem install bundler to install it";\
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

## Used to build target. Usually, it is not called manually, it is necessary for the CI to work.
build:
	bundle exec fastlane build clean:true

## Used to create a new module. Example: make screen modName=<ModuleName> flow=<FlowName>
screen:
	bundle exec generamba gen $(modName) surf_mvp_coordinatable_module --module_path '___PACKAGENAME___/Flows/$(flow)' --test_path '___PACKAGENAME___Tests/Tests/Flows/$(flow)'

## Used to create a new alert. Example: make alert modName=<AlertName> flow=<FlowName>
alert:
	bundle exec generamba gen $(modName) surf_mvp_coordinatable_alert --module_path '___PACKAGENAME___/Flows/$(flow)' --test_path '___PACKAGENAME___Tests/Tests/Flows/$(flow)'

## Run tests
test:
	bundle exec fastlane tests

## Convert groups to folders if needed and sort with alphabetic order
synx:
	bundle exec synx --exclusion "___PACKAGENAME___/Non-iOS Resources" ___PACKAGENAME___.xcodeproj

## Allows you to perfrom swiftlint autocorrect command.
format:
	./Pods/SwiftLint/swiftlint autocorrect --config .swiftlint.yml

## Run SwiftLint check
lint:
	./Pods/SwiftLint/swiftlint lint --config .swiftlint.yml

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

# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)


TARGET_MAX_CHAR_NUM=20
## Show help
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
