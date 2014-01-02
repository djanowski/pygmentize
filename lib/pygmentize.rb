require "shellwords"

class Pygmentize
  VERSION = "0.0.4"

  def self.bin
    "/usr/bin/env python #{File.expand_path("../vendor/pygments/pygmentize", File.dirname(__FILE__))}"
  end

  # generate string of additional options from hash
  def self.options_string(options)
    opts_string = options.to_a.reduce([]) { |a,i|
      a << "-O #{i.map { |i| Shellwords.escape(i.to_s) }.join('=')}"
    }.join(' ')

    opts_string
  end

  def self.process(source, lexer, options = {})
    options[:encoding] = source.encoding

    args = [
      "-l", lexer.to_s,
      "-f", "html"
    ]

    cmd = "#{bin} #{Shellwords.shelljoin args} #{options_string(options)}"
    IO.popen(cmd, "r+") do |io|
      io.write(source)
      io.close_write
      io.read
    end
  end
end
