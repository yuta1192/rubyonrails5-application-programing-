class Author < ApplicationRecord
  has_many :comments, -> { where(deleted: false) }, class_name: 'FanComment',
    foreign_key: 'author_no'
  belongs_to :user
  has_and_belongs_to_many :book
  has_many :memos, as: :memoable
end
