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

  scenario "users can create new expenses" do
    user = create(:user)
    expense = build(:expense, shared: true)
    sign_in(user)

    visit expenses_path
    fill_in "Name", with: expense.name
    fill_in "Amount", with: expense.amount
    select(expense.category.name, from: "Category")
    check "Shared"
    click_on "Create expense"

    within ".expenses" do
      expect(page).to have_link(expense.name)
      expect(page).to have_content(expense.amount.round(2))
      expect(page).to have_link(expense.category.name)
      expect(page).to have_content("Shared!")
    end
  end

  scenario "users can edit existing expenses" do
    user = create(:user)
    expense = create(:expense, name: "Old Name")
    sign_in(user)

    visit expense_path(expense)
    click_on "Edit"
    fill_in "Name", with: "New Name"
    click_on "Update expense"

    expect(page).to have_content("New Name")
  end

  scenario "users can delete expenses" do
    user = create(:user)
    expense = create(:expense)
    sign_in(user)

    visit expense_path(expense)
    click_on "Delete"

    within "h1" do
      expect(page).to_not have_content(expense.name)
    end
  end
end
