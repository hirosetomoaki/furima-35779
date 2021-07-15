FactoryBot.define do
  factory :item do
    product               { 'あ' }
    product_description   { 'きれい' }
    category_id              { 2 }
    product_status_id        { 2 }
    price                 { 300 }
    state_id                 { 2 }
    freight_id               { 2 }
    due_date_id              { 2 }

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/DSC_0305.JPG'), filename: 'DSC_0305.JPG')
    end
  end
end
