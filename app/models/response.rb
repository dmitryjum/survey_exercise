class Response < ApplicationRecord
  belongs_to :survey
  enum answer: [ :no, :yes ], _prefix: true
  validates :answer, presence: true, inclusion: { in: answers.keys }
end
