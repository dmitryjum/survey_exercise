class Response < ApplicationRecord
  belongs_to :survey

  enum answer, { no: 0, yes: 1 }, _prefix: true
end
