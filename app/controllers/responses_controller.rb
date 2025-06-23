class ResponsesController < ApplicationController
  def create
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.create!(answer: params[:answer])
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end
end
