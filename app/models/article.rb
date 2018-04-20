class Article < ApplicationRecord
  before_create :set_slug

  belongs_to :writer  

  validates :title, length: { minimum: 10, maximum: 100 }, presence: true
  validates :body, length: { minimum: 500, maximum: 10000 }, presence: true
  validates :writer_id, presence: true



  # Overide Rails default to_param method
  def to_param
    "#{id}-#{slug}"
  end


  private
  
  def set_slug
    self.slug = title.parameterize
  end
  
end
