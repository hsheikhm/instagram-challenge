require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'Login' link and a 'Sign up' link" do
      visit "/"
      expect(page).to have_link "Login"
      expect(page).to have_link "Sign up"
    end

    it "should not see a 'Sign out' link" do
      visit "/"
      expect(page).not_to have_link "Sign out"
    end
  end

  context "user signed in" do
    before { sign_up }

    it "should see a 'Sign out' link" do
      expect(page).to have_link "Sign out"
    end

    it "should not see a 'Login' link and a 'Sign up' link" do
      expect(page).not_to have_link "Login"
      expect(page).not_to have_link "Sign up"
    end
  end
end
