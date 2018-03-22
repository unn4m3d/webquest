class TheoryController < ApplicationController
  def index
    @pages = TheoryHelper.pages
  end

  def show
    prv = params[:page].to_i - 1
    nxt = params[:page].to_i + 1

    if prv > 0
      @previous = prv
    else
      @previous = nil
    end

    if TheoryHelper.pages.include? nxt.to_s
      @next = nxt
    else
      @next = nil
    end

    render "theory/pages/#{params[:page]}"
  end
end
