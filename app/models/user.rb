class User < ApplicationRecord
  # before_action :authenticate_user!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wishlists
  has_many :listings, dependent: :destroy
  has_many :bookmarks, through: :listings
  has_many :reservations

  # validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  # validates :phone_number, presence: true, uniqueness: true
end
