require "rails_helper"

feature "Users can sign in and out" do
  scenario "users can sign in" do
    user = create(:user)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest
    click_button "Sign in"

    expect(page).to have_content("Your profile")
    expect(page).to have_content(user.name)
  end

  scenario "A logged in user can sign out" do
    user = create(:user)

    sign_in(user)
    visit root_path
    click_link "Sign Out"

    expect(page).to have_link("Sign In")
  end
end
