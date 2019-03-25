class User < ApplicationRecord
  has_many :reviews
  has_many :books, through: :reviews
  validates :agreement, acceptance: { on: :create }
  validates :email, presence: { unless: 'dm.blank?' }
  with_options unless: 'dm.blank?' do |dm|
    dm.validates :email, presence: true
    dm.validates :roles, presence: true
  end
end
