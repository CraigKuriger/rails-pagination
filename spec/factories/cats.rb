FactoryBot.define do
  factory :cat do
    name { Faker::Creature::Cat.name }
    breed { Faker::Creature::Cat.breed }
    registry { Faker::Creature::Cat.registry }
  end
end
