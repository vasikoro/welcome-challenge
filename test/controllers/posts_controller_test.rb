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

  describe "delete" do
    it "deletes a post" do
      post = Post.create(title: "Some title", body: "Some body")
      delete post_url(id: post.id)
      ->{ post.reload }.must_raise
    end
  end

  describe "update" do
    it "updates a post" do
      post = Post.create(title: "Some title", body: "Some body")
      put post_url(id: post.id, params: { post: { title: "Updated title", body: "Updated body" }})
      post.reload
      post.title.must_equal "Updated title"
      post.body.must_equal "Updated body"
    end
  end
end
