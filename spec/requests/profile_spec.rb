require 'spec_helper'

describe "A users profile", js: true do
  it "links to payment info if we don't have any" do
    sign_in
    visit profile_path
    click_on "add payment info"

    fill_in "Card number", with: "4242 4242 4242 4242"
    fill_in "Expiration", with: "12/99"
    fill_in "Name on card", with: "Mat"
    fill_in "Card code", with: "123"

    click_on "Save card"
  end

  it "links to remove payment info if we have it" do
    sign_in "mat+customer@schaffer.me"
    visit profile_path
    click_on "remove your payment info"
    page.should have_content "add payment info"
  end
end
