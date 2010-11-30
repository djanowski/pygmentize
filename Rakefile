task :test do
  require "cutest"

  Cutest.run(Dir["test/pygmentize.rb"])
end

task :cleanup do
  `rm vendor/pygments/**/*.pyc`
end

task :default => :test
