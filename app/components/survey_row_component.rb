# frozen_string_literal: true

class SurveyRowComponent < ViewComponent::Base
  with_collection_parameter :survey
  # attr_reader :stats, :response_count
  def initialize(survey:)
    @survey = survey
  end

  def stats
    @survey.stats
  end

  def response_count
    @survey.responses.count
  end
end
