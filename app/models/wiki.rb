class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  resourcify

  scope :visible_to, -> (user) { user ? all : where(private: false) }
end
