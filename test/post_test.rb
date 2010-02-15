require "test_helper"

class Post
  extend Permalinks::HasPermalink
  attr_accessor :title, :id
  has_permalink :title
end

class PostTest < Test::Unit::TestCase
  def setup
    @post = Post.new
    @post.title = "Something cool"
    @post.id = 1
  end

  test "regular post title" do
    assert_equal "#{@post.id}-something-cool", @post.to_param
  end

  test "post title with a lot of white spaces" do
    @post.title = " Snow is     cold   "
    assert_equal "#{@post.id}-snow-is-cold", @post.to_param
  end

  test "post title with capital letters" do
    @post.title = " SOMETHING i really like to DO   is sleeping "
    assert_equal "#{@post.id}-something-i-really-like-to-do-is-sleeping", @post.to_param
  end
end
