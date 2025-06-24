class SurveysController < ApplicationController
  include ActionView::RecordIdentifier

  def index
    @surveys = Survey.includes(:responses).order(created_at: :desc)
    @surveys_count = @surveys.count
    @response_count = Response.count
  end

  def create
    @survey = Survey.build(survey_params)
    @previous_count = Survey.count
    respond_to do |format|
      if @survey.save
        format.turbo_stream
        format.html { redirect_to root_path }
      else
        format.html { redirect_to root_path, alert: "Failed to create survey. Errors: #{@survey.errors.full_message}" }
      end
    end
  end

  def answer
    @survey = Survey.find(params[:id])
    render turbo_stream: turbo_stream.replace(dom_id(@survey),
     AnswerFormComponent.new(survey: @survey))
  end

  private

  def survey_params
    params.require(:survey).permit(:question)
  end
end
