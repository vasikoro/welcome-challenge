# articles_controller_test.rb
class PostsControllerTest < ActionDispatch::IntegrationTest

  describe "index" do
    let(:post) do
      Post.create(title: "test", body: "My test post")
    end

    it "gets index" do
      get posts_url
      assert_response :success
    end

    it "lists posts" do
      post # Create the post
      get posts_url
      assert_select "main li", "test"
    end
  end

  describe "new" do
    it "gets new" do
      get new_post_url
      assert_response :success
    end
  end

  describe "create" do
    it "creates a post" do
      posts = Post.count
      post posts_url, params: { post: { title: "A blog post", body: "The body of the post" } }
      assert_redirected_to controller: :posts, action: :index
      assert_equal "Successfully created post with title 'A blog post'", flash[:notice]
      Post.count.must_equal posts + 1
    end
  end
end
