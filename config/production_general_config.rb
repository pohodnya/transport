Transport::Application.configure do

  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_files = false
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.assets.version = '1.0'
  config.log_level = :fatal
  config.assets.precompile += %w( frontend/frontend.js frontend/frontend.css )
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.raise_delivery_errors = true
  config.log_formatter = ::Logger::Formatter.new

end