# frozen_string_literal: true

class SurveyRowComponent < ViewComponent::Base
  def initialize(survey:)
    @survey = survey
  end

  def stats
    @survey.stats
  end
end
