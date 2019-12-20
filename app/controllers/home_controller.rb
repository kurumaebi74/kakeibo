class HomeController < ApplicationController
  require "date"
  def index
    @posts = Post.all.order(date: :desc)
    @today = Date.today
    @all_value = 0
  end

  def past
    @posts = Post.all.order(date: :desc)
    @today = Date.today
    @all_value = 0
  end
end
