class Product < ActiveRecord::Base

  belongs_to :user
  has_many :bids

  validates :user, presence: true


end
