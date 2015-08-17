# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories_list = [
  ["Sativa", "sativa"],
  ["Indica", "indica"],
  ["Hybrid", "hybrid"]
]

flavors_list = [
  "ammonia",
  "apple",
  "apricot",
  "berry",
  "bluecheese",
  "blueberry",
  "butter",
  "cheese",
  "chemical",
  "chestnut",
  "citrus",
  "coffee",
  "diesel",
  "earthy",
  "flowery",
  "grape",
  "grapefruit",
  "honey",
  "lavender",
  "lemon",
  "lime",
  "mango",
  "menthol",
  "mint",
  "minty",
  "nutty",
  "orange",
  "peach",
  "pear",
  "pepper",
  "pine",
  "pineapple",
  "plum",
  "pungent",
  "rose",
  "sage",
  "skunk",
  "spicyherbal",
  "strawberry",
  "sweet",
  "tar",
  "tea",
  "tobacco",
  "treefruit",
  "tropical",
  "vanilla",
  "violet",
  "woody"
]

conditions_list = [
  "addadhd",
  "alzheimers",
  "anorexia",
  "anxiety",
  "arthritis",
  "asthma",
  "bipolardisorder",
  "cachexia",
  "cancer",
  "crohnsdisease",
  "epilepsy",
  "fibromyalgia",
  "gastrointestinaldisorder",
  "glaucoma",
  "hivaids",
  "hypertension",
  "migraines",
  "multiplesclerosis",
  "musculardystrophy",
  "parkinsons",
  "phantomlimbpain",
  "pms",
  "ptsd",
  "spinalcordinjury",
  "tinnitus",
  "tourettessyndrome"
]

effects_list = [
  "anxious",
  "aroused",
  "creative",
  "dizzy",
  "dryeyes",
  "drymouth",
  "energetic",
  "euphoric",
  "focused",
  "giggly",
  "happy",
  "hungry",
  "paranoid",
  "relaxed",
  "sleepy",
  "talkative",
  "tingly",
  "uplifted"
]

symptoms_list = [
  "cramps",
  "depression",
  "eyepressure",
  "fatigue",
  "headaches",
  "inflammation",
  "insomnia",
  "lackofappetite",
  "musclespasms",
  "nausea",
  "pain",
  "seizures",
  "spasticity",
  "stress"
]

categories_list.each do |name, slug|
  Category.create(name: name, slug: slug)
end

flavors_list.each do |name|
  Flavor.create(name: name)
end

conditions_list.each do |name|
  Condition.create(name: name)
end

symptoms_list.each do |name|
  Symptom.create(name: name)
end

effects_list.each do |name|
  Effect.create(name: name)
end