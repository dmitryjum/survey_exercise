class Answer < ApplicationRecord
  belongs_to :survey
  has_many :responses, dependent: :destroy
  validates :text, presence: true
end
