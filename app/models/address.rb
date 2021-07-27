class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state

  belongs_to :buy

  validates :postal_code, :city, :street, :phone, presence: true
  validates :state_id,numericality: { other_than: 1, message: "can't be blank" }
end
