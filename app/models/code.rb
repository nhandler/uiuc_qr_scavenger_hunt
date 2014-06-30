class Code < ActiveRecord::Base
  #after_initialize :ensure_secret, if: 'new_record?'
  #before_filter :ensure_secret, :only => :create
  require 'securerandom'

  def ensure_secret
    self.secret ||= new_secret
  end

  def new_secret
    secret = SecureRandom.hex(30)
    self.update(secret: secret)
    secret
  end

  def url
    "http://localhost:3000/register_code?secret=#{secret}"
  end
end
