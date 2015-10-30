class ExpensesController < ApplicationController
  def index
    @new_expense = Expense.new
    @expenses = Expense.all.order(created_at: :desc)
  end

  def show
    @expense = find_expense
  end

  def create
    expense = Expense.new(expense_params)

    if expense.save
      flash[:alert] = "Expense'd!"
    else
      flash[:error] = "#{expense.errors.full_messages.join(", ")}! D:"
    end

    redirect_to expenses_path
  end

  private

  def find_expense
    Expense.find(params[:id])
  end

  def expense_params
    params.
      require(:expense).
      permit(:name, :amount, :category_id, :shared).
      merge(user: current_user)
  end
end
