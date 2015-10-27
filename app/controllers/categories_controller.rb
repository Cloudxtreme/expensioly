class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:name)
    @new_category = Category.new
  end

  def show
    @category = find_category
    @expenses = @category.expenses
  end

  def create
    @category = Category.new(category_params)

    if !@category.save
      flash[:error] = "#{@category.errors.full_messages.join(", ")}! D:"
    end

    redirect_to categories_path
  end

  def destroy
    @category = find_category
    @category.destroy
    flash[:alert] = "Deleted \"#{@category.name}.\""
    redirect_to categories_path
  end

  private

  def find_category
    Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
