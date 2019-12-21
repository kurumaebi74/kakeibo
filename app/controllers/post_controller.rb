class PostController < ApplicationController
  require "date"
  def new
    @today = Date.today
    @categorys = Category.all
    @posts = Post.new
  end

  def create
    @posts = Post.new(content: params[:content],value: params[:value],other: params[:other],date: params[:date],category: params[:category])
    @posts.save
    if @posts.save
      flash[:notice] ="支出情報が登録されました"
      redirect_to("/")
    else
      @today = Date.today
      @categorys = Category.all
      @posts.content = params[:content]
      @posts.value = params[:value]
      @posts.other = params[:other]
      @posts.date = params[:date]
      @posts.category= params[:category]
      render("post/new")
    end
  end

  def edit
    @posts = Post.find_by(id: params[:id])
    @categorys= Category.all

  end

  def update
    @posts = Post.find_by(id: params[:id])
    @categorys = Category.all
    @posts.content = params[:content]
    @posts.value = params[:value]
    @posts.other = params[:other]
    @posts.date = params[:date]
    @posts.category= params[:category]
    @posts.save
    if @posts.save
      flash[:notice] ="支出情報が更新されました"
      redirect_to("/")
    else
      render("post/edit")
    end
  end

  def destroy
    @posts = Post.find_by(id: params[:id])
    @posts.destroy
    flash[:notice] ="支出情報が削除されました"
    redirect_to("/")
  end
end
