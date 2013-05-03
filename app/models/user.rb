class User
  include MongoMapper::Document

  key :nickname, String
  key :password, String
  key :email, String
  key :first_name, String
  key :last_name, String
  key :identifier_url, String
  timestamps!
end
