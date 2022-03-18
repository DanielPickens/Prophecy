require 'minitest/autorun'
require 'webmock/minitest'
require 'json'
require 'prophecy'
require 'opentelemetry/sdk'


def open_test_file(name)
  File.new(File.join(File.dirname(__FILE__), name.split('.').last, name))
end




# global opentelemetry-sdk setup:
EXPORTER = OpenTelemetry::SDK::Trace::Export::InMemorySpanExporter.new
span_processor = OpenTelemetry::SDK::Trace::Export::SimpleSpanProcessor.new(EXPORTER)

OpenTelemetry::SDK.configure do |c|
  c.add_span_processor span_processor
end