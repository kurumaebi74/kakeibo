class PostController < ApplicationController
  require "date"
  def new
    @today = Date.today
  end

  def create
    @posts = Post.new(content: params[:content],value: params[:value],other: params[:other],date: params[:date])
    @posts.save
    if @posts.save
      redirect_to("/")
    else
      render("post/new")
    end
  end

  def edit
    @posts = Post.find_by(id: params[:id])
  end

  def update
    @posts = Post.find_by(id: params[:id])
    @posts.content = params[:content]
    @posts.value = params[:value]
    @posts.other = params[:other]
    @posts.date = params[:date]
    @posts.save
    redirect_to("/")
  end

  def destroy
    @posts = Post.find_by(id: params[:id])
    @posts.destroy
    redirect_to("/")
  end
end
