require 'spec_helper'

describe Pledge do
  it "requires an amount" do
    subject.should_not be_valid

    subject.amount = 3.50

    subject.should be_valid
  end
end
