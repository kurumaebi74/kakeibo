class HomeController < ApplicationController
  require "date"
  def index
    @posts = Post.all.order(date: :desc)
    @today = Date.today
    @all_value = 0
    @posts.each do |posts|
      if posts.date.month == @today.month
        @all_value = @all_value + posts.value.to_i
      end
    end
  end

  def past
    @posts = Post.all.order(date: :desc)
    @today = Date.today
    @all_value = 0
  end
  
  def setting
    @category = Category.all
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.content = params[:content]
    @category.budget = params[:budget]
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
    @category = Category.new(content: params[:content])
    @category.save
    redirect_to("/setting")
  end

  def category_destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    redirect_to("/setting")
  end

end
