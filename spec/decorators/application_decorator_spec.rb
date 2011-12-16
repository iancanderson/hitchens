require 'spec_helper'

describe Hitchens::ApplicationDecorator do
  before { Hitchens::ApplicationController.new.set_current_view_context }
  subject { Hitchens::ApplicationDecorator.decorate(Hitchens::Post.new) }

  it "should parse markdown without blowing up" do
    subject.markdown('asdf').should == "<p>asdf</p>\n"
  end

end
