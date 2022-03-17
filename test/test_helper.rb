require 'minitest/autorun'
require 'webmock/minitest'
require 'json'
require 'prophecy'


def open_test_file(name)
  File.new(File.join(File.dirname(__FILE__), name.split('.').last, name))
end
