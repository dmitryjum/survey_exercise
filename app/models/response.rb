class Response < ApplicationRecord
  belongs_to :survey

  enum answer: [ :no, :yes ], _prefix: true
end
