class Response < ApplicationRecord
  belongs_to :survey
  belongs_to :answer
  # enum answer: [ :no, :yes ], _prefix: true
  # validates :answer, presence: true, inclusion: { in: answers.keys }
end
