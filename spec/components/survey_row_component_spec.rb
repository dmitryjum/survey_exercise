require "rails_helper"

RSpec.describe SurveyRowComponent, type: :component do
  let(:survey) { Survey.create!(question: "Is this a test?") }

  describe "#stats" do
    it "returns the survey stats hash" do
      # Simulate some responses
      survey.responses.create!(answer: "yes")
      survey.responses.create!(answer: "no")
      component = described_class.new(survey: survey)
      expect(component.stats).to be_a(Hash)
      expect(component.stats.keys).to include(:yes, :no)
      expect(component.stats[:yes] + component.stats[:no]).to eq(100)
    end
  end

  describe "#response_count" do
    it "returns the number of responses for the survey" do
      expect {
        survey.responses.create!(answer: "yes")
        survey.responses.create!(answer: "no")
      }.to change { described_class.new(survey: survey).response_count }.from(0).to(2)
    end
  end

  it "renders the survey question and stats" do
    survey.responses.create!(answer: "yes")
    survey.responses.create!(answer: "no")
    render_inline(described_class.new(survey: survey))
    expect(page).to have_text("Is this a test?")
    expect(page).to have_text("Yes:")
    expect(page).to have_text("No:")
    expect(page).to have_text("responses")
    expect(page).to have_css("h3", text: "Click me to answer")
  end
end
