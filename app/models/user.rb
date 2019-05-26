class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  attr_accessor :name, :email, :remember_me, :profile_attributes
  has_one :profile
  accepts_nested_attributes_for :profile

  # has_many :posts, dependent: :destroy
  # has_many :likes, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_one :timeline, dependent: :destroy
  #
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # # validates :timeline_id
  #
  # private
  #
  #   def capitalize_names
  #     self.first_name = first_name.capitalize
  #     self.last_name = last_name.capitalize
  #   end
  end
