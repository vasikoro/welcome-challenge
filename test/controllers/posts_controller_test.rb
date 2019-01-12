# articles_controller_test.rb
class PostsControllerTest < ActionDispatch::IntegrationTest
  let(:post) do
    Post.create(title: "test", body: "My test post")
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should list posts" do
    post # Create the post
    get posts_url
    assert_select "main li", "test"
  end
end
