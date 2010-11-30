task :test do
  require "cutest"

  Cutest.run(Dir["test/pygmentize.rb"])
end

task :cleanup do
  `find . -name "*.pyc" -delete`
end

task :default => :test
