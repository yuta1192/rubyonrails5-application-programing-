class SearchKeyword
  include ActionModell::Model

  attr_accessor :keyword

  validates :keyword, presence: true
end
