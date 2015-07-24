# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 kinds = ["Presentations", "Notes", "Assignment", "Self-marking", "Instructor-marking", "Gitcast", "Gist"]

  kinds.each do |kind|
    Kind.create(title: kind)
  end

  10.times do
    title = Faker::Company.catch_phrase
    body = "#{Faker::Company.bs}#{Faker::Company.bs}#{Faker::Company.bs}"
    CourseUnit.create({title: title, body: body})
  end

  100.times do
    kind_id = [1, 2, 3, 4, 5, 6, 7]
    unit_id = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    title = Faker::Company.catch_phrase
    content = "#{Faker::Company.bs}#{Faker::Company.bs}#{Faker::Company.bs}"
    CourseResource.create({title: title, content: content, kind_id: kind_id.sample, course_unit_id: unit_id.sample})
  end
