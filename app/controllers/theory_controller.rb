class TheoryController < ApplicationController
  def index
    @pages = TheoryHelper.pages
  end

  def show
    render "theory/pages/#{params[:page]}"
  end
end
