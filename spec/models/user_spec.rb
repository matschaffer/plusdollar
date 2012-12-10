require 'spec_helper'

describe User do
  fixtures :users

  it "is chargable when it has a customer_id" do
    user = users(:mat)
    user.should_not be_chargable
    user.customer_id = "somefakecustomerid"
    user.should be_chargable
  end
end
