require "shellwords"

class Pygments
  VERSION = "0.0.1"

  def self.bin
    "/usr/bin/env python #{File.expand_path("../vendor/pygmentize.py", File.dirname(__FILE__))}"
  end

  def self.pygmentize(source, lexer)
    args = [
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
