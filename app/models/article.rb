class Article < ApplicationRecord
  belongs_to :writer  

  validates :title, length: { minimum: 10, maximum: 100 }, presence: true
  validates :body, length: { minimum: 600, maximum: 10000 }, presence: true
  validates :writer_id, presence: true
end
