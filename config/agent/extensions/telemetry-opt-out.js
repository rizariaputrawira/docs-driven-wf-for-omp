// Apply privacy defaults independently of optional command-rewriting integrations.
export default function telemetryOptOut() {
  process.env.DO_NOT_TRACK = "1";
  process.env.OTEL_SDK_DISABLED = "true";
  process.env.RTK_TELEMETRY_DISABLED = "1";
  process.env.NEXT_TELEMETRY_DISABLED = "1";
  process.env.POSTHOG_KEY = "";
  process.env.LANGFUSE_PUBLIC_KEY = "";
  process.env.LANGFUSE_SECRET_KEY = "";
  process.env.OPEN_DESIGN_TELEMETRY_RELAY_URL = "";
  process.env.OPEN_DESIGN_VELA_TELEMETRY = "0";
  process.env.PI_AUTO_QA = "0";
  process.env.PI_AUTO_QA_PUSH = "0";
}
