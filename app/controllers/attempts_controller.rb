class AttemptsController < ApplicationController
  before_action :load_survey, only: [:new, :create]
  before_action :authenticate_user!

  def index
    @surveys = Survey::Survey.active
  end

  def show
    @attempt = Survey::Attempt.find_by(id: params[:id])
    render :access_error if current_user.id != @attempt.participant_id
  end

  def new
    @participant = current_user

    unless @survey.nil?
      @attempt = @survey.attempts.new
      @attempt.answers.build
    end
  end

  def create
    ps = params_whitelist
    ps[:answers_attributes] = ps[:answers_attributes].to_h.map { |attrs| { question_id: attrs.first, option_id: attrs.last } }
    @attempt = @survey.attempts.new(ps)
    @attempt.participant = current_user
    if @attempt.valid? && @attempt.save
      correct_options_text = @survey.correct_options.present? ? 'Bellow are the correct answers marked in green' : ''
      redirect_to attempt_path(@attempt.id), notice: "Thank you for answering #{@survey.name}! #{correct_options_text}"
    else
      build_flash(@attempt)
      @participant = current_user
      render :new
    end
  end

  private

  def load_survey
    @survey = Survey::Survey.find_by(id: params[:survey_id])
  end

  def params_whitelist
    if params[:survey_attempt]
      # params[:survey_attempt][:answers_attributes] = params.require(:survey_attempt).permit(:answers_attributes)[:answers_attributes].to_h.map { |attrs| { question_id: attrs.first, option_id: attrs.last } }
      ps = params.require(:survey_attempt).permit(Survey::Attempt::AccessibleAttributes, answers_attributes: {} )
    end
  end
end
