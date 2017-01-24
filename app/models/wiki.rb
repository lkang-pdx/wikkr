require 'elasticsearch/model'

class Wiki < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  has_many :collaborators
  resourcify

  scope :visible_to, -> (user) { user ? all : where(private: false) }

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'body']
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            title: {},
            body: {}
          }
        }
      }
    )
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english', index_options: 'offsets'
      indexes :body, analyzer: 'english'
    end
  end
end
Wiki.__elasticsearch__.client.indices.delete index: Wiki.index_name rescue nil

Wiki.__elasticsearch__.client.indices.create \
index: Wiki.index_name,
body: { settings: Wiki.settings.to_hash, mappings: Wiki.mappings.to_hash }
Wiki.import
