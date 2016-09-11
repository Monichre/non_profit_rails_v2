class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  ##I will want to reserve this route/#action for the Admin (me)
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Successfully Added"
      redirect_to categories_path
    else
      flash[:notice] = "Something happened, Let's try that again."
      render :new
    end
  end

  ##I will want to reserve this route/#action for the Admin (me)
  def edit
    @category = Category.find(params[:id])
  end

  ##I will want to reserve this route/#action for the Admin (me)
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category successfully updated"
      redirect_to category_path(@category)
    else
      flash[:notice] = "That didn't work, let's do that again."
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
  def category_params()
    params.require(:category).permit(:name)
  end
end
