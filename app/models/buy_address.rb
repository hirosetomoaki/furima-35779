class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :state_id, :city, :street, :building_name, :phone, :user_id, :item_id, :token

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :phone, presence: true, format: { with: /\A\d{10,11}\z/}

  validates :state_id,numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true do
    validates :city
    validates :street
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    Address.create(postal_code: postal_code,city: city,street: street,phone: phone,state_id: state_id)
    Buy.create(user_id: user_id,item_id: item_id)
  end

end