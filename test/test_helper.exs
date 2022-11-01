Application.stop(:opentelemetry)
Application.load(:opentelemetry)

Application.put_env(:opentelemetry, :processors, [
  {:otel_batch_processor,
   %{scheduled_delay_ms: 1, exporter: {:otel_exporter_pid, :test_registered_pid}}}
])

{:ok, _} = Application.ensure_all_started(:opentelemetry)

ExUnit.start()
