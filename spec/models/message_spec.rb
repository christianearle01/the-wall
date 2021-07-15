require 'rails_helper'

RSpec.describe Message, type: :model do
  # This is our control
  context "With valid attributes" do
    it "should save" do
      expect(build(:message)).to be_valid
    end
  end 
  context "With invalid attributes" do
    it "should not post if message field is blank" do
      expect(build(:message, message: "")).to be_invalid
    end
    it "should not post if message is less than 11 characters" do
      expect(build(:message, message: "Hallo!")).to be_invalid
    end
    it "should not post if user reference is empty" do
      expect(build(:message, user: nil)).to be_invalid
    end
  end
end