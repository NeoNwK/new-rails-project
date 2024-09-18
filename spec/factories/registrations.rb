FactoryBot.define do
  factory :registration do
    first_name { "John" }
    last_name { "Doe" }
    birthday { Date.new(2000, 1, 1) }
    gender { "Male" }
    email { "john@example.com" }
    phone { "1234567890" }
    subject { "Math" }
  end
end
