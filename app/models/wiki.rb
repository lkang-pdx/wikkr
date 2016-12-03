class Wiki < ApplicationRecord
  belongs_to :user
  resourcify

  scope :visible_to, -> (user) { user ? all : where(private: false) }
end
