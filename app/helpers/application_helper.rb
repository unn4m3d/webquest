module ApplicationHelper

  def surveys
    Survey::Survey.all
  end
end
