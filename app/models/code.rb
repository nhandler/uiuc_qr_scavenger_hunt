class Code < ActiveRecord::Base
  require 'securerandom'
  validates_presence_of :name, :clue, :location, :specific_location, :alum, :secret, :on => :update
  validates :secret, format: { with: /\A[0-9a-f]{60}\z/ }

  def initialize(attributes = {})
    puts "Initialize Called"
    super
    self.secret = new_secret
  end

  def new_secret
    puts "New Secret Called"
    secret = SecureRandom.hex(30)
    #self.update(secret: secret)
    secret
  end

  def url
    "http://localhost:3000/register_code/#{secret}"
  end
end
