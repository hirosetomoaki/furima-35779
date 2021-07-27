FactoryBot.define do
  factory :buy_address do
    postal_code             {'111-1111'}
    state_id                { 2 }
    city                    { '板橋区' }
    street                  { '板橋1-1-1' }
    phone                   { '00000000000'}

  end
end
