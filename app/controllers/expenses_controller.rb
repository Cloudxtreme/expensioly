class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all.order(created_at: :desc)
  end

  def show
    @expense = find_expense
  end

  private

  def find_expense
    Expense.find(params[:id])
  end
end
