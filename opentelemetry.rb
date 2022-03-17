require 'prophecy'
require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'
require 'opentelemetry/instrumentation/all'


otel_exporter = OpenTelemetry::Exporter::OTLP::Exporter.new
processor = OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(otel_exporter)
otel_exporter_otlp_trace_endpoint = http://localhost:44134

OpenTelemetry::SDK.configure do |c|
 
  c.add_span_processor(processor) 

  c.resource = OpenTelemetry::SDK::Resources::Resource.create({
    OpenTelemetry::SemanticConventions::Resource::SERVICE_NAMESPACE => 'daniel-namespace',
    OpenTelemetry::SemanticConventions::Resource::SERVICE_NAME => 'rails',
    OpenTelemetry::SemanticConventions::Resource::SERVICE_INSTANCE_ID => Socket.gethostname,
    OpenTelemetry::SemanticConventions::Resource::SERVICE_VERSION => "0.0.0",
    "daniel.id" => "daniel_auth_id",
    "daniel.key" => "daniel_auth_key",
  })

  
  c.use 'OpenTelemetry::Instrumentation::Rack'
  c.use 'OpenTelemetry::Instrumentation::ActionPack'
  c.use 'OpenTelemetry::Instrumentation::ActionView'
  c.use 'OpenTelemetry::Instrumentation::ActiveJob'
  c.use 'OpenTelemetry::Instrumentation::ActiveRecord'
  c.use 'OpenTelemetry::Instrumentation::ConcurrentRuby'
  c.use 'OpenTelemetry::Instrumentation::Faraday'
  c.use 'OpenTelemetry::Instrumentation::HttpClient'
  c.use 'OpenTelemetry::Instrumentation::Net::HTTP'
  c.use 'OpenTelemetry::Instrumentation::PG', {
    db_statement: :obfuscate,
  }
  c.use 'OpenTelemetry::Instrumentation::Rails'
  c.use 'OpenTelemetry::Instrumentation::Redis'
  c.use 'OpenTelemetry::Instrumentation::RestClient'
  c.use 'OpenTelemetry::Instrumentation::RubyKafka'
  c.use 'OpenTelemetry::Instrumentation::Sidekiq'
end
