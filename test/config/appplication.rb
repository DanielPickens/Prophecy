require "prophecy"
$LOAD_PATH << File.join(File.dirname(__FILE__),
 "..", "app",
 "controllers")

module Test
  class Application < Prophecy::Application
  end
end