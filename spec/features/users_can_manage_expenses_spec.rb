require "rails_helper"

feature "Users can manage expenses" do
  scenario "the expense index page is linked on the user's dashboard" do
    user = create(:user)
    sign_in(user)

    visit dashboard_path

    expect(page).to have_link("Manage expenses", href: expenses_path)
  end

  scenario "users can see a list of all expenses" do
    user = create(:user)
    expense = create(:expense)
    sign_in(user)

    visit expenses_path

    expect(page).to have_link(expense.name, href: expense_path(expense))
  end

  scenario "users can view an existing expense" do
    user = create(:user)
    expense = create(:expense, user: user)
    sign_in(user)

    visit expense_path(expense)

    expect(page).to have_content(expense.name)
    expect(page).to have_content(expense.amount.round(2))
    expect(page).to have_content(expense.user.name)
    expect(page).to have_content(expense.category.name)
  end
end
