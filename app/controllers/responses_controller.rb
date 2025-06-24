class ResponsesController < ApplicationController
  include ActionView::RecordIdentifier
  
  def create
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.create!(answer: params[:answer])
    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: turbo_stream.replace(
          dom_id(@survey), SurveyRowComponent.new(survey: @survey)
        )
      }
      format.html { redirect_to root_path }
    end
  end
end
