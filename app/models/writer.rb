class Writer < ApplicationRecord
    before_validation :downcase_email
    validates :email, :uniqueness => { :case_sensitive => false }
    validates_presence_of :name , :email 
    validates_email_format_of :email
    has_secure_password
    validates :password, length: { minimum: 8, maximum: 15} 
    validates :name, length: { minimum: 2, maximum: 30}
  
  
  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
  

end
