Geocoder.configure(
  # Geocoding options
  lookup: :test, ip_lookup: :test,
  timeout: 25,                 # geocoding service timeout (secs)
  lookup: :geocoder_ca,         # name of geocoding service (symbol)
  ip_lookup: :ipinfo_io,      # name of IP address geocoding service (symbol)
  language: :en,              # ISO-639 language code
  # use_https: false,           # use HTTPS for lookup requests? (if supported)
  # http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
  # https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)
  # api_key: nil,               # API key for geocoding service
  # cache: nil,                 # cache object (must respond to #[], #[]=, and #del)
  # http_headers: { "Turing school project" => "thomasturner482@yahoo.com" },

  # Exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and Timeout::Error
  # always_raise: [],

  # Calculation options
  units: :mi,                 # :km for kilometers or :mi for miles
  # distances: :linear          # :spherical or :linear

  # Cache configuration
  # cache_options: {
  #   expiration: 2.days,
  #   prefix: 'geocoder:'
  # }
)
Geocoder::Lookup::Test.set_default_stub(
  [
    {
      'coordinates'  => [40.7143528, -74.0059731],
      'address'      => 'New York, NY, USA',
      'state'        => 'New York',
      'state_code'   => 'NY',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)
# if %w(development test).include? Rails.env
#   module Geocoder
#     module Request
#       def geocoder_spoofable_ip_with_localhost_override
#         ip_candidate = geocoder_spoofable_ip_without_localhost_override
#         if ip_candidate == '127.0.0.1'
#           '76.235.242.139'
#         else
#           ip_candidate
#         end
#       end
#       alias_method :geocoder_spoofable_ip, :localhost_override
#     end
#   end
# end
