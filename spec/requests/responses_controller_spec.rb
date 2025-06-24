require "rails_helper"

RSpec.describe "ResponsesController", type: :request do
  include ActionView::RecordIdentifier
  describe "POST /surveys/:survey_id/responses" do
    let!(:survey) { Survey.create!(question: "Q?") }

    context "with valid params" do
      it "creates a response and updates the survey row and stats" do
        expect {
          post survey_responses_path(survey), params: { answer: "yes" }, headers: { "ACCEPT" => "text/vnd.turbo-stream.html" }
        }.to change(Response, :count).by(1)
        expect(response.body).to include("turbo-stream")
        expect(response.body).to include(dom_id(survey))
        expect(response.body).to include("survey_stats")
      end
    end

    context "with invalid params" do
      it "renders the answer form with errors" do
        post survey_responses_path(survey), params: { answer: "" }, headers: { "ACCEPT" => "text/vnd.turbo-stream.html" }
        expect(response).to have_http_status(:not_acceptable)
      end
    end
  end
end
