class ExpensesController < ApplicationController
  def show
    @expense = find_expense
  end

  private

  def find_expense
    Expense.find(params[:id])
  end
end
