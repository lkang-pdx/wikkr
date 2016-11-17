class Wiki < ApplicationRecord
  belongs_to :user
  resourcify
end
