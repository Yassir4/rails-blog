class Writer < ApplicationRecord
  has_many :articles, dependent: :destroy

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Relationship'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Relationship'
  has_many :following, through: :following_relationships, source: :following
 
  before_validation :downcase_email
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :name, presence: true, length: { minimum: 2, maximum: 30}
  validates_email_format_of :email
  has_secure_password
  validates :password, length: { minimum: 8, maximum: 15} 
   

  def follow(writer_id)
    following_relationships.create(following_id: writer_id)
  end
  
  def unfollow(writer_id)
    following_relationships.find_by(following_id: writer_id).destroy
  end  


  class << self
    def new_remember_token
      SecureRandom.urlsafe_base64
    end
  
    def encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end
  end

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
  
  def create_remember_token
    self.remember_token = encrypt(Writer.new_remember_token)
  end
  
  
end
