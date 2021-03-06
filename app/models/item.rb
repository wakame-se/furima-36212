class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width numbers.' }
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is out of setting range' }
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :days_to_ship
end
