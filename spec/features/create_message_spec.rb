require 'rails_helper'
feature "Create Message" do
    before(:each) do
        visit users_new_path
        fill_in "user_username", with: "christian"
        click_button "Sign In"
        visit messages_path
    end
    scenario "successfully creates a new message" do
        fill_in "message_message", with: "Hello Village88!"
        click_button "Post a Message"
        expect(page).to have_current_path(messages_path)
        expect(page).to have_content "#{Message.last.message}"
    end
    scenario "unsuccessfully creates a new message if message field is blank" do
        click_button "Post a Message"
        expect(page).to have_current_path("/messages")
        expect(page).to have_content "Message can't be blank"
    end
    scenario "unsuccessfully creates a new message if message is less than 11 characters" do
        fill_in "message_message", with: "Hallo!"
        click_button "Post a Message"
        expect(page).to have_current_path(messages_path)
        expect(page).to have_content "Message is too short (minimum is 11 characters)"
    end
end