require 'rails_helper'

RSpec.describe Article, type: :model do
	describe 'Validations' do 
		it { should validate_length_of(:title).is_at_least(10).is_at_most(100)  }
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:body) }
		it { should validate_length_of(:body).is_at_least(600).is_at_most(10000) }

		it { should validate_presence_of(:writer_id) }
	end
	describe 'Association' do 
		it { should belong_to(:writer) }
	end
end
