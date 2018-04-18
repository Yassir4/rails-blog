# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
writer = Writer.create(name: 'Hartani Yassir', email: 'hartaniyassir@gmail.com',
                        password: '12345678', admin: true)


for i in 0..50 do
    Writer.create!(name: "userName#{i}", email: "email@example#{i}.com", 
                        password: "12345678")                    
end
for i in 0..10 do 
    writer =  Writer.find(1)
    article = Article.new(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(90) )
    writer.articles << article
end
for i in 1..20 do 
   writer =  Writer.find(i)
   article = Article.new(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(90) )
   writer.articles << article

end

