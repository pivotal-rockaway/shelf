class Recommendation < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
end