require "shellwords"

class Pygmentize
  VERSION = "0.0.3"

  def self.bin
    "/usr/bin/env python2.6 #{File.expand_path("../vendor/pygmentize.py", File.dirname(__FILE__))}"
  end

  def self.process(source, lexer, args = [])
    args += [
      "-l", lexer.to_s,
      "-f", "html",
      "-O", "encoding=#{source.encoding}"
    ]

    IO.popen("#{bin} #{Shellwords.shelljoin args}", "r+") do |io|
      io.write(source)
      io.close_write
      io.read
    end
  end
end
