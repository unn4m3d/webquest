module AttemptsHelper

  def get_answer_fields attempt
    attempt.survey.questions.map { |q| Survey::Answer.new(question_id: q.id) }
  end

  def the_chosen_one? answer, option
    if answer.option_id == option.id then 'chosen' else nil end
  end

  def get_color_of_option answer, option
    if option.correct
      'bg-success'
    elsif the_chosen_one?(answer, option)
      'bg-danger'
    end
  end

  def get_weight_html_class option
    return 'bg-warning' if option.weight == 0
    option.weight > 0 ? 'bg-success' : 'bg-danger'
  end

  def is_score? something
    something == 1 || something == 'score'
  end

  def is_quiz? something
    something == 0 || something == 'quiz'
  end

  def task_for_question(question)
    Task.where(question_id: question.id).first
  end
end
