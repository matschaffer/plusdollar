require 'spec_helper'

describe Pledge do
  it "requires an amount" do
    subject.should_not be_valid
    subject.amount = 3.50
    subject.should be_valid
  end

  it "can fetch it's title from github" do
    subject.issue_url = "https://github.com/matschaffer/knife-solo/issues/1"

    mock_issue = double(:issue, title: "Upload cookbooks to secure location")
    subject.should_receive(:github_issue).with('matschaffer', 'knife-solo', '1').and_return mock_issue

    subject.load_title_from_github

    subject.title.should == "Upload cookbooks to secure location"
  end
end
