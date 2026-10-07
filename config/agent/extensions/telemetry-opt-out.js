// Apply privacy defaults independently of optional command-rewriting integrations.
export default function telemetryOptOut() {
  process.env.DO_NOT_TRACK = "1";
  process.env.OTEL_SDK_DISABLED = "true";
  process.env.OTEL_EXPORTER_OTLP_ENDPOINT = "";
  process.env.OTEL_EXPORTER_OTLP_HEADERS = "";
  process.env.OTEL_EXPORTER_OTLP_TRACES_ENDPOINT = "";
  process.env.OTEL_EXPORTER_OTLP_TRACES_HEADERS = "";
  process.env.OTEL_EXPORTER_OTLP_METRICS_ENDPOINT = "";
  process.env.OTEL_EXPORTER_OTLP_METRICS_HEADERS = "";
  process.env.OTEL_EXPORTER_OTLP_LOGS_ENDPOINT = "";
  process.env.OTEL_EXPORTER_OTLP_LOGS_HEADERS = "";
  process.env.RTK_TELEMETRY_DISABLED = "1";
  process.env.NEXT_TELEMETRY_DISABLED = "1";
  process.env.POSTHOG_KEY = "";
  process.env.LANGFUSE_PUBLIC_KEY = "";
  process.env.LANGFUSE_SECRET_KEY = "";
  process.env.OPEN_DESIGN_TELEMETRY_RELAY_URL = "";
  process.env.OPEN_DESIGN_OBJECT_RELAY_URL = "";
  process.env.OPEN_DESIGN_VELA_TELEMETRY = "0";
  process.env.PI_AUTO_QA = "0";
  process.env.PI_AUTO_QA_PUSH = "0";
  process.env.PI_AUTO_QA_PUSH_URL = "";
  process.env.PI_AUTO_QA_PUSH_TOKEN = "";
}
