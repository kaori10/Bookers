class List < ApplicationRecord::Base
  validates :title, presence: true
  validates :body, presence: true
end
