require 'test_helper'

describe Post do
  subject { Post.new }

  it "validates that body is not empty" do
    subject.save.must_equal false
    subject.errors[:body].must_equal ["can't be blank"]
	end
end
