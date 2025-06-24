class Survey < ApplicationRecord
  has_many :responses, dependent: :destroy
  validates_presence_of :question

  def stats
    counts = responses.group(:answer).count
    total = counts.values.sum
    return { yes: 0, no: 0 } if total.zero?
    yes = counts["yes"] || 0
    no = counts["no"] || 0
    { yes: (yes * 100.0 / total).round,
      no:  (no  * 100.0 / total).round }
  end
end
