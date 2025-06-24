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
        format.html { redirect_to root_path, notice: "Survey created." }
      else
        format.turbo_stream { render partial: "form", status: :unprocessable_entity }
        format.html { render :index, status: :unprocessable_entity }
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
