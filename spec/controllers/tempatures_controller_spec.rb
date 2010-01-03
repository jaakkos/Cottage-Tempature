require 'spec_helper'

describe TempaturesController do

  #Delete these examples and add some real ones
  it "should use TempaturesController" do
    controller.should be_an_instance_of(TempaturesController)
  end


  describe "GET 'add'" do
    it "should be successful" do
      get 'add'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
end
