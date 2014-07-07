class FoundCode < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :code_id, :presence => true

  validates_uniqueness_of :code_id, scope: :user_id
end
