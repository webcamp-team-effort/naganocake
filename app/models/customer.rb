class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid
  ransacker :full_name do |parent|
  Arel::Nodes::InfixOperation.new('||',
    parent.table[:last_name], parent.table[:first_name])
end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: {conditions: ->{with_deleted}}
  validates :encrypted_password, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_kana_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_kana_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :postcode, presence: true, length: {is: 7}, numericality: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: { in: 8..15 }, numericality: true
end
