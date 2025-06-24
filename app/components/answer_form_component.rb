# frozen_string_literal: true

class AnswerFormComponent < ViewComponent::Base
  def initialize(survey:)
    @survey = survey
  end
end
