class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :state
  belongs_to :freight
  belongs_to :due_date

  belongs_to :user
  has_one :buy
  has_many_attached :images

  # validates :price, inclusion: { in: 300..9999999 } 下記の別の記述方法
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :product, :product_description, :price, presence: true
  validates :category_id, :product_status_id, :state_id, :freight_id, :due_date_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :images, presence: true
end
