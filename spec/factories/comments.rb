FactoryBot.define do
  factory :comment do
    comment { "Hallo to all!" }
    message
    user 
  end
end
