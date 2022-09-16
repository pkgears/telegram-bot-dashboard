FactoryBot.define do
  factory :chat do
    chat_id { 12345 }
    name { "Test Chat" }
    chat_type { "Test" }

    trait :group do
      chat_type { "group" }
    end

    trait :private do
      chat_type { "private" }
    end
  end
end
