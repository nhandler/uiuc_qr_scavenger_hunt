class User < ActiveRecord::Base
  has_and_belongs_to_many :found_codes, :join_table => "found_codes", :class_name => "Code"
  has_and_belongs_to_many :available_codes, :join_table => "available_codes", :class_name => "Code"

  def self.leaders
    select("users.*, count(code_id) AS found_codes_count").
    joins(:found_codes).
    group("users.id").
    order("found_codes_count DESC")
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
