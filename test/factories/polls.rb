FactoryBot.define do
  factory :poll do
    user { nil }
    omdb_item { nil }
    note { 1 }
    comment { "MyText" }
  end
end
