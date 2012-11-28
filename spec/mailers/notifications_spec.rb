require "spec_helper"

describe Notifications do
  fixtures :users, :pledges
  describe "new_pledge" do
    let(:pledge) { pledges(:bundler_speed) }
    let(:mail) { Notifications.new_pledge(pledge) }

    it "renders the headers" do
      mail.subject.should eq("New pledge")
      mail.to.should eq([pledge.user.email])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
