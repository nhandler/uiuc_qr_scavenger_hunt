class AvailableCode < ActiveRecord::Base
  validates :user, :presence => true
  validates :code, :presence => true

  validates_uniqueness_of :code_id, scope: :user_id
end
