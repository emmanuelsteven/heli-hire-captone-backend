class Helicopter < ApplicationRecord
	has_many :reservations, dependent: :destroy
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :description, :contact, :price, :carriage_capacity, :model, :image, presence: true
end
