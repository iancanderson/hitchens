require 'spec_helper'

describe Hitchens::Post do
  subject { Hitchens::Post.new }

  context "slugify" do
    it "should convert consecutive spaces to a single dash" do
      subject.slugify('q  werty').should == 'q-werty'
    end
    it "should convert & to and" do
      subject.slugify('pb&j').should == 'pbandj'
    end
    it "should downcase" do
      subject.slugify('IAN').should == 'ian'
    end
    it "should remove leading and trailing dashes" do
      subject.slugify('--ian--').should == 'ian'
    end
  end
end

