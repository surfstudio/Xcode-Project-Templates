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

screen: 
	bundle exec generamba gen $(modName) surf_mvp_module

build:
	bundle exec fastlane build clean:true

synx:
	bundle exec synx --exclusion "Project/Non-iOS Resources" Project.xcodeproj

lint:
	./Pods/SwiftLint/swiftlint lint --config .swiftlint.yml

format:
	./Pods/SwiftLint/swiftlint autocorrect --config .swiftlint.yml