class Item < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true

  belongs_to :user
end
