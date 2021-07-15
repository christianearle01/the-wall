require 'rails_helper'
feature "Register User" do
    before(:each) do
        visit users_new_path
    end
    scenario "successfully creates a new user account" do
        fill_in "user_username", with: "christianearle"
        click_button "Sign In"
        expect(page).to have_current_path("/messages")    
        expect(page).to have_content "Welcome #{User.last.username}"
    end
    scenario "unsuccessfully creates a new user account if username field is blank" do 
        click_button "Sign In"
        expect(current_path).to eq(users_new_path)
        expect(page).to have_content "Username can't be blank"
    end
    #upon signin using an existing username it will direct to message and will not display an error
    # scenario "unsuccessfully creates a new user account if username is already taken" do 
    #     fill_in "user_username", with: "christianearle"
    #     click_button "Sign In"
    #     expect(current_path).to eq(users_new_path)
    #     expect(page).to have_content "Username has already been taken"
    # end
    scenario "unsuccessfully creates a new user account if username is less than 6 characters" do 
        click_button "Sign In"
        expect(current_path).to eq(users_new_path)
        expect(page).to have_content "Username is too short (minimum is 6 characters)"
    end
end