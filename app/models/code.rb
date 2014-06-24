class Code < ActiveRecord::Base
  require 'securerandom'
  def new_secret
    secret = SecureRandom.hex(30)
    self.update(secret: secret)
    secret
  end

  def url
    "http://localhost:3000/register_code?secret=#{secret}"
  end
end
