require 'spec_helper'

describe "Pledges" do
  describe "GET /pledges" do

    fixtures :users

    before do
      sign_in
      visit pledges_path
      click_link "New Pledge"
    end

    it "works! (now write some real specs)", js: true do
      fill_in "Title", with: "A bug"
      click_button "Create Pledge"

      error_message = "Amount can't be blank"
      page.should have_content(error_message)
    end

    describe "Making a pledge", js: true do
      it "expects a description and amount" do
        fill_in "Title", with: "Spam"
        fill_in "Amount", with: "4.50"
        click_button "Create Pledge"
        page.should have_content "Spam"
      end
    end
  end
end
