require 'spec_helper'

describe "Pledges" do
  describe "GET /pledges" do

    fixtures :users

    before do
      visit pledges_path
      click_link "New Pledge"
    end
    it "works! (now write some real specs)", js: true do
      fill_in "Title", with: "A bug"
      click_button "Create Pledge"

      error_message = "Amount can't be blank"
      page.should have_content(error_message)
    end

    it "can include a user", js: true do
      fill_in "Amount", with: "3.50"

      select "Mat", from: "User"
      click_on "Create Pledge"

      page.should have_content "successful"
    end
  end
end
