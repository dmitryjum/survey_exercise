class ResponsesController < ApplicationController
  include ActionView::RecordIdentifier
  def create
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.build(response_params)

    respond_to do |format|
      if @response.save
        format.turbo_stream
        format.html { redirect_to root_path }
      else
        format.html { redirect_to root_path, alert: "Failed to save response." }
      end
    end
  end

  private

  def response_params
    params.permit(:answer)
  end
end
