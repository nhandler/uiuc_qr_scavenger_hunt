class Code < ActiveRecord::Base
  require 'securerandom'
  validates_presence_of :name, :clue, :location, :specific_location, :alum, :secret, :on => :update
  validates :secret, format: { with: /\A[0-9a-f]{60}\z/ }

  has_and_belongs_to_many :found_by_users, :class_name => "User", :join_table => "found_codes"

  def initialize(attributes = {})
    super
    self.secret = new_secret
  end

  def new_secret
    secret = SecureRandom.hex(30)
    secret
  end

  def url
    "http://localhost:3000/register_code/#{secret}"
  end
end
