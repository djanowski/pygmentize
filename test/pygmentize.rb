# encoding: UTF-8

require File.expand_path("../lib/pygmentize", File.dirname(__FILE__))
require "nokogiri"
require "shellwords"

test "colorizes output" do
  output = Pygmentize.process(%Q[{foo: "bar"}], :javascript)

  doc = Nokogiri::HTML(output)

  assert doc.at_xpath(".//div[@class='highlight']")
  assert doc.at_xpath(".//div[@class='highlight']/pre/span[@class='nx' and text()='foo']")
end

test "handles encodings" do
  output = Pygmentize.process(%Q[{foo: "bar", baz: "qüx"}], :javascript)

  assert output.encoding == Encoding::UTF_8
end

test "handles command line options" do
  to_escape = "two words"
  options = {foo: "bar", bar: to_escape}

  opts = Pygmentize.options_string(options)

  assert opts.include?("-O foo=bar ")

  # ensure escaping of options
  assert opts.include?("-O bar=#{Shellwords.escape(to_escape)}")
end

test "handles linenos option" do
  # the linenos option adds line numbering to the output
  output = Pygmentize.process(%Q[{foo: "bar"}], :javascript, linenos: true)

  doc = Nokogiri::HTML(output)

  # line numbers are added as a table with the following elements
  assert doc.at_css("td.linenos")
  assert doc.at_css("div.linenodiv")
end

