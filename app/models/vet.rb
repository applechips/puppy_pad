class Vet < ApplicationRecord
  belongs_to :pet

  has_many :pets

  has_many :reviews

end
