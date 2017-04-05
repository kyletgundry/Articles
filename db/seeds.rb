100.times do
  Article.create(
    title: Faker::App.name,
    author: Faker::Name.name,
    date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
    description: Faker::Lorem.paragraph
    )
end

puts "Done!"