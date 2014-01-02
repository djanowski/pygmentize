require "./lib/pygmentize"

Gem::Specification.new do |s|
  s.name              = "pygmentize"
  s.version           = Pygmentize::VERSION
  s.summary           = "A Ruby gem that vendors Pygments"
  s.description       = "A Ruby gem that vendors Pygments"
  s.authors           = ["Damian Janowski", "Michel Martens", "Eric Wood"]
  s.email             = ["djanowski@dimaion.com", "michel@soveran.com", "eric@ericwood.org"]
  s.homepage          = "http://github.com/djanowski/pygmentize"
  s.files = Dir[
    "*.gemspec",
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "lib/**/*.rb",
    "test/*.*",
    "vendor/**/*",
  ]

  s.executables.push("pygmentize")
end
