class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :area_id, :city, :street, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid"}
    validates :token
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, area_id: area_id, city: city, street: street, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end