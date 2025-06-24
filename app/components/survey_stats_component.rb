class SurveyStatsComponent < ViewComponent::Base
  def initialize(surveys_count:, response_count:)
    @surveys_count = surveys_count
    @response_count = response_count
  end

  def show?
    @surveys_count.positive?
  end

  def survey_count_label
    "#{@surveys_count} #{'survey'.pluralize(@surveys_count)}"
  end
end