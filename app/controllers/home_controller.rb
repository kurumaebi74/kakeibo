class HomeController < ApplicationController
  require "date"
  def index
    @posts = Post.all.order(date: :desc)
    @today = Date.today
    @all_value = 0
    @category_value = 0
    @category_all_value =[]
    @category = Category.all

    @posts.each do |posts|
      if posts.date.month == @today.month
        @all_value = @all_value + posts.value.to_i
      end
    end

    @category.each do |category|
      @category_value = 0
      @posts.each do |posts|
        if category.content == posts.category
          @category_value += posts.value.to_i
        end
      end
      if @category_value != 0
        @category_all_value.push([category.content,@category_value])
      end
    end

  end

  def past
    @posts = Post.all.order(date: :desc)
    @today = Date.today
    @all_value = 0
  end
  
  def setting
    @cate = Category.all
    @category= Category.new
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.content = params[:content]

    if params[:budget].nil?
      @category.budget = 0
    else
      @category.budget = params[:budget]
    end

    @category.save

    if @category.save
      redirect_to("/setting")
    else
      render("home/edit")
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def addcategory
    @category = Category.new(content: params[:content],budget: params[:budget])
    if params[:budget].nil?
      @category.budget = 0
    end
    @category.save
    if @category.save
      redirect_to("/setting")
    else
      @cate = Category.all
      render("home/setting")
    end
    
  end

  def category_destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    redirect_to("/setting")
  end

end
