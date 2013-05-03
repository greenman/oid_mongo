require 'openid/store/filesystem'
#require "openid/fetchers"
#OpenID.fetcher.ca_file = "#{Rails.root}/config/ca-bundle.crt"
OpenID::Store::Filesystem.new("#{Rails.root}/tmp")