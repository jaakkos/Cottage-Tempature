require 'spec_helper'

describe Tempature do
  before(:each) do
    @valid_attributes = {
      :cottage_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Tempature.create!(@valid_attributes)
  end
end
