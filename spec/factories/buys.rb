FactoryBot.define do
  factory :buy_address do
    postal_code             {'111-1111'}
    state_id                { 2 }
    city                    { '板橋区' }
    street                  { '板橋1-1-1' }
    building_name           { 'あ' }
    phone                   { '00000000000'}
    token                   {"to_test_abcd00000000000000000000"}
  end
end
