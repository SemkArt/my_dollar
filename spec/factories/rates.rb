FactoryBot.define do
  factory :forced_rate, class: 'Rates::Forced' do
    forced_to  { 2.days.from_now }
    value      { rand(50..100) }
  end

  factory :original_rate, class: 'Rates::Original' do
    value      { rand(50..100) }
  end
end
