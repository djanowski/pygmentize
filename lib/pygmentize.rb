require "shellwords"

class Pygmentize
  VERSION = "0.0.3"

  def self.bin
    "/usr/bin/env python #{File.expand_path("../vendor/pygmentize.py", File.dirname(__FILE__))}"
  end

  def self.process(source, lexer, args = [])
    args += [
      "-l", lexer.to_s,
      "-f", "html",
      "-O", "encoding=#{source.encoding}"
    ]

    key = create_cache_key(source, lexer, args)
    @cached_results ||= {}

    unless @cached_results[key]
      @cached_results[key] = IO.popen("#{bin} #{Shellwords.shelljoin args}", "r+") do |io|
        io.write(source)
        io.close_write
        io.read
      end
    end
    @cached_results[key]
  end

  private
  def self.create_cache_key(source, lexer, args = [])
    "#{source}#{lexer}#{args.join}"
  end
end
