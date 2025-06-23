# frozen_string_literal: true

class SurveyRowComponent < ViewComponent::Base
  with_collection_parameter :survey
  def initialize(survey:)
    @survey = survey
  end

  def stats
    @survey.stats
  end
end
