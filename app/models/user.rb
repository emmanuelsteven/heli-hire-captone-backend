class User < ApplicationRecord
  has_many :reservation
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
