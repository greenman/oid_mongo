# Load the rails application
require "openid/fetchers"
require File.expand_path('../application', __FILE__)
OpenID.fetcher.ca_file = "#{Rails.root}/config/ca-bundle.crt" 
# Initialize the rails application
OidMongo::Application.initialize!
