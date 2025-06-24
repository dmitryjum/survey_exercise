class SurveysController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_survey, only: %i[ update destroy answer]

  def index
    @surveys = Survey.includes(:responses).order(created_at: :desc)
  end

  def create
    @survey = Survey.new(survey_params)

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
    render turbo_stream: turbo_stream.replace(dom_id(@survey),
     AnswerFormComponent.new(survey: @survey))
  end

  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: "Survey was successfully updated." }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @survey.destroy!

    respond_to do |format|
      format.html { redirect_to surveys_path, status: :see_other, notice: "Survey was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit(:question)
    end
end
