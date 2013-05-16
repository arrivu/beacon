Myapp::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true

  # ActionMailer Config
  config.action_mailer.default_url_options = { :host => "#{Settings.mailserver.domain}" }
  config.action_mailer.delivery_method = :smtp
  # # change to true to allow email to be sent during development
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.smtp_settings = {
    address: "#{Settings.mailserver.address}",
    port: "#{Settings.mailserver.port}",
    domain: "#{Settings.mailserver.domain}",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: "#{Settings.mailserver.user_name}",
    password: "#{Settings.mailserver.password}"
  }
  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = true

  # Expands the lines which load the assets
  config.assets.debug = true
  
  #exception notifier
  config.middleware.use ExceptionNotifier,
    :email_prefix => "#{Settings.exception_notifer.email_prefix}",
    :sender_address => "#{Settings.exception_notifer.sender_address}",
    :exception_recipients =>  "#{Settings.exception_notifer.exception_recipients}"
      
  
end