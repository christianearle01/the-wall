require 'rails_helper'

RSpec.describe User, type: :model do
  # This is our control
  context "With valid attributes" do
    it "should save" do
      expect(build(:user)).to be_valid
    end
  end
  context "With invalid attributes" do
    it "should not save if username field is blank" do
      expect(build(:user, username: "")).to be_invalid
    end
    #upon signin using an existing username it will direct to message and will not display an error
    # it "should not save if username is not unique" do
    #   create(:user)
    #   expect(build(:user)).to be_invalid
    # end
    it "should not save if username length is less than 6 characters" do
      expect(build(:user, username: "earle")).to be_invalid
    end
  end 
end
