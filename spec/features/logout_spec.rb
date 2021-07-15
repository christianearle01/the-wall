require 'rails_helper'
feature "Log Out" do
    scenario "has page contain log out button" do
        visit users_new_path
        fill_in "user_username", with: "christianearle"
        click_button "Sign In"
        expect(page).to have_content "Log Out"
        click_on "Log Out"
        have_current_path(users_new_path)
    end 
end