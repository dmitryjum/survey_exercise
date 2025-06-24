require "rails_helper"

RSpec.describe "SurveysController", type: :request do
  describe "GET /surveys" do
    it "renders the index" do
      get surveys_path
      expect(response).to be_successful
      expect(response.body).to include("Surveys")
    end
  end

  describe "POST /surveys" do
    context "with valid params" do
      it "creates a survey and responds with turbo_stream" do
        expect {
          post surveys_path, params: { survey: { question: "Test?" } }, headers: { "ACCEPT" => "text/vnd.turbo-stream.html" }
        }.to change(Survey, :count).by(1)
        expect(response.media_type).to eq("text/vnd.turbo-stream.html")
        expect(response.body).to include("turbo-stream")
      end
    end

    context "with invalid params" do
      it "renders the form with errors" do
        post surveys_path, params: { survey: { question: "" } }, headers: { "ACCEPT" => "text/vnd.turbo-stream.html" }
        expect(response).to have_http_status(:not_acceptable)
      end
    end
  end

  describe "GET /surveys/:id/answer" do
    it "renders the answer form as turbo_stream" do
      survey = Survey.create!(question: "Q?")
      get answer_survey_path(survey), headers: { "ACCEPT" => "text/vnd.turbo-stream.html" }
      expect(response.body).to include("form")
      expect(response.body).to include("turbo-stream")
      expect(response.body).to include("Yes")
      expect(response.body).to include("No")
    end
  end
end
