require 'rubygems'
require 'json'
require 'uri'
require 'net/http'
class Openid

class << self
  def create_user(params)
    data = set_creation_data(params)
    create_url = "http://sgoid-dev.sgns.net/api/v1/users/"
    p "accessing openid****************** "
    res = access_openid(create_url, data)
    p "Response send by open id user creation************** "
    user = JSON.parse(res.body)
  end

  def set_creation_data(params)
    data = {'user[email]' => params[:email],
    'user[company_name]' => params[:company_name],
    'user[company_guid]' => params[:company_guid],
    'firstname' => params[:first_name],
    'lastname' => params[:last_name],
    'nickname' => params[:nickname],
    'auth_token' => "zpzRTD5ajwrPUHZYAsy2" }
    p data
  end

  def openid_confirm(user)
    confirmation_url = "http://sgoid-dev.sgns.net/api/v1/users/confirmation"
    data = set_confirmation_data(user)
    res = access_openid(confirmation_url, data)
    json_res = JSON.parse(res.body)
    p "Response send by open id confirmation******************"
    p json_res
  end

  def access_openid(site_url, data)
    uri = URI.parse(site_url)
    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data(data)
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
    res
  end

  def set_confirmation_data(user)
    data = {'user[password]' => "Password123$",
    'user[password_confirmation]' => "Password123$",
    'user[confirmation_token]' => user["user"]["confirmation_token"],
    'format'=> 'json',
    'auth_token' => "zpzRTD5ajwrPUHZYAsy2"
    }
    data
  end
end

end
#params = { :email => 'sandipmondal85@gmail.com', :company_name => 'sungard',
 #  :company_guid => '122222222222', :first_name => 'sandip', :last_name => 'mondal',
  #  :nickname => 'babu' }
