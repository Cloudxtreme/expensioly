require "rails_helper"

feature "Users can manage expenses" do
  scenario "users can view an existing expense" do
    user = create(:user)
    expense = create(:expense, user: user)
    sign_in(user)

    visit expense_path(expense)

    expect(page).to have_content(expense.name)
    expect(page).to have_content(expense.amount.round(2))
    expect(page).to have_content(expense.user.email)
    expect(page).to have_content(expense.category.name)
  end
end
