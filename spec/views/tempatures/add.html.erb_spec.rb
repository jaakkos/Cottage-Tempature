require 'spec_helper'

describe "/tempatures/add" do
  before(:each) do
    render 'tempatures/add'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/tempatures/add])
  end
end
