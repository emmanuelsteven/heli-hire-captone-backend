class User < ApplicationRecord
  has_many :reservations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
