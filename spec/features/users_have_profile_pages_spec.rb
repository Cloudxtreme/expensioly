require "rails_helper"

feature "Users have profile pages" do
  scenario "profiles list the user's expenses" do
    user = create(:user)
    expense = create(:expense, user: user)
    sign_in(user)

    visit user_path(user)

    expect(page).to have_content(user.name)
    expect(page).to have_link(expense.name, expense)
  end
end
