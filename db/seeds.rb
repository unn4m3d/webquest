# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

json = JSON.parse File.read("#{__dir__}/../surveys.json")

json["surveys"].each do |survey|
  sur = Survey::Survey.create(name: survey["name"], description: survey["desc"])

  survey["questions"].each do |question|
    qst = Survey::Question.create(survey: sur, text: question["text"])

    question["options"].each do |answer|
      Survey::Option.create(question: qst, text: answer["text"], correct: answer["correct"] || false)
    end
  end
end
