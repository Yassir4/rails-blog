class Article < ApplicationRecord
  belongs_to :writer  
  scope :of_followed_writers, -> (following_writers) { where writer_id: following_writers }
  after_validation :set_slug, only: [:create, :update]
  
  validates :title, length: { minimum: 10, maximum: 100 }, presence: true
  validates :body, length: { minimum: 500, maximum: 10000 }, presence: true
  validates :writer_id, presence: true


  # Override Rails default to_param method
  def to_param
    "#{id}-#{slug}"
  end

  private  

  def set_slug
    self.slug = title.to_s.parameterize
  end
  
end
