class TheoryController < ApplicationController
  def index
  end

  def show
    render params[:page]
  end
end
