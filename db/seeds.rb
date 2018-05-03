# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
writer = Writer.create(name: 'Hartani Yassir', email: 'hartaniyassir@gmail.com',
                        password: '12345678', admin: true, active: true)


# create writers
for i in 0..50 do
    Writer.create!(name: "userName#{i}", email: "email@example#{i}.com",
                        password: "12345678", active: true)
end
# create article for the admin
for i in 0..10 do 
    writer =  Writer.find(1)
    article = Article.new(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(90) )
    writer.articles << article
end

# create article for other writers
for i in 1..50 do
    writer =  Writer.find(i)
    for j in 1..5
        article = Article.new(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(90) )
        writer.articles << article
    end
end

# create relationships between writers
for i in 1..30
    following_writer = Writer.find(i)
    for j in 1..30
        if i != j
            follwer_writer = Writer.find(j)
            following_writer.follow(follwer_writer.id)
        end    
    end
end
    
