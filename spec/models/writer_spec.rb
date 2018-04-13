require 'rails_helper'

RSpec.describe Writer, :type => :model  do

    before{@writer = Writer.new(name: 'test', email: 'test@ll.com', password: '12345678',
                                                    password_confirmation: '12345678')}
    describe "Validations" do 
      context "A new Writer" do
        it "is valid with valid attributes" do
            expect(@writer).to be_valid
        end
        it "is not valid with wrong email" do
            @writer.email = 'llllllll'
            expect(@writer).to_not be_valid
        end
        it "should not be valid without a password" do
            @writer.password = nil
            @writer.should_not be_valid
        end
    
          it "should be not be valid with a short password" do
            @writer.password = 'short'
            @writer.should_not be_valid
        end
    
          it "should not be valid with a confirmation mismatch" do
            @writer.attributes ={  password: 'short', password_confirmation: 'long' }
            @writer.should_not be_valid
        end
    
        it "is not valid with a too long password" do
            @writer.password = '111111111111111111111111111111111111111111111111111111'
            expect(@writer).to_not be_valid
        end
        it "is not valid if password is empty" do
            @writer.password =  ' '
            expect(@writer).to_not be_valid           
        end
        it "is not valid if name is empty" do
            @writer.name = ""
            expect(@writer).to_not be_valid           
        end
        it "is not valid if the email is not unique" do 
            @writer.save
            writer2 = Writer.new(name: 'test', email: 'tEsT@lL.Com', password: '12345678')     
            expect(writer2).to_not be_valid    
        end
     end  
    end  
end