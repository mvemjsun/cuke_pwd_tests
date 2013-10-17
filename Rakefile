require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:normal) do |t|
  t.profile = 'default'
  t.cucumber_opts = %w{--format html --tags @normal -o report_normal.html}
end

Cucumber::Rake::Task.new(:comms) do |t|
  t.profile = 'default'
  t.cucumber_opts = %w{--format html --tags @comms -o report_comms.html}
end

Cucumber::Rake::Task.new(:db) do |t|
  t.profile = 'default'
  t.cucumber_opts = %w{--format html --tags @db -o report_db.html}
end

Cucumber::Rake::Task.new(:security) do |t|
  t.profile = 'default'
  t.cucumber_opts = %w{--format html --tags @security -o report_security.html}
end

task :default => :normal