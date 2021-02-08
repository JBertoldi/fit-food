Sentry.init do |config|
  config.dsn = ENV['SENTRY_DSN']
  config.breadcrumbs_logger = [:active_support_logger]

  config.traces_sampler = lambda do |_context|
    true
  end
end
