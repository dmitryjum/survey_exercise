require "rails_helper"

RSpec.describe "Surveys", type: :system do
  it "user creates a survey and sees it appear without reload" do
    visit surveys_path
    fill_in "Type your question…", with: "Is this a test?"
    click_button "Save"
    expect(page).to have_content("Is this a test?")
    expect(page).to have_content("1 survey")
  end

  it "user answers a survey and sees stats update" do
    survey = Survey.create!(question: "Q?")
    visit surveys_path
    # Find the survey row and click it
    find("[id^='survey_#{survey.id}']").click
    click_button "Yes"
    expect(page).to have_content("Yes: 100%")
    expect(page).to have_content("1 responses")
  end

  it "shows empty state and transitions to list" do
    visit surveys_path
    expect(page).to have_content("No surveys yet")
    fill_in "Type your question…", with: "First?"
    click_button "Save"
    expect(page).not_to have_content("No surveys yet")
    expect(page).to have_content("First?")
  end
end
