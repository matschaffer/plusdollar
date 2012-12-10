require 'spec_helper'

describe "A users profile", js: true do
  it "links to payment info if we don't have any" do
    sign_in
    visit profile_path
    click_on "add payment info"
  end

  it "links to remove payment info if we have it" do
    sign_in "mat+customer@schaffer.me"
    visit profile_path
    click_on "remove your payment info"
    page.should have_content "add payment info"
  end
end
