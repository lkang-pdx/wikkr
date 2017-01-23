require 'elasticsearch/model'

class Wiki < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  has_many :collaborators
  resourcify

  scope :visible_to, -> (user) { user ? all : where(private: false) }
end
