class Breeder < ApplicationRecord
  belongs_to :pet

  has_many :reviews
end
