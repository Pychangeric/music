class Payment < ActiveRecord::Base
    belongs_to :user
  
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :card_name, presence: true
    validates :country, presence: true
    validates :card_number, presence: true, numericality: { only_integer: true }
  end
  