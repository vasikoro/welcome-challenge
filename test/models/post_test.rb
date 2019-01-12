require 'test_helper'

describe Post do
  subject { Post.new }

  it "asserts true" do
    subject.must_equal (subject)
	end
end
