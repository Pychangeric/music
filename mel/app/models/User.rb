class User < ActiveRecord::Base
    has_many :notes, dependent: :destroy
    has_many :payments, dependent: :destroy
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  end
  