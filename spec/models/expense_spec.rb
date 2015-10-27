require "rails_helper"

describe Expense do
  describe "#category_name" do
    it "delegates to the category" do
      category = build_stubbed(:category)
      expense = build_stubbed(:expense, category: category)

      expect(expense.category_name).to eq(category.name)
    end
  end

  describe "#user_name" do
    it "delegates to the user" do
      user = build_stubbed(:user)
      expense = build_stubbed(:expense, user: user)

      expect(expense.user_name).to eq(user.name)
    end
  end
end
