logger = ::Logger.new(STDOUT)
logger.formatter = proc do |severity, time, progname, msg|
  span_id = OpenTelemetry::Trace.current_span.context.hex_span_id
  trace_id = OpenTelemetry::Trace.current_span.context.hex_trace_id
  if defined? OpenTelemetry::Trace.current_span.name
    operation = OpenTelemetry::Trace.current_span.name
  else
    operation = 'undefined'
  end

  "#{time}, #{severity}: #{msg} - trace_id=#{trace_id} - span_id=#{span_id} - operation=#{operation}\n"
end
set :logger, logger
