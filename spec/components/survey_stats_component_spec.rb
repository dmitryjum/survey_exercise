require "rails_helper"

RSpec.describe SurveyStatsComponent, type: :component do
  it "renders stats when there are surveys" do
    render_inline(described_class.new(surveys_count: 2, response_count: 5))
    expect(page).to have_text("2 surveys")
    expect(page).to have_text("5 total responses")
  end

  it "does not render stats when there are no surveys" do
    render_inline(described_class.new(surveys_count: 0, response_count: 0))
    expect(page).not_to have_text("survey")
    expect(page).not_to have_text("responses")
  end

  describe "#show?" do
    it "returns true when surveys_count is positive" do
      component = described_class.new(surveys_count: 1, response_count: 0)
      expect(component.show?).to be true
    end

    it "returns false when surveys_count is zero" do
      component = described_class.new(surveys_count: 0, response_count: 0)
      expect(component.show?).to be false
    end
  end

  describe "#survey_count_label" do
    it "returns singular when count is 1" do
      component = described_class.new(surveys_count: 1, response_count: 0)
      expect(component.survey_count_label).to eq("1 survey")
    end

    it "returns plural when count is greater than 1" do
      component = described_class.new(surveys_count: 3, response_count: 0)
      expect(component.survey_count_label).to eq("3 surveys")
    end
  end
end
