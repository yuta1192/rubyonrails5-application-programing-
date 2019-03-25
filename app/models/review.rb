class Review < ApplicationRecord
  enum status: { draft:0, published:1, deleted:2 }
  belongs_to :book
  belongs_to :user, counter_cache: true
  default_scope { order(updated_at: :desc) }
end
