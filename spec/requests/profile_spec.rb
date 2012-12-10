require 'spec_helper'

describe "A users profile" do
  it "should be displayable" do
    sign_in
    visit profile_path
  end
end
