class NonProfitsController < ApplicationController
  def index
    @non_profits = NonProfit.all
  end

  def show
    @non_profit = NonProfit.find(params[:id])
  end

  def new
    @non_profit = NonProfit.new
  end

  ##I will want to reserve this route/#action for the Admin (me)
  def create
    @non_profit = NonProfit.new(non_profit_params)
    category = nil
    if !(params.values_at('category').empty?)
      category = Category.create(name: params[:category])
    end

    if @non_profit.save
      flash[:notice] = "Non Profit Successfully Added"
      @non_profit.categories.push(category)
      redirect_to non_profit_path(@non_profit)
    else
      flash[:notice] = "Something happened, Let's try that again."
      render :new
    end
  end

  ##I will want to reserve this route/#action for the Admin (me)
  def edit
    @non_profit = NonProfit.find(params[:id])
  end

  ##I will want to reserve this route/#action for the Admin (me)
  def update
    @non_profit = NonProfit.find(params[:id])
    if @non_profit.update(non_profit_params)
      flash[:notice] = "NonProfit successfully updated"
      redirect_to non_profit_path(@non_profit)
    else
      flash[:notice] = "That didn't work, let's do that again."
      render :edit
    end
  end

  def destroy
    @non_profit = NonProfit.find(params[:id])
    @non_profit.destroy
    redirect_to non_profits_path
  end

  private
  def non_profit_params()
    params.require(:non_profit).permit(:name, :email, :password, :category, :location)
  end
end
