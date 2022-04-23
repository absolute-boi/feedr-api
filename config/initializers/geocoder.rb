# frozen_string_literal: true

Geocoder.configure(
  # Geocoding options

  # geocoding service timeout (secs)
  timeout: 5,

  # name of geocoding service (symbol)
  lookup: :geoapify,

  # ip_lookup: :freegeoip,      # name of IP address geocoding service (symbol)
  # language: :en,              # ISO-639 language code

  # use HTTPS for lookup requests? (if supported)
  use_https: false,

  # http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
  # https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)

  # API key for geocoding service
  api_key: ENV['GEOAPIFY_API_KEY'],

  # cache: nil,                 # cache object (must respond to #[], #[]=, and #del)
  # cache_prefix: 'geocoder:',  # prefix (string) to use for all cache keys

  # Exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and Timeout::Error
  # always_raise: [],

  # Calculation options
  # :km for kilometers or :mi for miles
  units: :mi
  # distances: :linear          # :spherical or :linear
)
