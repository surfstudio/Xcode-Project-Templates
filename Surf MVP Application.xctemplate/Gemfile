source "https://rubygems.org"

# Ensure github repositories are fetched using HTTPS
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  puts(repo_name)
  "https://github.com/#{repo_name}.git"
end if Gem::Version.new(Bundler::VERSION) < Gem::Version.new('2')

gem "fastlane", "~> 2.78.0"
gem 'cocoapods', "~> 1.4.0"
gem 'synx', "~> 0.2.1"
gem 'generamba', github: 'surfstudio/Generamba', branch: 'develop'