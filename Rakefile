# frozen_string_literal: true

# Disable pushing the gem to rubygems
# Source: https://github.com/rubygems/rubygems/blob/master/bundler/lib/bundler/gem_helper.rb#L231
ENV["gem_push"] = "no"

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

desc "Run all tasks required to pass CI"
task ci: %i[spec rubocop build]

task default: %i[ci]
