require 'spec_helper'

describe "A users profile", js: true do
  fixtures :users

  it "links to payment info if we don't have any" do
    stub_stripe_customer_api

    sign_in
    visit profile_path
    click_on "add payment info"

    fill_in "Card number", with: "4242 4242 4242 4242"

    fill_in "card-expiry-month", with: "12"
    fill_in "card-expiry-year", with: "53"

    fill_in "Card code", with: "123"

    click_on "Save Card"

    page.should have_content "remove your payment info"
  end

  it "links to remove payment info if we have it" do
    sign_in "mat+customer@schaffer.me"
    visit profile_path
    click_on "remove your payment info"
    page.should have_content "add payment info"
  end
end
