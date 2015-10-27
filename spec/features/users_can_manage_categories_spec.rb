require "rails_helper"

feature "Users can manage categories" do
  scenario "the category index page is linked on the user's dashboard" do
    user = create(:user)
    sign_in(user)

    visit dashboard_path

    expect(page).to have_link("Manage categories", href: categories_path)
  end

  scenario "users can see a list of all categories" do
    user = create(:user)
    category = create(:category)
    sign_in(user)

    visit categories_path

    expect(page).to have_link(category.name, href: category_path(category))
  end

  scenario "users can view existing categories" do
    user = create(:user)
    category = create(:category)
    expense = create(:expense, category: category, user: user)
    sign_in(user)

    visit category_path(category)

    expect(page).to have_content(category.name)
    expect(page).to have_link(expense.name, href: expense_path(expense))
  end

  scenario "users can create new categories" do
    user = create(:user)
    category = build_stubbed(:category)
    sign_in(user)

    visit categories_path
    fill_in "Name", with: category.name
    click_on "Create category"

    expect(page).to have_link(category.name)
  end

  scenario "users can delete categories", js: true do
    user = create(:user)
    category = create(:category)
    sign_in(user)

    visit category_path(category)
    page.accept_confirm do
      click_on "Delete category!"
    end

    within "h1" do
      expect(page).to_not have_content(category.name)
    end
  end
end
