# Be sure to restart your server when you modify this file.

Myapp::Application.config.session_store :cookie_store, key: '_myapp_session', :domain => "lvh.me"

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Myapp::Application.config.session_store :active_record_store
#Rails.application.config.session_store :cookie_store, :key => '_accounts_session', :domain => :all
#
## change top level domain size
##request.domain(2)
##request.subdomain(2)
# Rails.application.config.session_store :cookie_store, :key => '_accounts_session', :domain => "example.co.uk"