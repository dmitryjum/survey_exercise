require "rails_helper"

RSpec.describe AnswerFormComponent, type: :component do
  it "renders the answer form for a survey" do
    survey = Survey.create!(question: "Is this a test?")
    render_inline(described_class.new(survey: survey))
    expect(page).to have_text("Is this a test?")
    expect(page).to have_button("Yes")
    expect(page).to have_button("No")
    expect(page).to have_selector("form")
  end
end
