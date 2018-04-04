FactoryGirl.define do
    factory :writer do |f|
      f.name "yassir"
      f.email "example@gmail.com"
      f.password "12345678"
      f.password_confirmation '12345678'
    end
end    