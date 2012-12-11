require 'spec_helper'

describe "Pledges", js: true do
  fixtures :users

  before do
    sign_in
    visit pledges_path
    click_link "New Pledge"
  end

  it "runs validations" do
    fill_in "Issue url", with: @example_url
    click_button "Create Pledge"

    error_message = "Amount can't be blank"
    page.should have_content(error_message)
  end

  def create_pledge
    fill_in "Issue url", with: @example_url
    fill_in "Amount", with: "5"
    click_on "Create Pledge"
  end

  it "prompts for a credit card when a user has no card stored" do
    create_pledge

    click_on "add payment info"

    page.should have_content "Card number"

    click_on "Save Card"
  end

  it "doesn't prompt for a credit card if the user has a stored card" do
    click_on "Logout"
    sign_in "mat+customer@schaffer.me"

    visit pledges_path
    click_link "New Pledge"
    create_pledge

    page.should have_content(@example_title)
  end
end
