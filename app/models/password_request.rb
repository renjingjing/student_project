class PasswordRequest < ActiveRecord::Base

  has_secure_token
  
end
