# -*- encoding : utf-8 -*-
BlogsosoSite::Application.configure do
  config.cache_classes = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = true

  config.assets.compress = true

  config.assets.compile = true

  config.assets.digest = true

  # config.assets.manifest = YOUR_PATH

  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # config.force_ssl = true

  # config.log_tags = [ :subdomain, :uuid ]
  config.log_tags = [ :host ]

  config.eager_load = true

  config.action_dispatch.rack_cache = true

  # Compress JavaScripts and CSS.
  config.assets.js_compressor  = :uglifier
  config.assets.css_compressor = :sass

  config.assets.digest = true

  config.assets.version = '1.0'

  config.log_level = :info

  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # config.autoflush_log = false

  config.log_formatter = ::Logger::Formatter.new

  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # config.cache_store = :mem_cache_store

  # config.action_controller.asset_host = "http://assets.example.com"

  # config.assets.precompile += %w( search.js )

  config.assets.precompile += []

  config.assets.precompile << Proc.new { |path|
    if path =~ /\.(css|js|gif|jpg|png)\z/
      full_path = ::Rails.application.assets.resolve(path).to_path
      app_assets_path = ::Rails.root.join('app', 'assets').to_path

      true
    else
      false
    end
  }

  # config.action_mailer.raise_delivery_errors = false

  # config.threadsafe!

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  # config.active_record.auto_explain_threshold_in_seconds = 0.5

  # 静态文件的域名
  config.action_controller.asset_host = ::Settings.configs.servers.assets

  # Memcache::Config.servers
  config.cache_store = :dalli_store, '127.0.0.1:11211', {
    :namespace => 'blogsoso:memcache:production',
    :expires_in => 14.days,
    :compress   => true,
    :debug      => false
  }

end
