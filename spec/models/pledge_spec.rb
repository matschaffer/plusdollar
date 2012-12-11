require 'spec_helper'

describe Pledge do
  fixtures :pledges

  it "requires an amount" do
    subject.should_not be_valid
    subject.amount = 3.50
    subject.should be_valid
  end

  it "can fetch it's title from github" do
    subject.issue_url = @example_url
    subject.load_title_from_github
    subject.title.should == @example_title
  end

  it "can be scoped to unresolved issues" do
    Pledge.unresolved.should_not include pledges(:a_closed_one)
  end
end
